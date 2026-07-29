import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure MonoidalCategoryPackage where
  tensorProduct : Type u
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  pentagonLaw : Prop
  triangleLaw : Prop

structure MonoidalCategoryEvidence (M : MonoidalCategoryPackage) where
  associatorClosed : M.associator
  leftUnitorClosed : M.leftUnitor
  rightUnitorClosed : M.rightUnitor
  pentagonLawClosed : M.pentagonLaw
  triangleLawClosed : M.triangleLaw

def MonoidalCategoryClosed (M : MonoidalCategoryPackage) : Prop :=
  M.associator ∧ M.leftUnitor ∧ M.rightUnitor ∧ M.pentagonLaw ∧ M.triangleLaw

theorem monoidal_category_closed_from_evidence (M : MonoidalCategoryPackage) (E : MonoidalCategoryEvidence M) :
    MonoidalCategoryClosed M := by
  exact And.intro E.associatorClosed (And.intro E.leftUnitorClosed (And.intro E.rightUnitorClosed (And.intro E.pentagonLawClosed E.triangleLawClosed)))

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse