import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure YonedaLemmaPackage where
  category : Type u
  categoryMorphism : category → category → Type v
  functorToSets : category → Type (max u v) → Type (max u v)
  naturalTransformation : (functorToSets A) → (functorToSets B) → Prop
  representableFunctor : category → Type (max u v)
  yonedaEmbeddingFull : Prop
  yonedaEmbeddingFaithful : Prop
  yonedaLemmaStatement : Prop
  yonedaEmbeddingFullClosed : yonedaEmbeddingFull
  yonedaEmbeddingFaithfulClosed : yonedaEmbeddingFaithful
  yonedaLemmaStatementClosed : yonedaLemmaStatement

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  yonedaEmbeddingFullClosed : Y.yonedaEmbeddingFull
  yonedaEmbeddingFaithfulClosed : Y.yonedaEmbeddingFaithful
  yonedaLemmaStatementClosed : Y.yonedaLemmaStatement

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.yonedaEmbeddingFull ∧ Y.yonedaEmbeddingFaithful ∧ Y.yonedaLemmaStatement

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y := by
  exact And.intro E.yonedaEmbeddingFullClosed (And.intro E.yonedaEmbeddingFaithfulClosed E.yonedaLemmaStatementClosed)

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse