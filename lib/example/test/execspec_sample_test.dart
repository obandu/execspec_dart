import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

import 'package:execspec_dart/execspec_dart.dart';

import '../specifications/execspec_sample_spec.dart';

void main() {
  late TestRecord testRecord;

  setUp(() async {
    // At the start of testing, create a TestRecord instance with the application name
    testRecord = TestRecord(
      testName: "ApplicationName - The sample application for execspec_dart",
    );
    await TestProcess.start('dart', ['bin/sample.dart']);
  });

  setUpAll(() async {
    // -- as per test framework
  });

  tearDownAll(() async {
    // -- use the tearDownAll to print test results
    testRecord.printTestResults();
  });

  // This test case tests the whole application
  group('Whole Application', ExecSpecSampleSpecification().validateIt);
}
