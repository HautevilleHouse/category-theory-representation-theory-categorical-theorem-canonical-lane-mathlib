import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure AbelianCategoryPackage where
  zeroObject : Prop
  kernels : Prop
  cokernels : Prop
  monomorphismEpimorphismFactorisation : Prop
  exactSequences : Prop

structure AbelianCategoryEvidence (A : AbelianCategoryPackage) where
  zeroObjectClosed : A.zeroObject
  kernelsClosed : A.kernels
  cokernelsClosed : A.cokernels
  monomorphismEpimorphismFactorisationClosed : A.monomorphismEpimorphismFactorisation
  exactSequencesClosed : A.exactSequences

def AbelianCategoryClosed (A : AbelianCategoryPackage) : Prop :=
  A.zeroObject ∧ A.kernels ∧ A.cokernels ∧ A.monomorphismEpimorphismFactorisation ∧ A.exactSequences

theorem abelian_category_closed_from_evidence (A : AbelianCategoryPackage) (E : AbelianCategoryEvidence A) :
    AbelianCategoryClosed A := by
  exact And.intro E.zeroObjectClosed (And.intro E.kernelsClosed (And.intro E.cokernelsClosed (And.intro E.monomorphismEpimorphismFactorisationClosed E.exactSequencesClosed)))

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse