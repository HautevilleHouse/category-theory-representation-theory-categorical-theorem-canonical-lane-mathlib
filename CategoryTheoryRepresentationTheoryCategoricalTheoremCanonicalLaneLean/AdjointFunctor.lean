import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure AdjointFunctorPackage where
  leftFunctor : Type u
  rightFunctor : Type v
  adjunctionIso : Prop
  unitNatural : Prop
  counitNatural : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  adjunctionIsoClosed : A.adjunctionIso
  unitNaturalClosed : A.unitNatural
  counitNaturalClosed : A.counitNatural

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.adjunctionIso ∧ A.unitNatural ∧ A.counitNatural

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A := by
  exact And.intro E.adjunctionIsoClosed (And.intro E.unitNaturalClosed E.counitNaturalClosed)

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse