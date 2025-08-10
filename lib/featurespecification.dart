part of execspec_dart;

class FeatureSpecification implements Specification {
  String name;
  List<Behaviour> behaviours = [];
  FeatureSpecification({required this.name});

  @override
  defineIt() {}

  @override
  validateIt() {
    for (Behaviour behaviourSpecification in behaviours) {
      behaviourSpecification.validateIt();
    }
  }
}
