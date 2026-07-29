import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure AdjunctionPackage (A : AdmissibleClass) where
  leftAdjointExists : Prop
  rightAdjointExists : Prop
  adjointFunctorTheorem : Prop
  unitCounit : Prop

structure AdjunctionEvidence {A : AdmissibleClass} (Adj : AdjunctionPackage A) where
  leftAdjointExistsClosed : Adj.leftAdjointExists
  rightAdjointExistsClosed : Adj.rightAdjointExists
  adjointFunctorTheoremClosed : Adj.adjointFunctorTheorem
  unitCounitClosed : Adj.unitCounit

def AdjunctionClosed {A : AdmissibleClass} (Adj : AdjunctionPackage A) : Prop :=
  Adj.leftAdjointExists ∧ Adj.rightAdjointExists ∧ Adj.adjointFunctorTheorem ∧ Adj.unitCounit

theorem adjunction_closed_from_evidence {A : AdmissibleClass} (Adj : AdjunctionPackage A)
    (E : AdjunctionEvidence Adj) : AdjunctionClosed Adj := by
  exact And.intro E.leftAdjointExistsClosed (And.intro E.rightAdjointExistsClosed
    (And.intro E.adjointFunctorTheoremClosed E.unitCounitClosed))

end HautevilleHouse
end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
