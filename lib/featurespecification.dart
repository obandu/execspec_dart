import 'behaviour.dart';
import 'specification.dart';

class FeatureSpecification extends Specification {
  String name;
  List<Behaviour> behaviours = [];
  FeatureSpecification({required this.name});

  @override
  defineIt() {
    for (Behaviour behaviourSpecification in behaviours) {
      behaviourSpecification.defineIt();
    }
  }

  @override
  validateIt() {
    for (Behaviour behaviourSpecification in behaviours) {
      behaviourSpecification.validateIt();
    }
  }
}
