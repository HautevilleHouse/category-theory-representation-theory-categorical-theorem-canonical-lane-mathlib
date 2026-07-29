import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure NaturalTransformation where
  sourceFunctor : Type u
  targetFunctor : Type v
  components : Type w
  naturality : Prop
  composition : Prop
  identity : Prop
  naturalityClosed : naturality
  compositionClosed : composition
  identityClosed : identity

structure NaturalTransformationEvidence (N : NaturalTransformation) where
  naturalityClosed : N.naturality
  compositionClosed : N.composition
  identityClosed : N.identity

def NaturalTransformationClosed (N : NaturalTransformation) : Prop :=
  N.naturality ∧ N.composition ∧ N.identity

theorem natural_transformation_closed_from_evidence (N : NaturalTransformation) (E : NaturalTransformationEvidence N) : NaturalTransformationClosed N := by
  exact And.intro E.naturalityClosed (And.intro E.compositionClosed E.identityClosed)

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse
