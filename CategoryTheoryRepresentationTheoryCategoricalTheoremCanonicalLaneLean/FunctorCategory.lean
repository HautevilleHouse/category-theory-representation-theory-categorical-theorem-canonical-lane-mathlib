import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure FunctorCategory where
  sourceCategory : Type u
  targetCategory : Type v
  functors : Type w
  naturalTransformations : Type x
  composition : Prop
  identityFunctor : Prop
  compositionClosed : composition
  identityFunctorClosed : identityFunctor

structure FunctorCategoryEvidence (C : FunctorCategory) where
  compositionClosed : C.composition
  identityFunctorClosed : C.identityFunctor

def FunctorCategoryClosed (C : FunctorCategory) : Prop :=
  C.composition ∧ C.identityFunctor

theorem functor_category_closed_from_evidence (C : FunctorCategory) (E : FunctorCategoryEvidence C) : FunctorCategoryClosed C := by
  exact And.intro E.compositionClosed E.identityFunctorClosed

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse
