# Meanings of the pinned topology definitions

The selected statements in `Challenge.lean` use Mathlib commit `065356127b1dc0016f66b7283ce0ce2c4055aa55` and Lean 4.35.0-rc2, commit `11acb17ec6b07a8f9e9173e6845197929540936b`. The [source index](definition-evidence/README.md) links complete, unchanged files stored in this repository. The [manifest](definition-evidence/manifest.json) records their exact upstream paths, commits, Git blobs, SHA256 hashes, licenses and definition line ranges. Each copied file was checked against the GitHub tree at its stated commit. Original author headers and upstream Apache 2.0 licenses are preserved.

The copies have a `.txt` suffix and do not supply Lean dependencies. Compilation uses the ordinary pinned Mathlib dependency. `scripts/check_definitions.py` checks the copies, the excerpt hashes, the pins, the predicate inventory and the frozen Solution and Challenge hashes. Its `--compare-mathlib` option also compares the copies with the installed dependency source. `scripts/DefinitionAudit.lean` checks literal expansions against the actual imported declarations. These checks support inspection of the definitions; the mathematical interpretations below remain available for review.

## Statement inventory

The material predicates in the three selected statements are `MonotoneLight.FiberRel`, `IsClosed`, `CompactSpace`, `T2Space`, `Continuous`, `Function.Surjective`, `IsConnected`, `IsTotallyDisconnected`, `Homeomorph` (notation `≃ₜ`) and `ExistsUnique` (notation `∃!`). `connectedComponentIn` appears in the exposed `FiberRel` definition. Set membership, singleton, preimage, subset and function equality have their usual literal set and logical meanings, with the supporting source definitions in the index. No additional nonempty, metric or local connectedness hypothesis occurs in the statement surface.

## Connectedness and fiber components

The following excerpts are copied literally from the indexed sources.

