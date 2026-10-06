# Monotone-light factorization

This standalone Lean package proves the monotone-light factorization theorem for continuous surjections between compact Hausdorff spaces. It constructs a compact Hausdorff quotient by the connected components of the original fibers. The quotient map has connected fibers, and the induced map has totally disconnected fibers.

`MonotoneLight.exists_monotone_light_factorization` includes an exact description of the quotient kernel. `MonotoneLight.unique_monotone_light_factorization` proves that two such factorizations admit exactly one homeomorphism commuting with both maps. `MonotoneLight.isClosed_fiberRel` supplies the closed-relation step needed for the construction.

The statements allow empty spaces. They impose no metric or local-connectedness assumptions. The source is Robert J. Daverman, *Decompositions of Manifolds*, section 4, Proposition 2 and Theorem 3, printed pages 18 and 19. The formalization specializes his stronger closed-map theorem to the compact Hausdorff setting.

The package pins Lean `4.35.0-rc2` and Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`. Mathlib is its only direct dependency. With the pinned toolchain installed, run:

```sh
python3 scripts/verify.py --lake-build
```

The verifier compiles the proof from source, compiles a renamed Challenge against dependencies alone, compares all selected theorem types and universe parameters, checks the explicit `FiberRel` definition, and audits transitive axioms. `Solution.lean` has no admissions or new axioms. The Challenge contains three intentional statement holes for comparison.

Independent AI review approved the three selected theorems, the fiber-component quotient and the original 16-file public package. The approved proof and Challenge bytes remain unchanged. Parent-reported hosted mechanical verification passed for submitted commit `7f1c963eb21d2138cc5a52fff634d78ef328032e`; definition-fidelity review requested inspectable imported predicate sources.

[DEFINITIONS.md](DEFINITIONS.md) explains each material statement predicate and links the complete pinned sources in [definition-evidence](definition-evidence/README.md). The source evidence and literal Lean audit passed locally. The repaired package awaits independent review and hosted CI at its final commit. See [VERIFICATION.md](VERIFICATION.md) and [REVIEW.md](REVIEW.md).

```sh
python3 scripts/check_definitions.py --self-test --compare-mathlib
lake env lean -j1 -M3072 -DwarningAsError=true scripts/DefinitionAudit.lean
```
