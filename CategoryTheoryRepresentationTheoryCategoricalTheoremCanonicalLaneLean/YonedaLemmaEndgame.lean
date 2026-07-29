import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Yoneda

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure YonedaLemmaPackage where
  yonedaEmbedding : Prop
  yonedaLemma : Prop
  naturality : Prop
  coyonedaLemma : Prop

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.yonedaEmbedding ∧ Y.yonedaLemma ∧ Y.naturality ∧ Y.coyonedaLemma

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  yonedaLemmaClosed : Y.yonedaLemma
  naturalityClosed : Y.naturality
  coyonedaLemmaClosed : Y.coyonedaLemma

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage)
    (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y := by
  exact And.intro E.yonedaEmbeddingClosed
    (And.intro E.yonedaLemmaClosed
      (And.intro E.naturalityClosed E.coyonedaLemmaClosed))

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse