# Pinned definition source index

All copies are complete, unchanged upstream files. Line ranges use the upstream file numbering and include each complete defining body. `manifest.json` records the repository, exact commit, Git blob, SHA256, byte count and excerpt hashes. The `.txt` suffix keeps the evidence outside the Lean module graph. Preserved file headers name the original authors; each upstream license is included.

| Declaration or construction | Local source | Lines | Meaning-oriented cross-references |
| --- | --- | --- | --- |
| `IsPreconnected` | [Basic.lean.txt](mathlib/Mathlib/Topology/Connected/Basic.lean.txt#L50) | 50 to 52 | `IsOpen`, `Set.Nonempty`, `Set.Subset`, `Set.union`, `Set.inter` |
| `IsConnected` | [Basic.lean.txt](mathlib/Mathlib/Topology/Connected/Basic.lean.txt#L55) | 55 to 56 | `Set.Nonempty`, `IsPreconnected` |
| `connectedComponent` | [Basic.lean.txt](mathlib/Mathlib/Topology/Connected/Basic.lean.txt#L495) | 495 to 496 | `IsPreconnected`, `Set.sUnion` |
| `connectedComponentIn` | [Basic.lean.txt](mathlib/Mathlib/Topology/Connected/Basic.lean.txt#L505) | 505 to 506 | `connectedComponent`, `Set.image`, `subtype topology` |
| `TopologicalSpace` | [Basic.lean.txt](mathlib/Mathlib/Topology/Defs/Basic.lean.txt#L73) | 73 to 83 | `Set.univ`, `Set.inter`, `Set.sUnion` |
| `IsOpen` | [Basic.lean.txt](mathlib/Mathlib/Topology/Defs/Basic.lean.txt#L95) | 95 to 95 | `TopologicalSpace` |
| `IsClosed` | [Basic.lean.txt](mathlib/Mathlib/Topology/Defs/Basic.lean.txt#L107) | 107 to 109 | `IsOpen`, `Set.compl` |
| `Continuous` | [Basic.lean.txt](mathlib/Mathlib/Topology/Defs/Basic.lean.txt#L155) | 155 to 158 | `IsOpen`, `Set.preimage` |
| `IsTotallyDisconnected` | [TotallyDisconnected.lean.txt](mathlib/Mathlib/Topology/Connected/TotallyDisconnected.lean.txt#L36) | 36 to 37 | `IsPreconnected`, `Set.Subsingleton`, `Set.Subset` |
| `CompactSpace` | [Filter.lean.txt](mathlib/Mathlib/Topology/Defs/Filter.lean.txt#L297) | 297 to 299 | `IsCompact`, `Set.univ` |
| `IsCompact` | [Filter.lean.txt](mathlib/Mathlib/Topology/Defs/Filter.lean.txt#L290) | 290 to 291 | `Filter.NeBot`, `Filter.principal`, `ClusterPt`, `Filter.order` |
| `ClusterPt` | [Filter.lean.txt](mathlib/Mathlib/Topology/Defs/Filter.lean.txt#L275) | 275 to 276 | `Filter.NeBot`, `nhds`, `Filter.inf` |
| `nhds` | [Filter.lean.txt](mathlib/Mathlib/Topology/Defs/Filter.lean.txt#L130) | 130 to 131 | `IsOpen`, `Filter.principal`, `Filter.sInf` |
| `isCompact_iff_finite_subcover` | [Compact.lean.txt](mathlib/Mathlib/Topology/Compactness/Compact.lean.txt#L386) | 386 to 389 | `IsCompact`, `IsOpen` |
| `T2Space` | [Hausdorff.lean.txt](mathlib/Mathlib/Topology/Separation/Hausdorff.lean.txt#L85) | 85 to 87 | `Pairwise`, `IsOpen`, `Disjoint` |
| `Homeomorph` | [Defs.lean.txt](mathlib/Mathlib/Topology/Homeomorph/Defs.lean.txt#L43) | 43 to 50 | `Equiv`, `Continuous` |
| `Equiv` | [Defs.lean.txt](mathlib/Mathlib/Logic/Equiv/Defs.lean.txt#L67) | 67 to 77 | `Function.LeftInverse`, `Function.RightInverse` |
| `ExistsUnique` | [ExistsUnique.lean.txt](mathlib/Mathlib/Basic/ExistsUnique.lean.txt#L22) | 22 to 22 | ordinary logic or set/order primitives |
| `Pairwise` | [Pairwise.lean.txt](mathlib/Mathlib/Logic/Pairwise.lean.txt#L34) | 34 to 35 | ordinary logic or set/order primitives |
| `Set.Subsingleton` | [Subsingleton.lean.txt](mathlib/Mathlib/Data/Set/Subsingleton.lean.txt#L36) | 36 to 37 | ordinary logic or set/order primitives |
| `Set` | [Defs.lean.txt](mathlib/Mathlib/Data/Set/Defs.lean.txt#L51) | 51 to 51 | ordinary logic or set/order primitives |
| `Set.Subset` | [Defs.lean.txt](mathlib/Mathlib/Data/Set/Defs.lean.txt#L89) | 89 to 90 | `Set` |
| `Set.Nonempty` | [Defs.lean.txt](mathlib/Mathlib/Data/Set/Defs.lean.txt#L280) | 280 to 281 | `Set` |
| `Set.singleton` | [Defs.lean.txt](mathlib/Mathlib/Data/Set/Defs.lean.txt#L228) | 228 to 228 | `Set` |
| `Set.univ` | [Defs.lean.txt](mathlib/Mathlib/Data/Set/Defs.lean.txt#L215) | 215 to 215 | `Set` |
| `Set.union` | [Defs.lean.txt](mathlib/Mathlib/Data/Set/Defs.lean.txt#L235) | 235 to 235 | `Set` |
| `Set.inter` | [Defs.lean.txt](mathlib/Mathlib/Data/Set/Defs.lean.txt#L242) | 242 to 242 | `Set` |
| `Set.compl` | [Defs.lean.txt](mathlib/Mathlib/Data/Set/Defs.lean.txt#L249) | 249 to 249 | `Set` |
| `Set.image` | [Defs.lean.txt](mathlib/Mathlib/Data/Set/Defs.lean.txt#L266) | 266 to 266 | `Set` |
| `Set.preimage` | [Operations.lean.txt](mathlib/Mathlib/Data/Set/Operations.lean.txt#L135) | 135 to 135 | `Set` |
| `Set.sUnion` | [SetNotation.lean.txt](mathlib/Mathlib/Order/SetNotation.lean.txt#L150) | 150 to 151 | `Set` |
| `Disjoint` | [Disjoint.lean.txt](mathlib/Mathlib/Order/Disjoint.lean.txt#L48) | 48 to 49 | ordinary logic or set/order primitives |
| `Set.disjoint_left` | [Disjoint.lean.txt](mathlib/Mathlib/Data/Set/Disjoint.lean.txt#L39) | 39 to 40 | `Disjoint` |
| `subtype topology` | [Induced.lean.txt](mathlib/Mathlib/Topology/Defs/Induced.lean.txt#L76) | 76 to 78 | `TopologicalSpace.induced` |
| `TopologicalSpace.induced` | [Induced.lean.txt](mathlib/Mathlib/Topology/Defs/Induced.lean.txt#L64) | 64 to 74 | `IsOpen`, `Set.preimage` |
| `TopologicalSpace.coinduced` | [Induced.lean.txt](mathlib/Mathlib/Topology/Defs/Induced.lean.txt#L85) | 85 to 89 | `IsOpen`, `Set.preimage` |
| `quotient topology` | [Constructions.lean.txt](mathlib/Mathlib/Topology/Constructions.lean.txt#L58) | 58 to 60 | `Quotient`, `TopologicalSpace.coinduced` |
| `Filter` | [Defs.lean.txt](mathlib/Mathlib/Order/Filter/Defs.lean.txt#L75) | 75 to 83 | `Set` |
| `Filter.principal` | [Defs.lean.txt](mathlib/Mathlib/Order/Filter/Defs.lean.txt#L148) | 148 to 152 | `Filter`, `Set.Subset` |
| `Filter.order` | [Defs.lean.txt](mathlib/Mathlib/Order/Filter/Defs.lean.txt#L182) | 182 to 186 | `Filter` |
| `Filter.NeBot` | [Defs.lean.txt](mathlib/Mathlib/Order/Filter/Defs.lean.txt#L271) | 271 to 273 | `Filter.bot` |
| `Filter.bot` | [Defs.lean.txt](mathlib/Mathlib/Order/Filter/Defs.lean.txt#L218) | 218 to 219 | `Filter` |
| `Filter.inf` | [Defs.lean.txt](mathlib/Mathlib/Order/Filter/Defs.lean.txt#L227) | 227 to 239 | `Filter`, `Set.inter` |
| `Filter.sInf` | [Defs.lean.txt](mathlib/Mathlib/Order/Filter/Defs.lean.txt#L200) | 200 to 200 | `Filter` |
| `Function.Surjective` | [Function.lean.txt](lean/src/Init/Data/Function.lean.txt#L62) | 62 to 63 | ordinary logic or set/order primitives |
| `Function.LeftInverse` | [Function.lean.txt](lean/src/Init/Data/Function.lean.txt#L73) | 73 to 74 | ordinary logic or set/order primitives |
| `Function.RightInverse` | [Function.lean.txt](lean/src/Init/Data/Function.lean.txt#L83) | 83 to 84 | `Function.LeftInverse` |
| `Setoid` | [Core.lean.txt](lean/src/Init/Core.lean.txt#L1573) | 1573 to 1577 | ordinary logic or set/order primitives |
| `Quotient` | [Core.lean.txt](lean/src/Init/Core.lean.txt#L1937) | 1937 to 1938 | `Setoid` |

The `depends_on` cross-references are a reading guide for the meanings, not a mechanically inferred transitive implementation dependency closure. The complete files contain supporting notation, instances and equivalence lemmas beyond these entry points. This is a bounded source dossier for the statement meanings, not a vendored build of Mathlib.
