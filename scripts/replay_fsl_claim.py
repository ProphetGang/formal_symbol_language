#!/usr/bin/env python3
"""Replay one public FSL theorem claim against the exported evidence package."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any


PACKAGE_REL = Path("publication") / "fsl_observer_theorem_public_repo"
REQUIRED_FILES = (
    "replay_matrix.json",
    "theorem_lifecycle.json",
    "CHECKSUMS.sha256",
)


def _script_path() -> Path:
    return Path(__file__).resolve()


def _looks_like_package(path: Path) -> bool:
    return all((path / name).is_file() for name in REQUIRED_FILES)


def _find_package_dir(explicit: str | None = None) -> Path:
    if explicit:
        package_dir = Path(explicit).expanduser().resolve()
        if not _looks_like_package(package_dir):
            raise SystemExit(f"Not a public FSL package directory: {package_dir}")
        return package_dir

    script = _script_path()
    candidates = [
        Path.cwd(),
        script.parent.parent,
        script.parent.parent / PACKAGE_REL,
        script.parent,
        script.parent / PACKAGE_REL,
    ]
    for candidate in candidates:
        candidate = candidate.resolve()
        if _looks_like_package(candidate):
            return candidate

    raise SystemExit(
        "Could not locate the public FSL package. Run from the package root, "
        "from the SiMON source root, or pass --package-dir."
    )


def _load_json(path: Path) -> dict[str, Any]:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise SystemExit(f"Invalid JSON in {path}: {exc}") from exc


def _load_checksums(path: Path) -> dict[str, str]:
    checksums: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line.strip() or "  " not in line:
            continue
        digest, artifact = line.split("  ", 1)
        checksums[artifact] = digest
    return checksums


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _records_by_id(matrix: dict[str, Any]) -> dict[str, dict[str, Any]]:
    records = matrix.get("records", [])
    if not isinstance(records, list):
        raise SystemExit("replay_matrix.json has no records list")
    by_id: dict[str, dict[str, Any]] = {}
    for record in records:
        theorem_id = record.get("theorem_id")
        if theorem_id:
            by_id[theorem_id] = record
    return by_id


def _lifecycle_hashes(lifecycle: dict[str, Any]) -> set[str]:
    hashes: set[str] = set()
    for record in lifecycle.get("records", []):
        record_hash = record.get("record_hash")
        if record_hash:
            hashes.add(record_hash)
    return hashes


def _verify_checksum_refs(package_dir: Path, record: dict[str, Any], checksums: dict[str, str]) -> list[dict[str, Any]]:
    results: list[dict[str, Any]] = []
    checksum_refs = record.get("checksum_refs", {})
    if not isinstance(checksum_refs, dict):
        return [{
            "artifact": "checksum_refs",
            "status": "FAIL",
            "reason": "checksum_refs is not an object",
        }]

    for artifact, expected_from_matrix in checksum_refs.items():
        path = package_dir / artifact
        expected_from_file = checksums.get(artifact)
        if not path.is_file():
            results.append({
                "artifact": artifact,
                "status": "FAIL",
                "reason": "artifact missing",
                "expected": expected_from_matrix,
            })
            continue
        actual = _sha256(path)
        status = "PASS"
        reason = ""
        if expected_from_file and actual != expected_from_file:
            status = "FAIL"
            reason = "actual digest does not match CHECKSUMS.sha256"
        elif expected_from_matrix and actual != expected_from_matrix:
            status = "FAIL"
            reason = "actual digest does not match replay_matrix.json"
        elif expected_from_file and expected_from_matrix and expected_from_file != expected_from_matrix:
            status = "FAIL"
            reason = "CHECKSUMS.sha256 and replay_matrix.json disagree"
        elif not expected_from_file:
            status = "WARN"
            reason = "artifact absent from CHECKSUMS.sha256"
        results.append({
            "artifact": artifact,
            "status": status,
            "digest": actual,
            "checksum_file_digest": expected_from_file,
            "matrix_digest": expected_from_matrix,
            "reason": reason,
        })
    return results


def _verify_boundary_docs(package_dir: Path, record: dict[str, Any]) -> list[dict[str, str]]:
    results: list[dict[str, str]] = []
    for doc in record.get("proof_boundary_docs", []):
        path = package_dir / doc
        results.append({
            "artifact": doc,
            "status": "PASS" if path.is_file() else "FAIL",
            "reason": "" if path.is_file() else "boundary document missing",
        })
    return results


def replay_claim(package_dir: Path, theorem_id: str) -> tuple[dict[str, Any], list[str]]:
    matrix = _load_json(package_dir / "replay_matrix.json")
    lifecycle = _load_json(package_dir / "theorem_lifecycle.json")
    checksums = _load_checksums(package_dir / "CHECKSUMS.sha256")
    records = _records_by_id(matrix)

    if theorem_id not in records:
        return {
            "theorem_id": theorem_id,
            "result": "FAIL",
            "error": "unknown theorem_id",
            "valid_theorem_ids": sorted(records),
        }, sorted(records)

    record = records[theorem_id]
    checksum_results = _verify_checksum_refs(package_dir, record, checksums)
    boundary_results = _verify_boundary_docs(package_dir, record)
    lifecycle_hash = record.get("lifecycle_record_hash")
    lifecycle_hash_present = bool(lifecycle_hash and lifecycle_hash in _lifecycle_hashes(lifecycle))

    failures = [
        item for item in checksum_results + boundary_results
        if item.get("status") == "FAIL"
    ]
    warnings = [
        item for item in checksum_results + boundary_results
        if item.get("status") == "WARN"
    ]
    if not lifecycle_hash_present:
        failures.append({
            "artifact": "theorem_lifecycle.json",
            "status": "FAIL",
            "reason": "lifecycle_record_hash not found",
        })

    result = "FAIL" if failures else "WARN" if warnings else "PASS"
    payload = {
        "theorem_id": theorem_id,
        "result": result,
        "proof_status": record.get("proof_status"),
        "coverage_status": record.get("coverage_status"),
        "lifecycle_status": record.get("lifecycle_status"),
        "lean_source": f"{record.get('lean_file')}:{record.get('lean_line')}#{record.get('lean_declaration')}",
        "lean_file": record.get("lean_file"),
        "lean_line": record.get("lean_line"),
        "lean_declaration": record.get("lean_declaration"),
        "lean_declaration_kind": record.get("lean_declaration_kind"),
        "axiom_dependencies": record.get("axiom_dependencies", []),
        "lifecycle_record_hash": lifecycle_hash,
        "lifecycle_hash_present": lifecycle_hash_present,
        "fsl_symbols": record.get("fsl_symbols", []),
        "governance_relevance": record.get("governance_relevance", []),
        "proof_boundary_docs": record.get("proof_boundary_docs", []),
        "claim_boundary": record.get("claim_boundary", ""),
        "summary": record.get("summary", ""),
        "checksum_results": checksum_results,
        "boundary_doc_results": boundary_results,
    }
    return payload, sorted(records)


def _print_text(payload: dict[str, Any], valid_ids: list[str]) -> None:
    if payload.get("error") == "unknown theorem_id":
        print(f"FSL claim replay: {payload['theorem_id']}")
        print("result: FAIL")
        print("reason: unknown theorem_id")
        print("")
        print("valid theorem IDs:")
        for theorem_id in valid_ids:
            print(f"  - {theorem_id}")
        return

    print(f"FSL claim replay: {payload['theorem_id']}")
    print(f"result: {payload['result']}")
    print(f"proof_status: {payload['proof_status']}")
    print(f"coverage_status: {payload['coverage_status']}")
    print(f"lifecycle_status: {payload['lifecycle_status']}")
    print(f"lean_source: {payload['lean_source']}")
    print(f"lifecycle_record_hash: {payload['lifecycle_record_hash']}")
    print(f"lifecycle_hash_present: {str(payload['lifecycle_hash_present']).lower()}")
    print("")
    print("summary:")
    print(f"  {payload['summary']}")
    print("")
    print("claim_boundary:")
    print(f"  {payload['claim_boundary']}")
    print("")
    print("axiom_dependencies:")
    axioms = payload.get("axiom_dependencies") or []
    if axioms:
        for axiom in axioms:
            print(f"  - {axiom}")
    else:
        print("  none")
    print("")
    print("proof_boundary_docs:")
    for doc in payload.get("proof_boundary_docs", []):
        print(f"  - {doc}")
    print("")
    print("checksum_refs:")
    for item in payload.get("checksum_results", []):
        reason = f" ({item['reason']})" if item.get("reason") else ""
        print(f"  - {item['artifact']}: {item['status']}{reason}")


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("theorem_id", nargs="?", help="The theorem_id to replay")
    parser.add_argument("--package-dir", help="Path to the public FSL package directory")
    parser.add_argument("--json", action="store_true", help="Emit machine-readable JSON")
    parser.add_argument("--list", action="store_true", help="List available theorem IDs")
    args = parser.parse_args(argv)

    package_dir = _find_package_dir(args.package_dir)
    matrix = _load_json(package_dir / "replay_matrix.json")
    valid_ids = sorted(_records_by_id(matrix))

    if args.list:
        if args.json:
            print(json.dumps({"package_dir": str(package_dir), "theorem_ids": valid_ids}, indent=2))
        else:
            for theorem_id in valid_ids:
                print(theorem_id)
        return 0

    if not args.theorem_id:
        parser.error("theorem_id is required unless --list is used")

    payload, valid_ids = replay_claim(package_dir, args.theorem_id)
    if args.json:
        print(json.dumps(payload, indent=2, ensure_ascii=False))
    else:
        _print_text(payload, valid_ids)
    return 0 if payload.get("result") in {"PASS", "WARN"} else 1


if __name__ == "__main__":
    sys.exit(main())
