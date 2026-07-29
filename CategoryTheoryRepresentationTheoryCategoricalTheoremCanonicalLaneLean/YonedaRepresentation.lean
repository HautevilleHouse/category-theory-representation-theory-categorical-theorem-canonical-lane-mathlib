import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure YonedaRepresentationPackage where
  category : Type u
  hom : category → category → Type v
  terminalObject : category
  yonedaEmbedding : Prop
  representablePresheaf : Prop
  naturalityCondition : Prop
  fullyFaithfulness : Prop

structure YonedaRepresentationEvidence (Y : YonedaRepresentationPackage) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  representablePresheafClosed : Y.representablePresheaf
  naturalityConditionClosed : Y.naturalityCondition
  fullyFaithfulnessClosed : Y.fullyFaithfulness

def YonedaRepresentationClosed (Y : YonedaRepresentationPackage) : Prop :=
  Y.yonedaEmbedding ∧ Y.representablePresheaf ∧ Y.naturalityCondition ∧ Y.fullyFaithfulness

theorem yoneda_representation_closed_from_evidence (Y : YonedaRepresentationPackage)
    (E : YonedaRepresentationEvidence Y) : YonedaRepresentationClosed Y := by
  exact And.intro E.yonedaEmbeddingClosed (And.intro E.representablePresheafClosed
    (And.intro E.naturalityConditionClosed E.fullyFaithfulnessClosed))

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse
