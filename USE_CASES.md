# FSL Use Cases

This repository is both a formal publication package and an adoption package. The adoption question is simple: what does FSL help a real system do?

FSL helps autonomous agent systems keep governance claims inspectable. It turns concepts such as "allowed", "in scope", "proved", "authorized", "runtime-compatible", "attested", and "published" into named records with stable identifiers, proof status, assumption boundaries, lifecycle status, and checksums.

That matters because autonomous agents do not only produce text. They act. They change files, move through state, touch infrastructure, cite proofs, and make claims about what they did. FSL exists for systems where those actions and claims must remain bounded, replayable, and reviewable.

## The World FSL Is Describing

The governed bounded observer model gives FSL a world to talk about.

In that world, an agent is not treated as an all-seeing, all-authorizing intelligence. It is a bounded observer. It has an identity, a position, a local view, a movement rule, a time/history constraint, and a governance boundary. It can act only from somewhere, at some moment, under some scope.

Space matters because the observer does not see the whole system at once. In the theorem package, spatial claims are modeled through bounded observer and HTM surface structures: cells, neighbors, movement, visibility, and non-complete observation. This gives the package a way to talk about local perception instead of pretending the agent has global omniscience.

Time matters because actions happen along a trajectory. A governed agent has history: ticks advance, identity must persist, movement cannot silently rewrite the past, and lifecycle records can be active, deprecated, or excluded. This gives the package a way to talk about continuity instead of treating each action as an isolated prompt response.

Governance matters because not every possible action is admissible. A request must be converted into a bounded mission before an implementation agent acts. That mission has allowed packages, expected delta, role boundaries, and authorization. This gives the package a way to distinguish "the agent can technically do this" from "the agent is allowed to do this."

FSL sits on top of that world. It is the symbolic language for naming the claims that arise when bounded observers act in governed space and time.

## Use Case: Governed Autonomous Coding Agent

A useful way to understand FSL is to imagine an autonomous coding agent being asked to make a production change.

At the beginning, the problem is not mathematical. It is operational. A user wants something changed, but a production system cannot treat "make this work" as an unlimited instruction. The request has to become a bounded mission: what is being changed, why the change is needed, and which files or packages the agent is allowed to touch.

That is the governance layer. It answers the first question: may this agent act in this scope?

Once the mission is authorized, the implementation agent can perform the scoped change. At that point, the system has a concrete action to account for: what changed, whether it stayed inside the declared boundary, and whether the result still satisfies the relevant rules.

This is where ordinary governance systems often become vague. They may say the change was "approved", "tested", "safe", or "verified", but those words can hide very different kinds of evidence.

FSL enters at that boundary. It does not replace mission governance. Instead, it gives the claims produced by governance stable symbolic and theorem-facing references.

A mission controls action. FSL controls how claims about that action are named, referenced, and reviewed.

For example, after a governed change, the system may need to claim that the change stayed in scope, preserved identity, followed a movement rule, respected an observer boundary, or matched a release export. FSL gives those claims stable handles instead of leaving them as loose prose.

Those handles can then point into the theorem registry. The registry connects a claim to a theorem ID, Lean declaration, proof status, lifecycle status, assumptions, and public source snapshot. That lets a reviewer distinguish between a claim that is machine checked, a claim that is machine checked under axioms, a claim that is lifecycle-attested, a claim that is runtime-only, and a claim that is merely part of the publication boundary.

The evidence package then makes the claim replayable:

```text
theorem record -> Lean source -> assumptions -> lifecycle hash -> checksum -> proof boundary
```

This is the practical value of FSL. It does not ask a reviewer to trust a broad sentence like "the agent followed governance." It gives the reviewer a path from the operational action to the symbolic claim and from the symbolic claim to the evidence boundary.

## A Walk Through The Pipeline

Suppose a user asks an agent to modify a production deployment path.

The system first converts the request into a mission. That conversion is important because it changes the request from open-ended language into a bounded object. The mission says what the agent is trying to do, what files or packages are in scope, and what kind of architectural delta is expected.

Governance then authorizes or rejects that mission. This matters because authorization is not the same as proof. Authorization answers whether the agent may act inside a declared boundary. It does not prove that every later statement about the action is true.

