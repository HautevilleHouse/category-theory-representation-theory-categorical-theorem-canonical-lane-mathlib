import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure CategoricalTheoremBridge (A : AdmissibleClass) where
  yonedaClosed : YonedaLemmaClosed (by infer_instance)
  adjointClosed : AdjointFunctorClosed (by infer_instance)
  limitColimitClosed : LimitColimitClosed (by infer_instance)
  representationClosed : RepresentationTheoryClosed (by infer_instance)

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CategoricalTheoremBridge A

theorem bridge_closed_from_categorical (A : AdmissibleClass) : bridgeClosed A := by
  refine {
    yonedaClosed := by
      exact YonedaLemmaClosed.mk (by
        intro X
        exact YonedaLemma.homEquiv X)
    adjointClosed := by
      exact AdjointFunctorClosed.mk (by
        intro F G
        exact AdjointFunctor.homEquiv F G)
    limitColimitClosed := by
      exact LimitColimitClosed.mk (by
        intro J
        exact LimitColimit.limitColimitIso J)
    representationClosed := by
      exact RepresentationTheoryClosed.mk (by
        intro V
        exact RepresentationTheory.representationIso V)
  }

end HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean