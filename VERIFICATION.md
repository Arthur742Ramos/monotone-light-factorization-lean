# Local verification

The owner verification passed on the frozen proof and Challenge source listed below. Independent AI review also approved all selected theorems, the exposed predicate and the reviewed 16-file public package. The proof and Challenge bytes are unchanged. Review-status prose and metadata were refreshed after approval and revalidated locally; the final archive bytes passed new integrity and privacy checks.

| Check | Result |
| --- | --- |
| Fresh `Solution.lean` compilation with warnings treated as errors | Passed |
| Renamed Challenge compiled against Mathlib dependencies alone | Passed, with exactly three intentional theorem holes |
| All three selected theorem types and universe parameter lists | Complete raw expression representations matched byte for byte |
| `MonotoneLight.FiberRel` type and definition value | Matched byte for byte |
| Predicate compared with its literal fiber-component definition | Passed |
| Existence theorem instantiated on `Empty → Empty` | Passed |
| Transitive axioms of the selected theorems and predicate | Only `propext`, `Classical.choice`, `Quot.sound` |
| Admissions, new axioms and trust escapes in Solution | None |
| Module headers, Challenge size and exact dependency pins | Passed |
| Official v0.4 metadata schema | Passed, including three rejected invalid controls |
| Pinned Palomar metadata and source validators | Passed using a duplicate-rejecting JSON decoder at the YAML decoding boundary |

The exact compiler is Lean `4.35.0-rc2`, commit `11acb17ec6b07a8f9e9173e6845197929540936b`. Mathlib is pinned to `065356127b1dc0016f66b7283ce0ce2c4055aa55`. The three selected declarations are `MonotoneLight.isClosed_fiberRel`, `MonotoneLight.exists_monotone_light_factorization` and `MonotoneLight.unique_monotone_light_factorization`.

The final owner compiler-check stage ran for 51.05 seconds within a Windows Job Object limited to one CPU and 3 GiB. It used one Lean compiler at a time and one Lean thread. Peak job commit was 2,413,486,080 bytes; peak sampled aggregate resident memory was 884,727,808 bytes. The root exited with code zero, all owned processes terminated, and the checked source hashes remained unchanged during the stage. Private receipts retain commands, times, hashes and resource observations.

The independent reviewer repeated strict proof compilation, complete theorem and predicate comparisons, standard-axiom checks, and empty-space instantiations of both existence and uniqueness. The proof-check stage ran for 141.09 seconds within one CPU and 3 GiB, with peak job commit of 2,411,630,592 bytes. It exited with code zero, unchanged source hashes and no remaining owned processes. The reviewer also checked the primary mathematical source, metadata, cached dependency byte provenance, duplicate candidates and the original public archive. The changed review-status prose, metadata and final archive have not received a second independent review. No redundant proof build was run for this packaging refresh.

Source hashes:

```text
Solution.lean
7b83e63f3dc8216608c37095e86fcc4d6fb6bb9fafdd0b46db8846fde818f321
Challenge.lean
11e6b5894cf15756852b06585972f00cfe4e9d3fdcc9f14da058bcd561693c78
Selected types, universes and predicate value output
975e0c51407f467dfbc9a5e5b836ffcc21870060314e590f6569a711c62ec63b
```

The full duplicate scan covered 9,123 Lean source entries from the prior verified tracked-source inventory and freshly matched every source hash. Its 66 candidates did not supply an equivalent full factorization. This scan is not a proof of absence. Dependency qualification freshly compares every copied source and cached artifact with the permitted original cache. Revision observations are inherited from earlier verified clean-cache receipts and checked against the pinned manifest. No new shared Git operation was used.

Metadata checks use the official v0.4 schema at commit `99c678e569c7c4c0772db297c5ddd5e4c9b6322e` and PalomarSubmission validators at commit `d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44`. The metadata is JSON-form YAML. The intake check replaces only YAML decoding with a duplicate-rejecting JSON decoder; it does not establish general YAML parser behavior. The private evidence retains the official source hashes and the validator results.

The original local checks do not establish a clean dependency rebuild, a normal Lake build, GitHub Actions execution, hosted Comparator acceptance, NanoDa or con-ron independent kernel replay, human mathematical review, or registry acceptance. Cached dependency byte identity does not prove that those artifacts were rebuilt from these sources. The public archive contains source and configuration only. Its exact whitelist is in REVIEW.md; the separate review evidence is private.

## Pinned definition evidence

For submitted commit `7f1c963eb21d2138cc5a52fff634d78ef328032e`, the parent reports successful hosted mechanical verification and a definition-fidelity rejection asking for the imported topology definitions. This repair preserves Solution, Challenge, metadata, dependency pins, Comparator configuration and the existing mechanical verifier byte-for-byte.

The new dossier contains 23 complete upstream files, including the Mathlib and Lean licenses, totaling 559,868 bytes. All copied files were freshly checked against Git blobs in the upstream trees at the exact pins. The integrity checker passed for all copies and 49 indexed definitions and constructions. It also compared 19 Mathlib source files with the installed pinned dependency and rejected four negative controls: corrupted source bytes, a changed pin, a missing connectedness definition and a header-only IsConnected excerpt with matching authored hash and prose. The readable dossier's 16 literal excerpts are checked against their indexed source ranges.

The 15 examples in `scripts/DefinitionAudit.lean` compiled without warnings against the actual pinned imports. They check the connectedness predicates, subtype-fiber component formula, fiber membership, surjectivity, continuity, closedness, compactness and its finite-open-subcover equivalence, Hausdorffness, quotient topology, homeomorphism and unique-existence meaning. The successful owner stage used one CPU, one compiler thread and a 3 GiB aggregate job limit. It exited zero after 10.02 seconds, with peak job commit 1,962,496,000 bytes, unchanged source hashes and no remaining owned processes. The earlier failed audit attempt was an elaboration issue in a new example; the private evidence retains its receipt.

No proof rebuild was needed for the unchanged selected declarations. New CI steps check the dossier before the existing build, then compare installed sources and compile the literal examples after it. Hosted CI for the repaired final commit and independent review of the repair remain pending. The added definition evidence does not claim human review or registry acceptance.


Independent definition-evidence review requested the missing body of the literal `IsConnected` excerpt. Its range now includes exact pinned lines 55 and 56, with excerpt SHA256 `fc9c06588555f8d5852cfc944a8ae1d08dfb70b0316cb14903795487dc0e8b75`. Rechecking every indexed range also found and restored the final union-of-open-sets field in the `TopologicalSpace` index. Four other ranges were trimmed to their complete declaration bodies. All 49 ranges now pass a bounded top-level source-layout check. The new negative control changes both the authored hash and the prose to match a truncated header, so the missing-body guard must reject it independently of byte consistency. This check is scoped to the copied pinned source layouts and does not claim to parse arbitrary Lean code. The cross-reference index is a reading guide, not a computed transitive implementation dependency closure.

The rejected review packet was preserved privately before these changes. This correction changes prose, index ranges and the integrity checker only; the 15-example Lean audit source and its approved compiler receipt are unchanged. No compiler or dependency build was launched for this correction. Independent approval of the corrected packet and exact final hosted CI remain pending.
