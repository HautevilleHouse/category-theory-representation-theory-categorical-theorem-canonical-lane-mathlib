import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Limits

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure KanExtensionPackage where
  leftKanExt : Type u → Type v
  rightKanExt : Type u → Type v
  universalProperty : Prop
  pointwiseFormula : Prop
  existenceCondition : Prop

def KanExtensionClosed (K : KanExtensionPackage) : Prop :=
  K.universalProperty ∧ K.pointwiseFormula ∧ K.existenceCondition

structure KanExtensionEvidence (K : KanExtensionPackage) where
  universalPropertyClosed : K.universalProperty
  pointwiseFormulaClosed : K.pointwiseFormula
  existenceConditionClosed : K.existenceCondition

theorem kan_extension_closed_from_evidence (K : KanExtensionPackage)
    (E : KanExtensionEvidence K) : KanExtensionClosed K := by
  exact And.intro E.universalPropertyClosed
    (And.intro E.pointwiseFormulaClosed E.existenceConditionClosed)

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse