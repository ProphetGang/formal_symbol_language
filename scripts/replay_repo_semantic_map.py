#!/usr/bin/env python3
"""Replay an FSL repository semantic map JSON file."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import sys

REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from fsl.repo_semantic_map import load_repo_semantic_map, replay_repo_semantic_map


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Replay an FSL repository semantic map")
    parser.add_argument("semantic_map", help="Path to semantic_map.json")
    parser.add_argument(
        "--json",
        action="store_true",
        help="Print full replay result as JSON",
    )
    args = parser.parse_args(argv)

    semantic_map = load_repo_semantic_map(args.semantic_map)
    result = replay_repo_semantic_map(semantic_map)
    payload = result.to_dict()
    if args.json:
        print(json.dumps(payload, sort_keys=True, indent=2))
    else:
        status = "valid" if result.valid else "invalid"
        print(f"semantic_map_replay: {status}")
        print(f"map_checksum_valid: {result.map_checksum_valid}")
        print(f"placement_replay_valid: {result.placement_replay_valid}")
        if result.mismatches:
            print("mismatches:")
            for mismatch in result.mismatches:
                print(f"- {mismatch}")
    return 0 if result.valid else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
