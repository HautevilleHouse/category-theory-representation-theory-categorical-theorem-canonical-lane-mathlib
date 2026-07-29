import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjoint : Type u → Type v
  rightAdjoint : Type v → Type u
  unitNaturalTransformation : Prop
  counitNaturalTransformation : Prop
  triangleIdentities : Prop
  adjointIsoHom : Prop
  unitNaturalTransformationClosed : unitNaturalTransformation
  counitNaturalTransformationClosed : counitNaturalTransformation
  triangleIdentitiesClosed : triangleIdentities
  adjointIsoHomClosed : adjointIsoHom

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  unitNaturalTransformationClosed : A.unitNaturalTransformation
  counitNaturalTransformationClosed : A.counitNaturalTransformation
  triangleIdentitiesClosed : A.triangleIdentities
  adjointIsoHomClosed : A.adjointIsoHom

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.unitNaturalTransformation ∧ A.counitNaturalTransformation ∧ A.triangleIdentities ∧ A.adjointIsoHom

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage) (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.unitNaturalTransformationClosed (And.intro E.counitNaturalTransformationClosed (And.intro E.triangleIdentitiesClosed E.adjointIsoHomClosed))

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse