import 'featurespecification.dart';

class ApplicationSpecification {
  List<FeatureSpecification> applicationFeatures;

  ApplicationSpecification({required this.applicationFeatures});

  dynamic validateIt() {
    for (FeatureSpecification featureSpecification in applicationFeatures) {
      featureSpecification.defineIt();
      featureSpecification.validateIt();
    }
  }
}
