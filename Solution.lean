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

/-! Monotone-light factorization for continuous surjections of compact Hausdorff spaces.
The quotient collapses exactly the connected components of the original fibers.
The separation argument follows Daverman, Decompositions of Manifolds, section 4.
-/
@[expose] public section
open Set Function Topology
universe u v
namespace MonotoneLight
variable {X : Type u} {Y : Type v} [_tX : TopologicalSpace X] [_tY : TopologicalSpace Y]

/-- Two points lie in the same connected component of a fiber. -/
def FiberRel (f : X → Y) (x y : X) : Prop :=
  y ∈ connectedComponentIn (f ⁻¹' {f x}) x

omit [TopologicalSpace Y] in
theorem FiberRel.map_eq {f : X → Y} {x y : X} (h : FiberRel f x y) : f y = f x :=
  show f y ∈ ({f x} : Set Y) from
    connectedComponentIn_subset (f ⁻¹' {f x}) x h

def fiberSetoid (f : X → Y) : Setoid X where
  r := FiberRel f
  iseqv := {
    refl := fun x => mem_connectedComponentIn rfl
    symm := by
      intro x y h
      have he := h.map_eq
      change x ∈ connectedComponentIn (f ⁻¹' {f y}) y
      rw [he, ← connectedComponentIn_eq h]
      exact mem_connectedComponentIn rfl
    trans := by
      intro x y z hxy hyz
      change z ∈ connectedComponentIn (f ⁻¹' {f x}) x
      rw [connectedComponentIn_eq hxy]
      simpa only [FiberRel, hxy.map_eq] using hyz }

private theorem fiber_pair_separation [_cX : CompactSpace X] [_hX : T2Space X] [_hY : T2Space Y]
    {f : X → Y} (hf : Continuous f) {x y : X}
    (he : f y = f x) (hn : ¬ FiberRel f x y) :
    ∃ A B : Set X, IsOpen A ∧ IsOpen B ∧ x ∈ A ∧ y ∈ B ∧
      ∀ a ∈ A, ∀ b ∈ B, ¬ FiberRel f a b := by
  let F := f ⁻¹' {f x}
  have hF : IsClosed F := isClosed_singleton.preimage hf
  have : CompactSpace F := isCompact_iff_compactSpace.mp hF.isCompact
  let a : F := ⟨x, rfl⟩
  let b : F := ⟨y, he⟩
  have hb : b ∉ connectedComponent a := by
    intro hb
    apply hn
    rw [FiberRel, connectedComponentIn_eq_image (show x ∈ F from rfl)]
    exact ⟨b, hb, rfl⟩
  rw [connectedComponent_eq_iInter_isClopen] at hb
  simp only [mem_iInter, Subtype.forall, not_forall] at hb
  obtain ⟨s, hs, hbs⟩ := hb
  have hsc : IsClosed (Subtype.val '' s : Set X) :=
    (hs.1.isClosed.isCompact.image continuous_subtype_val).isClosed
  have htc : IsClosed (Subtype.val '' sᶜ : Set X) :=
    (hs.1.compl.isClosed.isCompact.image continuous_subtype_val).isClosed
  have hdis : Disjoint (Subtype.val '' s : Set X) (Subtype.val '' sᶜ) := by
    exact disjoint_image_of_injective Subtype.val_injective disjoint_compl_right
  obtain ⟨U, V, hU, hV, hsU, htV, hUV⟩ := normal_separation hsc htc hdis
  have hcover : F ⊆ U ∪ V := by
    intro z hz
    by_cases hzs : (⟨z, hz⟩ : F) ∈ s
    · exact Or.inl (hsU ⟨⟨z, hz⟩, hzs, rfl⟩)
    · exact Or.inr (htV ⟨⟨z, hz⟩, hzs, rfl⟩)
  let W := (f '' (U ∪ V)ᶜ)ᶜ
  have hW : IsOpen W := (hf.isClosedMap _ (hU.union hV).isClosed_compl).isOpen_compl
  have hxW : f x ∈ W := by
    rintro ⟨z, hz, hze⟩
    exact hz (hcover hze)
  have hfull : f ⁻¹' W ⊆ U ∪ V := by
    intro z hz
    by_contra h
    exact hz ⟨z, h, rfl⟩
  refine ⟨U ∩ f ⁻¹' W, V ∩ f ⁻¹' W, hU.inter (hW.preimage hf),
    hV.inter (hW.preimage hf), ⟨hsU ⟨a, hs.2, rfl⟩, hxW⟩,
    ⟨htV ⟨b, hbs, rfl⟩, show f y ∈ W by rw [he]; exact hxW⟩, ?_⟩
  rintro p ⟨hpU, hpW⟩ q ⟨hqV, _⟩ hpq
  have hc : connectedComponentIn (f ⁻¹' {f p}) p ⊆ U ∪ V := by
    intro z hz
    apply hfull
    change f z ∈ W
    rw [connectedComponentIn_subset _ _ hz]
    exact hpW
  have hd := isPreconnected_connectedComponentIn.subset_or_subset hU hV hUV hc
  rcases hd with hd | hd
  · exact disjoint_left.mp hUV (hd hpq) hqV
  · exact disjoint_left.mp hUV hpU (hd (mem_connectedComponentIn rfl))

/-- The fiber-component equivalence relation is closed. -/
theorem isClosed_fiberRel [_cX : CompactSpace X] [_hX : T2Space X] [_hY : T2Space Y]
    {f : X → Y} (hf : Continuous f) : IsClosed {p : X × X | FiberRel f p.1 p.2} := by
  rw [← isOpen_compl_iff, isOpen_iff_mem_nhds]
  rintro ⟨x, y⟩ hn
  by_cases he : f y = f x
  · obtain ⟨A, B, hA, hB, hx, hy, hab⟩ := fiber_pair_separation hf he hn
    exact Filter.mem_of_superset ((hA.prod hB).mem_nhds ⟨hx, hy⟩)
      (fun p hp => hab p.1 hp.1 p.2 hp.2)
  · have ho : IsOpen {p : X × X | f p.2 ≠ f p.1} :=
      (isClosed_eq (hf.comp continuous_snd) (hf.comp continuous_fst)).isOpen_compl
    exact Filter.mem_of_superset (ho.mem_nhds he) (fun p hp hr => hp hr.map_eq)

/-- The intermediate space, with its quotient topology. -/
abbrev Middle (f : X → Y) := Quotient (fiberSetoid f)

/-- The map collapsing the components of each original fiber. -/
def monotone (f : X → Y) : X → Middle f := Quotient.mk (fiberSetoid f)

omit [TopologicalSpace Y] in
theorem monotone_eq_iff {f : X → Y} {x y : X} :
    monotone f x = monotone f y ↔ FiberRel f x y := Quotient.eq

omit [TopologicalSpace Y] in
theorem continuous_monotone (f : X → Y) : Continuous (monotone f) :=
  continuous_quotient_mk'

omit [TopologicalSpace Y] in
theorem surjective_monotone (f : X → Y) : Surjective (monotone f) :=
  Quotient.mk_surjective

theorem isClosedMap_monotone [_cX : CompactSpace X] [_hX : T2Space X] [_hY : T2Space Y]
    {f : X → Y} (hf : Continuous f) : IsClosedMap (monotone f) := by
  intro s hs
  apply isQuotientMap_quotient_mk'.isCoinducing.isClosed_preimage.mp
  have hc : IsClosed {p : X × X | FiberRel f p.1 p.2 ∧ p.2 ∈ s} :=
    (isClosed_fiberRel hf).inter (hs.preimage continuous_snd)
  have he : monotone f ⁻¹' (monotone f '' s) =
      Prod.fst '' {p : X × X | FiberRel f p.1 p.2 ∧ p.2 ∈ s} := by
    ext x
    constructor
    · rintro ⟨y, hy, hxy⟩
      exact ⟨(x, y), ⟨monotone_eq_iff.mp hxy.symm, hy⟩, rfl⟩
    · rintro ⟨⟨z, y⟩, ⟨hzy, hy⟩, rfl⟩
      exact ⟨y, hy, (monotone_eq_iff.mpr hzy).symm⟩
  change IsClosed (monotone f ⁻¹' (monotone f '' s))
  rw [he]
  exact (hc.isCompact.image continuous_fst).isClosed

/-- The fiber-component quotient of a compact Hausdorff space is Hausdorff. -/
theorem middle_t2Space [_cX : CompactSpace X] [_hX : T2Space X] [_hY : T2Space Y]
    {f : X → Y} (hf : Continuous f) : T2Space (Middle f) := by
  have hm := isClosedMap_monotone hf
  have hqc : ∀ q : Middle f, IsClosed (monotone f ⁻¹' {q}) := by
    intro q
    obtain ⟨x, rfl⟩ := surjective_monotone f q
    have hc : IsClosed {z : X | FiberRel f x z} :=
      (isClosed_fiberRel hf).preimage
        (show Continuous (fun z : X => (x, z)) from continuous_const.prodMk continuous_id)
    convert hc using 1
    ext z
    exact (monotone_eq_iff.trans ⟨(fiberSetoid f).symm, (fiberSetoid f).symm⟩)
  refine ⟨fun q r hqr => ?_⟩
  have hd : Disjoint (monotone f ⁻¹' {q}) (monotone f ⁻¹' {r}) := by
    apply disjoint_left.mpr
    intro x hx hy
    exact hqr (hx.symm.trans hy)
  obtain ⟨U, V, hU, hV, hqU, hrV, hUV⟩ := normal_separation (hqc q) (hqc r) hd
  refine ⟨kernImage (monotone f) U, kernImage (monotone f) V,
    isClosedMap_iff_kernImage.mp hm hU, isClosedMap_iff_kernImage.mp hm hV,
    hqU, hrV, ?_⟩
  apply disjoint_left.mpr
  intro z hzU hzV
  obtain ⟨x, rfl⟩ := surjective_monotone f z
  exact disjoint_left.mp hUV (hzU rfl) (hzV rfl)

/-- The induced map from the quotient to the original codomain. -/
def light (f : X → Y) : Middle f → Y :=
  Quotient.lift f (fun _ _ h => h.map_eq.symm)

omit [TopologicalSpace Y] in
@[simp] theorem light_monotone (f : X → Y) (x : X) :
    light f (monotone f x) = f x := rfl

theorem continuous_light {f : X → Y} (hf : Continuous f) : Continuous (light f) :=
  hf.quotient_lift _

omit [TopologicalSpace Y] in
theorem surjective_light {f : X → Y} (hf : Surjective f) : Surjective (light f) := by
  intro y
  obtain ⟨x, rfl⟩ := hf y
  exact ⟨monotone f x, rfl⟩

omit [TopologicalSpace Y] in
theorem connected_monotone_fiber (f : X → Y) (z : Middle f) :
    IsConnected (monotone f ⁻¹' {z}) := by
  obtain ⟨x, rfl⟩ := surjective_monotone f z
  have he : monotone f ⁻¹' {monotone f x} = connectedComponentIn (f ⁻¹' {f x}) x := by
    ext y
    exact monotone_eq_iff.trans ⟨(fiberSetoid f).symm, (fiberSetoid f).symm⟩
  rw [he]
  exact isConnected_connectedComponentIn_iff.mpr rfl

theorem totallyDisconnected_light_fiber [_cX : CompactSpace X] [_hX : T2Space X] [_hY : T2Space Y]
    {f : X → Y} (hf : Continuous f) (y : Y) :
    IsTotallyDisconnected (light f ⁻¹' {y}) := by
  have : T2Space (Middle f) := middle_t2Space hf
  intro t ht htc q hq r hr
  have hcl : closure t ⊆ light f ⁻¹' {y} :=
    closure_minimal ht (isClosed_singleton.preimage (continuous_light hf))
  have hconn : IsConnected (closure t) := ⟨⟨q, subset_closure hq⟩, htc.closure⟩
  have hpre : IsConnected (monotone f ⁻¹' closure t) :=
    isQuotientMap_quotient_mk'.isCoinducing.isConnected_preimage_of_isClosed
      (connected_monotone_fiber f) isClosed_closure hconn
  obtain ⟨a, rfl⟩ := surjective_monotone f q
  obtain ⟨b, rfl⟩ := surjective_monotone f r
  have ha : a ∈ monotone f ⁻¹' closure t := subset_closure hq
  have hb : b ∈ monotone f ⁻¹' closure t := subset_closure hr
  have hsub : monotone f ⁻¹' closure t ⊆ f ⁻¹' {f a} := by
    intro z hz
    have hzY : f z = y := hcl hz
    have haY : f a = y := hcl ha
    exact hzY.trans haY.symm
  exact monotone_eq_iff.mpr (hpre.2.subset_connectedComponentIn ha hsub hb)

/-- Every continuous surjection of compact Hausdorff spaces has a monotone-light
factorization. The final equivalence specifies exactly which points the quotient identifies.
Empty spaces are permitted. -/
theorem exists_monotone_light_factorization [_cX : CompactSpace X] [_hX : T2Space X]
    [_cY : CompactSpace Y] [_hY : T2Space Y] {f : X → Y} (hf : Continuous f) (hs : Surjective f) :
    ∃ (Z : Type u) (tZ : TopologicalSpace Z), letI := tZ;
      CompactSpace Z ∧ T2Space Z ∧ ∃ (m : X → Z) (l : Z → Y),
        Continuous m ∧ Surjective m ∧ Continuous l ∧ Surjective l ∧
        f = l ∘ m ∧ (∀ z, IsConnected (m ⁻¹' {z})) ∧
        (∀ y, IsTotallyDisconnected (l ⁻¹' {y})) ∧
        (∀ x y, m x = m y ↔ FiberRel f x y) := by
  refine ⟨Middle f, inferInstance, ?_, middle_t2Space hf, monotone f, light f,
    continuous_monotone f, surjective_monotone f, continuous_light hf,
    surjective_light hs, rfl, connected_monotone_fiber f,
    totallyDisconnected_light_fiber hf, fun _ _ => monotone_eq_iff⟩
  exact Quotient.compactSpace

omit [TopologicalSpace Y] in
private theorem kernel_of_factorization {Z : Type*} [_tZ : TopologicalSpace Z]
    {f : X → Y} {m : X → Z} {l : Z → Y} (hm : Continuous m) (he : f = l ∘ m)
    (hmc : ∀ z, IsConnected (m ⁻¹' {z}))
    (hl : ∀ y, IsTotallyDisconnected (l ⁻¹' {y})) (x y : X) :
    FiberRel f x y ↔ m x = m y := by
  constructor
  · intro hxy
    let C := connectedComponentIn (f ⁻¹' {f x}) x
    have hc : IsPreconnected (m '' C) :=
      isPreconnected_connectedComponentIn.image m hm.continuousOn
    have hsub : m '' C ⊆ l ⁻¹' {f x} := by
      rintro z ⟨a, ha, rfl⟩
      change l (m a) = f x
      exact (congrFun he a).symm.trans
        (show f a ∈ ({f x} : Set Y) from
          connectedComponentIn_subset (f ⁻¹' {f x}) x ha)
    exact hl (f x) (m '' C) hsub hc
      ⟨x, mem_connectedComponentIn rfl, rfl⟩ ⟨y, hxy, rfl⟩
  · intro hxy
    have hs : m ⁻¹' {m x} ⊆ f ⁻¹' {f x} := by
      intro a ha
      change m a = m x at ha
      change f a = f x
      rw [he]
      exact congrArg l ha
    exact (hmc (m x)).2.subset_connectedComponentIn rfl hs hxy.symm

/-- Any two monotone-light factorizations are related by exactly one commuting
homeomorphism. No nonemptiness premise is needed. -/
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
  classical
  have hker : ∀ x y, m x = m y ↔ n x = n y := fun x y =>
    (kernel_of_factorization hm hfm hmc hl x y).symm.trans
      (kernel_of_factorization hn hfn hnc hk x y)
  let g : Z → W := fun z => n (Classical.choose (hms z))
  have hgm : ∀ x, g (m x) = n x := by
    intro x
    exact (hker _ x).mp (Classical.choose_spec (hms (m x)))
  have hgcomp : g ∘ m = n := funext hgm
  have hgc : Continuous g :=
    (IsQuotientMap.of_surjective_continuous hms hm).continuous_iff.mpr (hgcomp ▸ hn)
  have hgi : Injective g := by
    intro z w hzw
    obtain ⟨x, rfl⟩ := hms z
    obtain ⟨y, rfl⟩ := hms w
    apply (hker x y).mpr
    simpa only [hgm] using hzw
  have hgs : Surjective g := by
    intro w
    obtain ⟨x, rfl⟩ := hns w
    exact ⟨m x, hgm x⟩
  let e : Z ≃ W := Equiv.ofBijective g ⟨hgi, hgs⟩
  let h : Z ≃ₜ W := Continuous.homeoOfEquivCompactToT2 (f := e) hgc
  have hhm : ∀ x, h (m x) = n x := hgm
  have hlk : l = k ∘ h := by
    funext z
    obtain ⟨x, rfl⟩ := hms z
    change l (m x) = k (h (m x))
    rw [hhm]
    exact (congrFun hfm x).symm.trans (congrFun hfn x)
  refine ⟨h, ⟨funext hhm, hlk⟩, ?_⟩
  intro h' hh'
  apply Homeomorph.ext
  intro z
  obtain ⟨x, rfl⟩ := hms z
  exact (congrFun hh'.1 x).trans (hhm x).symm

end MonotoneLight
