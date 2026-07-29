import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure CategoryAdmittedObject where
  category : Type u
  obj : Type v
  mor : obj → obj → Type w
  identity : ∀ (X : obj), mor X X
  composition : ∀ {X Y Z : obj}, mor X Y → mor Y Z → mor X Z
  associativity : ∀ {X Y Z W : obj} (f : mor X Y) (g : mor Y Z) (h : mor Z W),
    composition (composition f g) h = composition f (composition g h)
  identityLeft : ∀ {X Y : obj} (f : mor X Y), composition (identity X) f = f
  identityRight : ∀ {X Y : obj} (f : mor X Y), composition f (identity Y) = f
  locallySmall : Prop
  hasLimits : Prop
  hasColimits : Prop
  abelian : Prop
  hasLimitsTerm : hasLimits
  hasColimitsTerm : hasColimits
  abelianTerm : abelian

def CategoryWitnessClosed (O : CategoryAdmittedObject) : Prop :=
  O.hasLimits ∧ O.hasColimits ∧ O.abelian

theorem category_witness_closed_from_object (O : CategoryAdmittedObject) :
    CategoryWitnessClosed O := by
  exact And.intro O.hasLimitsTerm (And.intro O.hasColimitsTerm O.abelianTerm)

end HautevilleHouse
end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
