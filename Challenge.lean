/-
Copyright (c) 2026 Arthur Freitas Ramos, David Barros Hulak,
Ruy Jose Guerra Barretto de Queiroz. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Arthur Freitas Ramos, David Barros Hulak, Ruy Jose Guerra Barretto de Queiroz
-/
module
public import Mathlib.Topology.Separation.Regular
public import Mathlib.Topology.Connected.Clopen
public import Mathlib.Topology.Connected.TotallyDisconnected
public import Mathlib.Topology.Homeomorph.Lemmas

/-! Dependency-only statement surface for independent comparison. -/
@[expose] public section
open Set Function Topology
universe u v
namespace MonotoneLight
variable {X : Type u} {Y : Type v} [_tX : TopologicalSpace X] [_tY : TopologicalSpace Y]

def FiberRel (f : X → Y) (x y : X) : Prop :=
  y ∈ connectedComponentIn (f ⁻¹' {f x}) x

theorem isClosed_fiberRel [_cX : CompactSpace X] [_hX : T2Space X] [_hY : T2Space Y]
    {f : X → Y} (hf : Continuous f) : IsClosed {p : X × X | FiberRel f p.1 p.2} := by
  sorry

theorem exists_monotone_light_factorization [_cX : CompactSpace X] [_hX : T2Space X]
    [_cY : CompactSpace Y] [_hY : T2Space Y] {f : X → Y} (hf : Continuous f) (hs : Surjective f) :
    ∃ (Z : Type u) (tZ : TopologicalSpace Z), letI := tZ;
      CompactSpace Z ∧ T2Space Z ∧ ∃ (m : X → Z) (l : Z → Y),
        Continuous m ∧ Surjective m ∧ Continuous l ∧ Surjective l ∧
        f = l ∘ m ∧ (∀ z, IsConnected (m ⁻¹' {z})) ∧
        (∀ y, IsTotallyDisconnected (l ⁻¹' {y})) ∧
        (∀ x y, m x = m y ↔ FiberRel f x y) := by
  sorry

theorem unique_monotone_light_factorization [_cX : CompactSpace X] [_hX : T2Space X]
    [_cY : CompactSpace Y] [_hY : T2Space Y]
    {Z W : Type*} [_tZ : TopologicalSpace Z] [_tW : TopologicalSpace W]
    [_cZ : CompactSpace Z] [_hZ : T2Space Z] [_cW : CompactSpace W] [_hW : T2Space W]
    {f : X → Y} {m : X → Z} {l : Z → Y} {n : X → W} {k : W → Y}
    (hm : Continuous m) (hn : Continuous n) (hms : Surjective m) (hns : Surjective n)
    (hfm : f = l ∘ m) (hfn : f = k ∘ n)
    (hmc : ∀ z, IsConnected (m ⁻¹' {z})) (hnc : ∀ w, IsConnected (n ⁻¹' {w}))
    (hl : ∀ y, IsTotallyDisconnected (l ⁻¹' {y}))
    (hk : ∀ y, IsTotallyDisconnected (k ⁻¹' {y})) :
    ∃! h : Z ≃ₜ W, (fun x => h (m x)) = n ∧ l = k ∘ h := by
  sorry

end MonotoneLight
