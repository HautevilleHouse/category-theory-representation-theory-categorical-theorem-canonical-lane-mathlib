import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Limits

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure LimitColimitPackage where
  smallLimitsExist : Prop
  smallColimitsExist : Prop
  limitUniversalProperty : Prop
  colimitUniversalProperty : Prop
  limitColimitAdjunction : Prop

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.smallLimitsExist ∧ L.smallColimitsExist ∧
  L.limitUniversalProperty ∧ L.colimitUniversalProperty ∧
  L.limitColimitAdjunction

structure LimitColimitEvidence (L : LimitColimitPackage) where
  smallLimitsExistClosed : L.smallLimitsExist
  smallColimitsExistClosed : L.smallColimitsExist
  limitUniversalPropertyClosed : L.limitUniversalProperty
  colimitUniversalPropertyClosed : L.colimitUniversalProperty
  limitColimitAdjunctionClosed : L.limitColimitAdjunction

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage)
    (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.smallLimitsExistClosed
    (And.intro E.smallColimitsExistClosed
      (And.intro E.limitUniversalPropertyClosed
        (And.intro E.colimitUniversalPropertyClosed E.limitColimitAdjunctionClosed)))

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse