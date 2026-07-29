import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure KanExtensionPackage where
  leftExtension : Type u
  rightExtension : Type v
  universalProperty : Prop
  pointwiseFormula : Prop
  existenceTheorem : Prop

structure KanExtensionEvidence (K : KanExtensionPackage) where
  universalPropertyClosed : K.universalProperty
  pointwiseFormulaClosed : K.pointwiseFormula
  existenceTheoremClosed : K.existenceTheorem

def KanExtensionClosed (K : KanExtensionPackage) : Prop :=
  K.universalProperty ∧ K.pointwiseFormula ∧ K.existenceTheorem

theorem kan_extension_closed_from_evidence (K : KanExtensionPackage) (E : KanExtensionEvidence K) :
    KanExtensionClosed K := by
  exact And.intro E.universalPropertyClosed (And.intro E.pointwiseFormulaClosed E.existenceTheoremClosed)

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse