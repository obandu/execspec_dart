import 'package:execspec_dart/execspec_dart.dart';

class ExecSpecSampleSpecification extends ApplicationSpecification {
  ExecSpecSampleSpecification()
    : super(
        applicationName: "ExecSpec Sample Application",
        applicationFeatures: [],
      );

  @override
  dynamic validateIt() {
    // Implement validation logic for the sample application
    print('Validating ExecSpec Sample Application...');
    // Add your validation logic here
  }
}
