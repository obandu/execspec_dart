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

  String printTestResults() {
    final testSummary = <String, Map<String, dynamic>>{};
    var testResultsPrintout = "";

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

    testResultsPrintout += "Test Name: $testName\n";
    testResultsPrintout += "Test Date: $testDate\n";
    testResultsPrintout += "Test Results (DETAILS):\n";
    testResultsPrintout +=
        "Objective | Test Name |  Expected  |  Actual  | Result \n";
    for (var result in testResults) {
      testResultsPrintout +=
          "${result['objective']} | ${result['testname']}  | ${result['expected']}  |  ${result['actual']}  |  ${result['result']}\n";
    }
    testResultsPrintout += "\nTest Results (SUMMARY):\n";
    testResultsPrintout +=
        "Objective | Count | Fails | Passes | Not Implemented\n";
    for (var entry in testSummary.entries) {
      String objective = entry.key;
      Map<String, dynamic> summary = entry.value;
      testResultsPrintout +=
          "$objective | ${summary['count']} | ${summary['fails']} | ${summary['passes']} | ${summary['not implemented']}\n";
    }

    return testResultsPrintout;
  }

  dynamic saveTestResults({
    required String testResults,
    required String fileName,
  }) async {
    File file = File(fileName);
    try {
      await file.writeAsString(testResults);
      print("Test results successfully written to : $fileName");
    } catch (ex) {
      print("Saving test results to $fileName brings error $ex");
    }
  }

  @override
  String toString() {
    return 'TestRecord(testName: $testName, testDate: $testDate)';
  }
}