[IsPreconnected](definition-evidence/mathlib/Mathlib/Topology/Connected/Basic.lean.txt#L50):

```lean
def IsPreconnected (s : Set α) : Prop :=
  ∀ u v : Set α, IsOpen u → IsOpen v → s ⊆ u ∪ v → (s ∩ u).Nonempty → (s ∩ v).Nonempty →
    (s ∩ (u ∩ v)).Nonempty
```

[IsConnected](definition-evidence/mathlib/Mathlib/Topology/Connected/Basic.lean.txt#L55):

```lean
def IsConnected (s : Set α) : Prop :=
  s.Nonempty ∧ IsPreconnected s
```

[connectedComponent](definition-evidence/mathlib/Mathlib/Topology/Connected/Basic.lean.txt#L495):

```lean
def connectedComponent (x : α) : Set α :=
  ⋃₀ { s : Set α | IsPreconnected s ∧ x ∈ s }
```

[connectedComponentIn](definition-evidence/mathlib/Mathlib/Topology/Connected/Basic.lean.txt#L505):

```lean
noncomputable def connectedComponentIn (F : Set α) (x : α) : Set α :=
  if h : x ∈ F then (↑) '' connectedComponent (⟨x, h⟩ : F) else ∅
```

`IsPreconnected s` excludes a separation of `s` by two relatively open pieces: if two ambient open sets cover `s` and both meet it, their intersection must meet it. Open sets in a subtype are preimages of ambient open sets under the inclusion, as the copied `TopologicalSpace.induced` and subtype topology instance specify. Thus this is the usual preconnectedness of the subspace. `IsConnected s` additionally requires a point of `s`.

`connectedComponent x` is the union of all preconnected subsets containing `x`. The source also proves `mem_connectedComponent`, `isConnected_connectedComponent` and the maximality of the component. These properties identify it with the usual connected component containing `x`.

For `F = f ⁻¹' {f x}`, the condition `x ∈ F` holds because `f x = f x`. Consequently `connectedComponentIn F x` takes the first branch, the image under inclusion of the connected component of `⟨x, h⟩` in the subtype `F`. The subtype has the induced topology. Therefore the unchanged definition

```lean
def FiberRel (f : X → Y) (x y : X) : Prop :=
  y ∈ connectedComponentIn (f ⁻¹' {f x}) x
```

identifies exactly points in the same connected component of the fiber of `f` through `x`. The component lies within that fiber, so related points have the same `f` value. `scripts/DefinitionAudit.lean` checks the image formula for this actual fiber, including membership of `x`.

The proof's middle space is `Quotient (fiberSetoid f)` with this relation. The copied Lean `Setoid` and `Quotient` definitions and Mathlib quotient topology instance show the construction used: the equivalence-class quotient has the coinduced topology, in which a set is open exactly when its preimage under the quotient map is open. `Solution.lean` proves Hausdorffness for this quotient from the closed relation. Its kernel assertion is the literal equivalence `m x = m y ↔ FiberRel f x y`.

## Connected and totally disconnected fibers

[IsTotallyDisconnected](definition-evidence/mathlib/Mathlib/Topology/Connected/TotallyDisconnected.lean.txt#L36):

```lean
def IsTotallyDisconnected (s : Set α) : Prop :=
  ∀ t, t ⊆ s → IsPreconnected t → t.Subsingleton
```

[Set.Subsingleton](definition-evidence/mathlib/Mathlib/Data/Set/Subsingleton.lean.txt#L36):

```lean
protected def Subsingleton (s : Set α) : Prop :=
  ∀ ⦃x⦄ (_ : x ∈ s) ⦃y⦄ (_ : y ∈ s), x = y
```

The set `g ⁻¹' {z}` is exactly `{x | g x = z}`: preimage membership means membership of `g x` in the singleton, whose definition is equality to `z`. The audit checks this expansion directly.

Thus `∀ z, IsConnected (m ⁻¹' {z})` says every first-map fiber is nonempty and connected in its induced topology. Surjectivity supplies nonempty fibers for each actual `z`. If the target is empty, this universal quantifier is vacuous, consistently with the theorem's permitted empty spaces.

`∀ y, IsTotallyDisconnected (l ⁻¹' {y})` says every preconnected subset of each second-map fiber has at most one point. In particular every connected subset has at most one point. Conversely, a nonempty preconnected subset is connected by the literal definition of `IsConnected`, while an empty subset has at most one point. Hence this is precisely total disconnectedness of every second-map fiber. Empty fibers are allowed. This condition concerns points within each fiber as well as points having different images.

## Compactness, separation and continuity

[CompactSpace](definition-evidence/mathlib/Mathlib/Topology/Defs/Filter.lean.txt#L297):

```lean
class CompactSpace : Prop where
  /-- In a compact space, `Set.univ` is a compact set. -/
  isCompact_univ : IsCompact (Set.univ : Set X)
```

[IsCompact](definition-evidence/mathlib/Mathlib/Topology/Defs/Filter.lean.txt#L290):

```lean
def IsCompact (s : Set X) :=
  ∀ ⦃f⦄ [NeBot f], f ≤ 𝓟 s → ∃ x ∈ s, ClusterPt x f
```

[isCompact_iff_finite_subcover](definition-evidence/mathlib/Mathlib/Topology/Compactness/Compact.lean.txt#L386):

```lean
theorem isCompact_iff_finite_subcover :
    IsCompact s ↔ ∀ {ι : Type u} (U : ι → Set X),
      (∀ i, IsOpen (U i)) → (s ⊆ ⋃ i, U i) → ∃ t : Finset ι, s ⊆ ⋃ i ∈ t, U i :=
  ⟨fun hs => hs.elim_finite_subcover, isCompact_of_finite_subcover⟩
```

[T2Space](definition-evidence/mathlib/Mathlib/Topology/Separation/Hausdorff.lean.txt#L85):

```lean
class T2Space (X : Type u) [TopologicalSpace X] : Prop where
  /-- Every two points in a Hausdorff space admit disjoint open neighbourhoods. -/
  t2 : Pairwise fun x y => ∃ u v : Set X, IsOpen u ∧ IsOpen v ∧ x ∈ u ∧ y ∈ v ∧ Disjoint u v
```

[Continuous](definition-evidence/mathlib/Mathlib/Topology/Defs/Basic.lean.txt#L155):

```lean
structure Continuous (f : X → Y) : Prop where
  /-- The preimage of an open set under a continuous function is an open set. Use `IsOpen.preimage`
  instead. -/
  isOpen_preimage : ∀ s, IsOpen s → IsOpen (f ⁻¹' s)
```

[IsClosed](definition-evidence/mathlib/Mathlib/Topology/Defs/Basic.lean.txt#L107):

```lean
class IsClosed (s : Set X) : Prop where
  /-- The complement of a closed set is an open set. -/
  isOpen_compl : IsOpen sᶜ
```

`CompactSpace X` says the entire space is `IsCompact`. Its filter definition requires a cluster point in the set for each nontrivial filter concentrated there. The copied `ClusterPt`, `nhds`, `Filter.NeBot`, principal filter and filter operations make that definition inspectable. The quoted equivalence theorem states the usual finite-open-subcover property; the audit checks this exact equivalence against the imported theorem. The empty space satisfies compactness.

`Pairwise` quantifies over distinct points. Therefore `T2Space` is the Hausdorff condition: each pair of distinct points admits disjoint open neighborhoods. `Set.disjoint_left` in the source index reduces set disjointness to having no common point. The class imposes no nonempty assumption.

`Continuous f` requires every open set to have an open preimage, and `IsClosed s` requires its complement to be open. The closed-relation theorem uses the ordinary product topology on `X × X`; its set is `{p | FiberRel f p.1 p.2}`.

## Surjections and the canonical homeomorphism

[Homeomorph](definition-evidence/mathlib/Mathlib/Topology/Homeomorph/Defs.lean.txt#L43):

```lean
structure Homeomorph (X : Type*) (Y : Type*) [TopologicalSpace X] [TopologicalSpace Y]
    extends X ≃ Y where
  /-- The forward map of a homeomorphism is a continuous function. -/
  continuous_toFun : Continuous toFun := by
    first | fun_prop | eta_expand; dsimp; fun_prop | skip
  /-- The inverse map of a homeomorphism is a continuous function. -/
  continuous_invFun : Continuous invFun := by
    first | fun_prop | eta_expand; dsimp; fun_prop | skip
```

[Equiv](definition-evidence/mathlib/Mathlib/Logic/Equiv/Defs.lean.txt#L67):

```lean
structure Equiv (α β : Sort*) where
  /-- The forward map of an equivalence.

  Do NOT use directly. Use the coercion instead. -/
  protected toFun : α → β
  /-- The backward map of an equivalence.

  Do NOT use `e.invFun` directly. Use the coercion of `e.symm` instead. -/
  protected invFun : β → α
  protected left_inv : LeftInverse invFun toFun := by intro; first | rfl | ext <;> rfl
  protected right_inv : RightInverse invFun toFun := by intro; first | rfl | ext <;> rfl
```

[Function.Surjective](definition-evidence/lean/src/Init/Data/Function.lean.txt#L62):

```lean
def Surjective (f : α → β) : Prop :=
  ∀ b, Exists fun a => f a = b
```

[ExistsUnique](definition-evidence/mathlib/Mathlib/Basic/ExistsUnique.lean.txt#L22):

```lean
def ExistsUnique (p : α → Prop) := ∃ x, p x ∧ ∀ y, p y → y = x
```

`Equiv` contains forward and inverse maps with both inverse identities. `Homeomorph` adds continuity of both maps. Thus `∃! h : Z ≃ₜ W, (fun x => h (m x)) = n ∧ l = k ∘ h` asserts exactly one homeomorphism commuting with the first maps and the second maps. Function equality and composition express the identities pointwise as `h (m x) = n x` and `l z = k (h z)`. The source definition of `ExistsUnique` quantifies over every candidate satisfying those identities.

The uniqueness hypotheses require continuity and surjectivity of the first maps, connected first-map fibers, totally disconnected second-map fibers and both factorization identities, with all four spaces compact Hausdorff. They encompass the ordinary monotone-light factorizations stated in the existence theorem. No replacement topology predicate or weaker fiber condition is introduced by this dossier.

## Verification scope

`Solution.lean` and `Challenge.lean` retain their submitted hashes, recorded in the manifest. The dossier is source evidence added for definition-fidelity review. It changes neither the selected theorem types nor their proofs. The new CI checks validate the source evidence and compile the literal audit examples after the existing build and mechanical verification. Final hosted CI and independent review of the repaired package must be confirmed for the final commit before publication or resubmission.
