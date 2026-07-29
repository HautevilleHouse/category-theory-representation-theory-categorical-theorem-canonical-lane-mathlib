import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure RepresentationCategory (k : Type) [Field k] (G : Type) [Group G] where
  representations : Type
  morphisms : Type
  homAbelian : Prop
  tensorProductDefined : Prop

structure RepresentationTheoryEvidence (R : RepresentationCategory k G) where
  homAbelianClosed : R.homAbelian
  tensorProductDefinedClosed : R.tensorProductDefined

def RepresentationTheoryClosed (R : RepresentationCategory k G) : Prop :=
  R.homAbelian ∧ R.tensorProductDefined

theorem representation_theory_closed_from_evidence
    (k : Type) [Field k] (G : Type) [Group G] (R : RepresentationCategory k G)
    (E : RepresentationTheoryEvidence R) : RepresentationTheoryClosed R := by
  exact And.intro E.homAbelianClosed E.tensorProductDefinedClosed

end HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean