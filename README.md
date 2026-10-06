# Monotone-light factorization

This standalone Lean package proves the monotone-light factorization theorem for continuous surjections between compact Hausdorff spaces. It constructs a compact Hausdorff quotient by the connected components of the original fibers. The quotient map has connected fibers, and the induced map has totally disconnected fibers.

`MonotoneLight.exists_monotone_light_factorization` includes an exact description of the quotient kernel. `MonotoneLight.unique_monotone_light_factorization` proves that two such factorizations admit exactly one homeomorphism commuting with both maps. `MonotoneLight.isClosed_fiberRel` supplies the closed-relation step needed for the construction.

The statements allow empty spaces. They impose no metric or local-connectedness assumptions. The source is Robert J. Daverman, *Decompositions of Manifolds*, section 4, Proposition 2 and Theorem 3, printed pages 18 and 19. The formalization specializes his stronger closed-map theorem to the compact Hausdorff setting.

The package pins Lean `4.35.0-rc2` and Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`. Mathlib is its only direct dependency. With the pinned toolchain installed, run:

```sh
python3 scripts/verify.py --lake-build
```

The verifier compiles the proof from source, compiles a renamed Challenge against dependencies alone, compares all selected theorem types and universe parameters, checks the explicit `FiberRel` definition, and audits transitive axioms. `Solution.lean` has no admissions or new axioms. The Challenge contains three intentional statement holes for comparison.

Independent AI review approved the three selected theorems, the fiber-component quotient and the reviewed 16-file public package. The approved proof and Challenge bytes are unchanged. The final review-status prose and metadata were revalidated locally. Local verification uses copied pinned dependency artifacts; a clean dependency rebuild, normal Lake build, CI execution, hosted Comparator, independent kernel replay and human mathematical review remain unrun. See [VERIFICATION.md](VERIFICATION.md) and [REVIEW.md](REVIEW.md).