The implementation agent then performs the scoped change. This matters because the system now has something concrete to inspect: a before state, an after state, and a declared boundary. If the agent changes files outside the mission, the governance claim fails before any theorem discussion begins.

After the change, the system may produce claims about what happened. Some claims are operational: the changed files were inside scope, the release package was rebuilt, the checksum list matches. Some claims are formal: a theorem ID supports a boundary, a Lean declaration checks, an axiom dependency is explicit. Some claims are lifecycle claims: the theorem record is active. Some claims are runtime claims: an implementation matches reference behavior for known fixtures.

FSL keeps those claims from collapsing into one vague word. Instead of saying "verified", the package can say which evidence class is being used.

For a bounded observer, that distinction is essential. The observer can move through governed space and time, but it cannot see everything, prove everything, authorize everything, and execute everything by saying one impressive sentence. FSL gives each claim a stable place in the evidence map.

## Replaying One Claim

This package includes a concrete replay command for public review.

From the public package directory, a reviewer can run:

```bash
python3.12 scripts/replay_fsl_claim.py gbo_iii_temporal_horizon
```

That command checks the selected theorem record against `replay_matrix.json`, `theorem_lifecycle.json`, boundary documents, and `CHECKSUMS.sha256`. It reports the proof status, Lean source reference, lifecycle hash, assumption dependencies, checksum references, and claim boundary for that theorem.

For an axiom-dependent example, run:

```bash
python3.12 scripts/replay_fsl_claim.py gbo_vi_non_equivocating
```

That replay should make the boundary clear: the theorem is machine checked under explicit cryptographic/model axioms. It is not an assumption-free proof of concrete cryptography and not a runtime cryptographic implementation audit.

To list available theorem IDs:

```bash
python3.12 scripts/replay_fsl_claim.py --list
```

The replay script is not a Lean prover and not a governance authority. It does not create new proofs or authorize missions. Its purpose is narrower and more useful for review: it helps a reader traverse one public claim from theorem ID to evidence boundary without relying on author interpretation.

## What FSL Gives You That Ordinary Policy Docs Do Not

Ordinary policy documents can say what should happen. FSL gives those policy claims stable symbolic handles and evidence boundaries.

For example:

- A mission ID is not a casual task label; it is a governed action boundary.
- A theorem ID is not just a paragraph title; it points to a registry record and a Lean declaration.
- A proof status is not just a confidence phrase; it states whether the record is machine checked, axiom-dependent, partial, definition-only, or planned.
- A lifecycle hash is not a Lean proof; it is a governed status record for the theorem entry.
- A generated export is not parser authority; it is a derived publication artifact.
- A runtime parity check is not governance authority; it is implementation evidence.
- A checksum is not semantic proof; it is byte-level drift evidence.

That separation is the practical value of the package.

## Reader Paths

For practical adoption, start with:

- `README.md`
- `USE_CASES.md`
- `EVIDENCE_CLASSES.md`
- `INDEPENDENT_REPLAY.md`
- `scripts/replay_fsl_claim.py`
- `REPLAY_MATRIX.md`

For formal review, continue with:

- `formal_whitepaper.md`
- `THEOREM_REGISTRY.md`
- `theorem_registry.json`
- `theorem_lifecycle.json`
- `lean_coverage_report.md`
- `lean_coverage.json`
- `ASSUMPTIONS_APPENDIX.md`
- `lean_assumptions.json`
- `FORMAL_PROOF_BUNDLE.md`
- `CHECKSUMS.sha256`

For release verification, inspect:

- `RELEASE_NOTES.md`
- `RELEASE_POLICY.md`
- `PUBLICATION_TAG.md`
- `STATEPROOF_NOTE.md`
- `RUST_PARITY_NOTE.md`
- `RUST_AUTHORITY_CRITERIA.md`

## What This Package Is Not

This package is not a full autonomous-agent runtime, not a production deployment framework, not a replacement for Lean, not a replacement for governance execution, and not a claim that every governance axiom has been derived from first principles.

It is a public, versioned, inspectable package for a governed symbolic language and observer theorem stack.
