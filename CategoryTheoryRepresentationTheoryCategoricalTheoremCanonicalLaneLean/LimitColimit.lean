import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure LimitColimit where
  diagram : Type u
  cone : Type v
  cocone : Type w
  universalProperty : Prop
  existence : Prop
  uniqueness : Prop
  universalPropertyClosed : universalProperty
  existenceClosed : existence
  uniquenessClosed : uniqueness

structure LimitColimitEvidence (L : LimitColimit) where
  universalPropertyClosed : L.universalProperty
  existenceClosed : L.existence
  uniquenessClosed : L.uniqueness

def LimitColimitClosed (L : LimitColimit) : Prop :=
  L.universalProperty ∧ L.existence ∧ L.uniqueness

theorem limit_colimit_closed_from_evidence (L : LimitColimit) (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.universalPropertyClosed (And.intro E.existenceClosed E.uniquenessClosed)

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse
