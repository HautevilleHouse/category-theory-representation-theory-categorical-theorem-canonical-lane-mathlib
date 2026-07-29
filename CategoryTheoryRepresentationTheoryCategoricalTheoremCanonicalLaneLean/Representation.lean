import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure RepresentationPackage where
  group : Type u
  vectorSpace : Type v
  action : Prop
  intertwiners : Prop
  irreducibility : Prop

structure RepresentationEvidence (R : RepresentationPackage) where
  actionClosed : R.action
  intertwinersClosed : R.intertwiners
  irreducibilityClosed : R.irreducibility

def RepresentationClosed (R : RepresentationPackage) : Prop :=
  R.action ∧ R.intertwiners ∧ R.irreducibility

theorem representation_closed_from_evidence (R : RepresentationPackage) (E : RepresentationEvidence R) :
    RepresentationClosed R := by
  exact And.intro E.actionClosed (And.intro E.intertwinersClosed E.irreducibilityClosed)

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse