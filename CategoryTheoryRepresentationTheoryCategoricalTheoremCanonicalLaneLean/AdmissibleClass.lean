import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean

structure RepresentationObject where
  carrier : Type u
  monoidal : Prop
  braided : Prop
  dualsExist : Prop

structure RepresentationAdmissibleObject where
  object : RepresentationObject
  representationFiniteDimensional : Prop
  irreducible : Prop
  conclusion : representationFiniteDimensional ∧ irreducible

def RepresentationWitnessClosed (O : RepresentationAdmissibleObject) : Prop :=
  O.conclusion

end CategoryTheoryRepresentationTheoryCategoricalTheoremCanonicalLaneLean
end HautevilleHouse