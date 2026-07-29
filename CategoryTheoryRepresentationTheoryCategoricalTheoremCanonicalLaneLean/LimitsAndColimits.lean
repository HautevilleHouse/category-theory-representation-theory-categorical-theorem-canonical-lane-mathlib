import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure LimitsPackage (A : AdmissibleClass) where
  hasSmallLimits : Prop
  hasSmallColimits : Prop
  completeness : Prop
  cocompleteness : Prop

structure LimitsEvidence {A : AdmissibleClass} (L : LimitsPackage A) where
  hasSmallLimitsClosed : L.hasSmallLimits
  hasSmallColimitsClosed : L.hasSmallColimits
  completenessClosed : L.completeness
  cocompletenessClosed : L.cocompleteness

def LimitsClosed {A : AdmissibleClass} (L : LimitsPackage A) : Prop :=
  L.hasSmallLimits ∧ L.hasSmallColimits ∧ L.completeness ∧ L.cocompleteness

theorem limits_closed_from_evidence {A : AdmissibleClass} (L : LimitsPackage A)
    (E : LimitsEvidence L) : LimitsClosed L := by
  exact And.intro E.hasSmallLimitsClosed (And.intro E.hasSmallColimitsClosed
    (And.intro E.completenessClosed E.cocompletenessClosed))

end HautevilleHouse
end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
