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

These checks do not establish a clean dependency rebuild, a normal Lake build, GitHub Actions execution, hosted Comparator acceptance, NanoDa or con-ron independent kernel replay, human mathematical review, or registry acceptance. Cached dependency byte identity does not prove that those artifacts were rebuilt from these sources. The public archive contains source and configuration only. Its exact whitelist is in REVIEW.md; the separate review evidence is private.
