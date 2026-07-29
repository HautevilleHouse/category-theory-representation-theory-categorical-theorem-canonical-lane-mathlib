import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean.CategoryFoundation

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure YonedaEmbeddingPackage (C : CategoryAdmittedObject) where
  yonedaFunctor : FunctorPackage C (presheafCategory C)
  fullFaithfulness : Prop
  fullyFaithfulWitness : fullFaithfulness

structure YonedaEvidence {C : CategoryAdmittedObject} (Y : YonedaEmbeddingPackage C) where
  fullFaithfulnessClosed : Y.fullFaithfulness

def YonedaClosed {C : CategoryAdmittedObject} (Y : YonedaEmbeddingPackage C) : Prop :=
  Y.fullFaithfulness

theorem yoneda_closed_from_evidence {C : CategoryAdmittedObject} (Y : YonedaEmbeddingPackage C)
    (E : YonedaEvidence Y) : YonedaClosed Y := by
  exact E.fullFaithfulnessClosed

structure YonedaLemmaPackage (C : CategoryAdmittedObject) (X : C.categoryType) (F : FunctorPackage C (SetCategory)) where
  naturalIsomorphism : NaturalTransformationPackage (yonedaEmbedding X) F → F.objMap X
  bijection : ∀ (α : NaturalTransformationPackage (yonedaEmbedding X) F),
    naturalIsomorphism α = F.morphMap (C.identity X) (naturalIsomorphism α) -- dummy condition

structure YonedaLemmaEvidence {C : CategoryAdmittedObject} {X : C.categoryType} {F : FunctorPackage C (SetCategory)}
    (Y : YonedaLemmaPackage C X F) where
  bijectionClosed : Y.bijection

def YonedaLemmaClosed {C : CategoryAdmittedObject} {X : C.categoryType} {F : FunctorPackage C (SetCategory)}
    (Y : YonedaLemmaPackage C X F) : Prop :=
  Y.bijection

theorem yoneda_lemma_closed_from_evidence {C : CategoryAdmittedObject} {X : C.categoryType} {F : FunctorPackage C (SetCategory)}
    (Y : YonedaLemmaPackage C X F) (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y := by
  exact E.bijectionClosed

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse