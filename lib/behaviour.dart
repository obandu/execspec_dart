part of execspec_dart;

class Behaviour implements Specification {
  final String objective;
  dynamic definedby;

  Behaviour({required this.objective, this.definedby});

  @override
  validateIt() {
    TestRecord testRecord = TestRecord(); // get an instance of TestRecord

    // if definedby is null, then the test is not defined
    if (definedby == null) {
      testRecord.addTestResult(
        objective: objective,
        testName: "Test is NOT DEFINED",
        expected: "Not Defined",
        actual: "Not Defined",
        testResult: "NOT IMPLEMENTED",
      );
      return;
    }

    // test assertion wrapper
    test(objective, () async {
      // get the values from the function defining the test
      dynamic testResults = await definedby();

      for (var result in testResults) {
        try {
          expect(result["actual"], result["expected"]);
          testRecord.addTestResult(
            objective: objective,
            testName: result["name"],
            expected: result["expected"],
            actual: result["actual"],
            testResult: "PASSED",
          );
        } catch (ex) {
          testRecord.addTestResult(
            objective: objective,
            testName: result["name"],
            expected: result["expected"],
            actual: result["actual"],
            testResult: "FAILED",
          );
        }
      }
    });
  }

  @override
  defineIt() {
    // Do nothing here. Behaviour is defined in the constructor
  }
}
