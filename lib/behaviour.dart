import 'package:test/test.dart';

import 'specification.dart';

class Behaviour implements Specification {
  final String objective;
  dynamic definedby;

  Behaviour({required this.objective, this.definedby});

  @override
  validateIt() {
    // test assertion wrapper
    test(objective, () async {
      if (definedby == null) {
        print(
          "\n--OBJECTIVE : '$objective': \n --Test is NOT DEFINED \n--- END OBJECTIVE\n",
        );
        return;
      }

      // get the values from the function defining the test
      dynamic testResults = await definedby();
      print(
        "\n--OBJECTIVE : '$objective': \n --Test results are $testResults--",
      );
      for (var result in testResults) {
        try {
          expect(result["actual"], result["expected"]);
          print(
            "Test for ${result["name"]} =MATCHES= ${result["expected"]} ..PASSED",
          );
        } catch (ex) {
          print(
            "Test for ${result["name"]} =MATCHES= ${result["expected"]} ..FAILED",
          );
        }
      }
      print("-----END OBJECTIVE\n");
    });
  }

  @override
  defineIt() {
    // Do nothing here. Behaviour is defined in the constructor
  }
}
