import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Yoneda

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjoint : Type u → Type v
  rightAdjoint : Type u → Type v
  unitNaturalTransformation : Prop
  counitNaturalTransformation : Prop
  triangleIdentities : Prop
  unitCounitAdjunction : Prop

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.unitNaturalTransformation ∧ A.counitNaturalTransformation ∧
  A.triangleIdentities ∧ A.unitCounitAdjunction

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  unitNaturalTransformationClosed : A.unitNaturalTransformation
  counitNaturalTransformationClosed : A.counitNaturalTransformation
  triangleIdentitiesClosed : A.triangleIdentities
  unitCounitAdjunctionClosed : A.unitCounitAdjunction

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage)
    (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.unitNaturalTransformationClosed
    (And.intro E.counitNaturalTransformationClosed
      (And.intro E.triangleIdentitiesClosed E.unitCounitAdjunctionClosed))

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse