import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure FunctorPackage (C D : CategoryAdmittedObject) where
  objMap : C.categoryType → D.categoryType
  morphMap : ∀ {X Y : C.categoryType}, C.morphismSet X Y → D.morphismSet (objMap X) (objMap Y)
  preservesIdentity : ∀ (X : C.categoryType), morphMap (C.identity X) = D.identity (objMap X)
  preservesComposition : ∀ {X Y Z : C.categoryType} (f : C.morphismSet X Y) (g : C.morphismSet Y Z),
    morphMap (C.compose g f) = D.compose (morphMap g) (morphMap f)

structure FunctorEvidence {C D : CategoryAdmittedObject} (F : FunctorPackage C D) where
  preservesIdentityClosed : F.preservesIdentity
  preservesCompositionClosed : F.preservesComposition

def FunctorClosed {C D : CategoryAdmittedObject} (F : FunctorPackage C D) : Prop :=
  F.preservesIdentity ∧ F.preservesComposition

theorem functor_closed_from_evidence {C D : CategoryAdmittedObject} (F : FunctorPackage C D) (E : FunctorEvidence F) :
    FunctorClosed F := by
  exact And.intro E.preservesIdentityClosed E.preservesCompositionClosed

structure NaturalTransformationPackage {C D : CategoryAdmittedObject} (F G : FunctorPackage C D) where
  components : (X : C.categoryType) → D.morphismSet (F.objMap X) (G.objMap X)
  naturality : ∀ {X Y : C.categoryType} (f : C.morphismSet X Y),
    D.compose (components Y) (F.morphMap f) = D.compose (G.morphMap f) (components X)

structure NaturalTransformationEvidence {C D : CategoryAdmittedObject} {F G : FunctorPackage C D}
    (α : NaturalTransformationPackage F G) where
  naturalityClosed : α.naturality

def NaturalTransformationClosed {C D : CategoryAdmittedObject} {F G : FunctorPackage C D}
    (α : NaturalTransformationPackage F G) : Prop :=
  α.naturality

theorem natural_transformation_closed_from_evidence {C D : CategoryAdmittedObject} {F G : FunctorPackage C D}
    (α : NaturalTransformationPackage F G) (E : NaturalTransformationEvidence α) :
    NaturalTransformationClosed α := by
  exact E.naturalityClosed

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse