import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure RTTCategory where
  objects : Type u
  morphisms : Type v
  tensorProduct : Prop
  homSpacesFiniteDimensional : Prop
  semisimple : Prop

structure RTTEvidence (C : RTTCategory) where
  tensorProductClosed : C.tensorProduct
  homSpacesFiniteDimensionalClosed : C.homSpacesFiniteDimensional
  semisimpleClosed : C.semisimple

def RTTClosed (C : RTTCategory) : Prop :=
  C.tensorProduct ∧ C.homSpacesFiniteDimensional ∧ C.semisimple

theorem rtt_closed_from_evidence (C : RTTCategory) (E : RTTEvidence C) :
    RTTClosed C := by
  exact And.intro E.tensorProductClosed (And.intro E.homSpacesFiniteDimensionalClosed E.semisimpleClosed)

theorem rtt_provides_representation_theory_bridge (A : AdmissibleClass) :
    RTTClosed (A.object : RTTCategory) := by
  unfold RTTClosed
  refine ⟨?_, ?_, ?_⟩
  · exact A.tensorProduct
  · exact A.homSpacesFiniteDimensional
  · exact A.semisimple

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse