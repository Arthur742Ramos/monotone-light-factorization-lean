/-
Copyright (c) 2026 Arthur Freitas Ramos, David Barros Hulak,
Ruy Jose Guerra Barretto de Queiroz. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Arthur Freitas Ramos, David Barros Hulak, Ruy Jose Guerra Barretto de Queiroz
-/
module
import Mathlib.Topology.Separation.Regular
import Mathlib.Topology.Connected.Clopen
import Mathlib.Topology.Connected.TotallyDisconnected
import Mathlib.Topology.Homeomorph.Lemmas

/-! Literal definition checks against the actual pinned dependency. These examples
are audit checks; they introduce no public theorem or replacement predicate. -/
open Set Function Topology
universe u v
variable {X : Type u} {Y : Type v} [TopologicalSpace X] [TopologicalSpace Y]

example (s : Set X) : IsPreconnected s ↔
    ∀ U V : Set X, IsOpen U → IsOpen V → s ⊆ U ∪ V →
      (s ∩ U).Nonempty → (s ∩ V).Nonempty → (s ∩ (U ∩ V)).Nonempty := Iff.rfl

example (s : Set X) : IsConnected s ↔ s.Nonempty ∧ IsPreconnected s := Iff.rfl

example (s : Set X) : IsTotallyDisconnected s ↔
    ∀ t : Set X, t ⊆ s → IsPreconnected t →
      ∀ ⦃a⦄, a ∈ t → ∀ ⦃b⦄, b ∈ t → a = b := Iff.rfl

example (x : X) : connectedComponent x =
    ⋃₀ {s : Set X | IsPreconnected s ∧ x ∈ s} := rfl

example (f : X → Y) (x : X) :
    connectedComponentIn (f ⁻¹' {f x}) x =
      Subtype.val '' connectedComponent (⟨x, rfl⟩ : f ⁻¹' {f x}) :=
  connectedComponentIn_eq_image (F := f ⁻¹' {f x}) (x := x) rfl

example (f : X → Y) (y : Y) (x : X) : x ∈ f ⁻¹' {y} ↔ f x = y := Iff.rfl

example (f : X → Y) : Surjective f ↔ ∀ y, ∃ x, f x = y := Iff.rfl

example (f : X → Y) : Continuous f ↔
    ∀ U : Set Y, IsOpen U → IsOpen (f ⁻¹' U) :=
  ⟨fun h => h.isOpen_preimage, fun h => ⟨h⟩⟩

example (s : Set X) : IsClosed s ↔ IsOpen sᶜ :=
  ⟨fun h => h.isOpen_compl, fun h => ⟨h⟩⟩

example : CompactSpace X ↔ IsCompact (univ : Set X) :=
  ⟨fun h => h.isCompact_univ, fun h => ⟨h⟩⟩

example (s : Set X) : IsCompact s ↔
    ∀ {ι : Type u} (U : ι → Set X), (∀ i, IsOpen (U i)) →
      s ⊆ ⋃ i, U i → ∃ t : Finset ι, s ⊆ ⋃ i ∈ t, U i :=
  isCompact_iff_finite_subcover

example : T2Space X ↔ ∀ ⦃x y : X⦄, x ≠ y →
    ∃ U V : Set X, IsOpen U ∧ IsOpen V ∧ x ∈ U ∧ y ∈ V ∧ Disjoint U V :=
  ⟨fun h => h.t2, fun h => ⟨h⟩⟩

example (s : Setoid X) (U : Set (Quotient s)) :
    IsOpen U ↔ IsOpen (Quotient.mk' ⁻¹' U) := Iff.rfl

example (h : X ≃ₜ Y) : Continuous h ∧ Continuous h.symm ∧
    LeftInverse h.symm h ∧ RightInverse h.symm h :=
  ⟨h.continuous_toFun, h.continuous_invFun, h.toEquiv.left_inv, h.toEquiv.right_inv⟩

example (p : X → Prop) : (∃! x, p x) ↔
    ∃ x, p x ∧ ∀ y, p y → y = x := Iff.rfl
