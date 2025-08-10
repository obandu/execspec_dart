part of execspec_dart;

class ApplicationSpecification {
  final List<FeatureSpecification> applicationFeatures;
  final String applicationName;
  ApplicationSpecification({
    required this.applicationName,
    required this.applicationFeatures,
  });

  dynamic validateIt() {
    for (FeatureSpecification featureSpecification in applicationFeatures) {
      featureSpecification.defineIt();
      featureSpecification.validateIt();
    }
  }
}
