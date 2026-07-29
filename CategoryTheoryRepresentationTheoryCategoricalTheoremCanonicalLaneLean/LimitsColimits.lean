import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure LimitsColimitsPackage where
  limitExistence : Prop
  colimitExistence : Prop
  limitUniqueness : Prop
  colimitUniqueness : Prop
  limitColimitFunctors : Prop
  limitExistenceClosed : limitExistence
  colimitExistenceClosed : colimitExistence
  limitUniquenessClosed : limitUniqueness
  colimitUniquenessClosed : colimitUniqueness
  limitColimitFunctorsClosed : limitColimitFunctors

structure LimitsColimitsEvidence (L : LimitsColimitsPackage) where
  limitExistenceClosed : L.limitExistence
  colimitExistenceClosed : L.colimitExistence
  limitUniquenessClosed : L.limitUniqueness
  colimitUniquenessClosed : L.colimitUniqueness
  limitColimitFunctorsClosed : L.limitColimitFunctors

def LimitsColimitsClosed (L : LimitsColimitsPackage) : Prop :=
  L.limitExistence ∧ L.colimitExistence ∧ L.limitUniqueness ∧ L.colimitUniqueness ∧ L.limitColimitFunctors

theorem limits_colimits_closed_from_evidence (L : LimitsColimitsPackage) (E : LimitsColimitsEvidence L) : LimitsColimitsClosed L := by
  exact And.intro E.limitExistenceClosed (And.intro E.colimitExistenceClosed (And.intro E.limitUniquenessClosed (And.intro E.colimitUniquenessClosed E.limitColimitFunctorsClosed)))

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse