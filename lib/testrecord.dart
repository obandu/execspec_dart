part of execspec_dart;

class TestRecord {
  static TestRecord? _instance;

  final String testName;
  final DateTime testDate;
  final List<Map<String, dynamic>> testResults = [];

  factory TestRecord({String? testName, DateTime? testDate}) {
    _instance ??= TestRecord._internal(testName: testName, testDate: testDate);
    return _instance!;
  }

  TestRecord._internal({String? testName, DateTime? testDate})
    : testDate = testDate ?? DateTime.now(),
      testName = testName ?? "Unnamed Test ..";
  void addTestResult({
    required String objective,
    required String testName,
    required dynamic expected,
    required dynamic actual,
    required String testResult,
  }) {
    testResults.add({
      "objective": objective,
      "expected": expected,
      "actual": actual,
      "testname": testName,
      "result": testResult,
    });
  }

  void printTestResults() {
    Map<String, Map<String, dynamic>> testSummary = {};
    for (var result in testResults) {
      String objective = result['objective'];
      if (!testSummary.containsKey(objective)) {
        testSummary[objective] = {
          'fails': result['result'] == 'FAILED' ? 1 : 0,
          'passes': result['result'] == 'PASSED' ? 1 : 0,
          'not implemented': result['result'] == 'NOT IMPLEMENTED' ? 1 : 0,
          'count': 1,
        };
      } else {
        testSummary[objective]!['count'] += 1;
        if (result['result'] == 'FAILED') {
          testSummary[objective]!['fails'] += 1;
        } else if (result['result'] == 'PASSED') {
          testSummary[objective]!['passes'] += 1;
        } else if (result['result'] == 'NOT IMPLEMENTED') {
          testSummary[objective]!['not implemented'] += 1;
        }
      }
    }

    print("Test Name: $testName");
    print("Test Date: $testDate");
    print("Test Results (DETAILS):");
    print("Objective | Test Name |  Expected  |  Actual  | Result \n");
    for (var result in testResults) {
      print(
        "${result['objective']} | ${result['testname']}  | ${result['expected']}  |  ${result['actual']}  |  ${result['result']}",
      );
    }
    print("\nTest Results (SUMMARY):");
    print("Objective | Count | Fails | Passes | Not Implemented");
    for (var entry in testSummary.entries) {
      String objective = entry.key;
      Map<String, dynamic> summary = entry.value;
      print(
        "$objective | ${summary['count']} | ${summary['fails']} | ${summary['passes']} | ${summary['not implemented']}",
      );
    }
  }

  @override
  String toString() {
    return 'TestRecord(testName: $testName, testDate: $testDate)';
  }
}
