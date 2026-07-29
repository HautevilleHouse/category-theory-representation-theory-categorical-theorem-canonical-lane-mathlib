import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean.YonedaLemma

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure AdjointRepresentationPackage {C D : CategoryPackage} where
  adjunction : AdjunctionPackage C D
  representationofLeftAdjoint : Prop
  representationofRightAdjoint : Prop
  unitAndCounit : Prop

structure AdjointRepresentationEvidence {C D : CategoryPackage} (A : AdjointRepresentationPackage C D) where
  representationofLeftAdjointClosed : A.representationofLeftAdjoint
  representationofRightAdjointClosed : A.representationofRightAdjoint
  unitAndCounitClosed : A.unitAndCounit

def AdjointRepresentationClosed {C D : CategoryPackage} (A : AdjointRepresentationPackage C D) : Prop :=
  A.representationofLeftAdjoint ∧ A.representationofRightAdjoint ∧ A.unitAndCounit

theorem adjoint_representation_closed_from_evidence {C D : CategoryPackage} (A : AdjointRepresentationPackage C D) (E : AdjointRepresentationEvidence A) : AdjointRepresentationClosed A := by
  exact And.intro E.representationofLeftAdjointClosed (And.intro E.representationofRightAdjointClosed E.unitAndCounitClosed)

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse