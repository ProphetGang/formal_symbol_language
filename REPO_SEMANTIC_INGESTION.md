# Repository Semantic Ingestion

This document explains how the FSL runtime can turn ordinary repository files into reviewable semantic objects.

The goal is not simply to scan a repository. The goal is to give a governed agent a bounded, replayable way to understand what kind of files it is looking at, what those files mean, which constraints apply, where they sit in the HTM/FSL manifold, and which claims about them can be reviewed.

## Why This Exists

A repository is not just a collection of paths.

A markdown release note, a Lean theorem source file, a Rust runtime module, a checksum manifest, and a public export manifest all have different meanings. They carry different risks, support different claims, and require different review boundaries.

Without a semantic layer, an agent can only say:

```text
this path is inside scope
```

With FSL semantic ingestion, the system can say:

```text
this path is a public documentation artifact
this path is a formal proof snapshot
this path is a runtime authority candidate
this path is release-integrity evidence
this path requires Governor review before it can support a durable claim
```

That difference matters for autonomous coding, deployment, release, and audit workflows.

## The Pipeline

The repository semantic ingestion bridge is staged:

```text
repository files
  -> file inventory
  -> path and content classification
  -> repository profile override
  -> semantic file object
  -> constraint resolution
  -> dependency and invariant context
  -> advisory admissibility
  -> HTM semantic placement
  -> bounded observer traversal
  -> optional StateProof candidate
  -> optional Rust shadow parity
```

Each stage answers a narrower question than the previous one.

File inventory asks what exists. Classification asks what kind of artifact each file appears to be. Repository profiles let a project define its own meaning for paths such as `src/kernel/**`, `proofs/**`, or `docs/**`. Constraint resolution attaches RFC 2119-style expectations to the file. Dependency context records what the file refers to. Advisory admissibility asks whether a proposed operation appears eligible, rejected, not applicable, or requiring Governor review.

Only after those stages does the system place semantic objects into the HTM/FSL manifold.

## Semantic File Objects

A semantic file object is a structured description of a file as a meaning-bearing artifact.

It can include:

- repository path;
- stable file hash;
- file kind;
- semantic role;
- language or format;
- FSL symbols;
- constraint references;
- resolved constraint statements;
- dependency edges;
- scope relationship;
- advisory admissibility status;
- evidence class;
- review confidence.

The semantic object does not authorize edits by itself. It gives the governance system a better object to reason about than a raw path string.

## HTM Placement

Once a file has a semantic object, it can be placed into the HTM/FSL manifold.

The placement is deterministic and replayable. The same file object identity, repository profile identity, and repository snapshot hash produce the same semantic-layer placement.

In plain terms:

```text
file object -> semantic layer occupant -> HTM cell/depth
```

This lets a bounded observer traverse a repository as a semantic space. A role can inspect the local neighborhood of meaning-bearing files instead of pretending it sees the whole repository at once.

The placement does not move an observer, authorize a mission, reject a Builder, or append StateProof evidence.

## FileInspector Context

FileInspector is read-only. It exists to inspect allowed files and return context before Builder work proceeds.

When paired with semantic ingestion, FileInspector can report not only what a file contains, but why that file matters in the governed system:

```text
this file is a public release note
this file participates in release integrity
this file references the Rust parity boundary
this file has constraints that require public claim boundaries
```

That makes the inspection more useful without granting FileInspector write authority.

## Bounded Observer Traversal

The semantic map can be traversed by a governed bounded observer.

That means the observer sees a bounded set of semantic objects from a given position in the manifold. A Research Agent may request a bounded TourAgent traversal over that semantic map to discover relevant files, constraints, ambiguity sources, and dependency edges.

The TourAgent result is temporary traversal evidence. It is not durable proof and not governance authorization.

## StateProof Candidate Boundary

Repository semantic observations can become StateProof candidates, but they do not automatically become StateProof evidence.

Examples of candidate-worthy summaries include:

- a repository semantic map was generated;
- file constraints were resolved;
- semantic placement replay passed;
- a scoped admissibility matrix was produced;
- a bounded traversal found the relevant semantic neighborhood.

The boundary is conservative:

```text
semantic map != StateProof
tour result != StateProof
candidate != append
Governor authorization != automatic append
```

Durable StateProof append remains governed separately.

## Rust Shadow Parity

Rust can mirror selected repository semantic records as shadow parity.

The current Rust repository semantic parity boundary can check serialized shape, classification expectations, placement metadata, advisory status, and obvious authority-escalation attempts.

It cannot:

- scan a repository by itself;
- replace Python/FSL semantic ownership;
- authorize governance;
- reject Builder work;
- expand scope;
- append StateProof;
- promote Rust authority.

Rust parity is useful because it can catch drift between the intended semantic record and a stricter runtime representation. It is not governance authority.

## Replay

If a semantic map export is available, replay it from the public package with:

```bash
python3.12 scripts/replay_repo_semantic_map.py semantic_map.json
```

The replay checks that the exported semantic map can be loaded and replayed without placement/checksum drift.

This command does not scan a live repository, authorize edits, run Lean, or append StateProof evidence. It reviews an exported semantic map artifact.

## Public Claim Boundary

This public package explains and exports the repository semantic ingestion model. It does not expose the private SiMON runtime, private governance chain, model files, local caches, or runtime authority state.

The public claim is:

```text
FSL can describe repository files as semantic objects,
place those objects into an HTM/FSL manifold,
support bounded observer traversal,
and distinguish replayable evidence from governance authority.
```

The public claim is not:

```text
Rust is governance authority.
semantic ingestion authorizes edits.
FileInspector can write files.
TourAgent traversal is durable proof.
StateProof append happens automatically.
```
