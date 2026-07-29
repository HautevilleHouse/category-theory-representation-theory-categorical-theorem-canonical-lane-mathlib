import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure ConeOver (J C : CategoryAdmittedObject) (F : FunctorPackage J C) where
  apex : C.categoryType
  projections : (j : J.categoryType) → C.morphismSet apex (F.objMap j)
  commutativity : ∀ {j k : J.categoryType} (f : J.morphismSet j k),
    C.compose (F.morphMap f) (projections j) = projections k

structure LimitPackage (J C : CategoryAdmittedObject) (F : FunctorPackage J C) where
  limitingCone : ConeOver J C F
  universalProperty : ∀ (otherCone : ConeOver J C F), ∃! (u : C.morphismSet otherCone.apex limitingCone.apex),
    ∀ (j : J.categoryType), C.compose (limitingCone.projections j) u = otherCone.projections j

structure LimitEvidence {J C : CategoryAdmittedObject} {F : FunctorPackage J C} (L : LimitPackage J C F) where
  universalPropertyClosed : L.universalProperty

def LimitClosed {J C : CategoryAdmittedObject} {F : FunctorPackage J C} (L : LimitPackage J C F) : Prop :=
  L.universalProperty

theorem limit_closed_from_evidence {J C : CategoryAdmittedObject} {F : FunctorPackage J C}
    (L : LimitPackage J C F) (E : LimitEvidence L) : LimitClosed L := by
  exact E.universalPropertyClosed

structure ColimitPackage (J C : CategoryAdmittedObject) (F : FunctorPackage J C) where
  cocone : CoconeOver J C F
  universalProperty : ∀ (otherCocone : CoconeOver J C F), ∃! (u : C.morphismSet cocone.apex otherCocone.apex),
    ∀ (j : J.categoryType), C.compose u (cocone.injections j) = otherCocone.injections j

structure ColimitEvidence {J C : CategoryAdmittedObject} {F : FunctorPackage J C} (Col : ColimitPackage J C F) where
  universalPropertyClosed : Col.universalProperty

def ColimitClosed {J C : CategoryAdmittedObject} {F : FunctorPackage J C} (Col : ColimitPackage J C F) : Prop :=
  Col.universalProperty

theorem colimit_closed_from_evidence {J C : CategoryAdmittedObject} {F : FunctorPackage J C}
    (Col : ColimitPackage J C F) (E : ColimitEvidence Col) : ColimitClosed Col := by
  exact E.universalPropertyClosed

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse