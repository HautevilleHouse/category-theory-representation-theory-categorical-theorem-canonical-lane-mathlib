import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean.LimitsColimits

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure RepresentationTheoremPackage {Y : YonedaRepresentationPackage}
    {A : AdjointFunctorPackage Y} {L : LimitsPackage A} where
  equivalenceCategories : Prop
  functorFaithfulness : Prop
  essentialSurjectivity : Prop
  categoricalStructuralPreservation : Prop
  representationEndgameStatement : Prop

structure RepresentationTheoremEvidence {Y : YonedaRepresentationPackage}
    {A : AdjointFunctorPackage Y} {L : LimitsPackage A}
    (R : RepresentationTheoremPackage L) where
  equivalenceCategoriesClosed : R.equivalenceCategories
  functorFaithfulnessClosed : R.functorFaithfulness
  essentialSurjectivityClosed : R.essentialSurjectivity
  categoricalStructuralPreservationClosed : R.categoricalStructuralPreservation
  representationEndgameStatementClosed : R.representationEndgameStatement

def RepresentationTheoremClosed {Y : YonedaRepresentationPackage}
    {A : AdjointFunctorPackage Y} {L : LimitsPackage A}
    (R : RepresentationTheoremPackage L) : Prop :=
  R.equivalenceCategories ∧ R.functorFaithfulness ∧ R.essentialSurjectivity ∧
  R.categoricalStructuralPreservation ∧ R.representationEndgameStatement

theorem representation_theorem_closed_from_evidence {Y : YonedaRepresentationPackage}
    {A : AdjointFunctorPackage Y} {L : LimitsPackage A}
    (R : RepresentationTheoremPackage L) (E : RepresentationTheoremEvidence R) :
    RepresentationTheoremClosed R := by
  exact And.intro E.equivalenceCategoriesClosed (And.intro E.functorFaithfulnessClosed
    (And.intro E.essentialSurjectivityClosed (And.intro E.categoricalStructuralPreservationClosed
      E.representationEndgameStatementClosed)))

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse
