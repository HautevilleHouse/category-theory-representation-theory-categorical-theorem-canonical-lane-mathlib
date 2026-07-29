import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure LimitColimitPackage (C : Type u) [Category.{v} C] where
  smallLimits : HasLimitsOfSize.{w, w} C
  smallColimits : HasColimitsOfSize.{w, w} C
  limitUniqueness : Prop
  colimitUniqueness : Prop

structure LimitColimitEvidence {C : Type u} [Category.{v} C] (L : LimitColimitPackage C) where
  smallLimitsClosed : L.smallLimits
  smallColimitsClosed : L.smallColimits
  limitUniquenessClosed : L.limitUniqueness
  colimitUniquenessClosed : L.colimitUniqueness

def LimitColimitClosed {C : Type u} [Category.{v} C] (L : LimitColimitPackage C) : Prop :=
  L.limitUniqueness ∧ L.colimitUniqueness

theorem limit_colimit_closed_from_evidence
    {C : Type u} [Category.{v} C] (L : LimitColimitPackage C)
    (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.limitUniquenessClosed E.colimitUniquenessClosed

end HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean