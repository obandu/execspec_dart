# Dart Exec Spec - execspec_dart
Executable Specification Wrapper for Dart

Objective:
Test driven development (TDD) is counter-intuitive. It does not follow a natural thinking direction of product development and testing. The typical TDD cycle goes through, Write Tests, Run Test, Fail, Refactor and back. While this is not 'natural', it is a good practice as it ensures each unit of code is effectively tested early in the development process. This ensures continous delivery (from Agile Manifesto) and especially that developers dont build more code than necessary.

In comes BDD. In a way BDD seeks to 'trick' the developers mind by replacing the 'test' with specifications without eliminating the testing before implementation.  A good approach to this and an increasingly used method is that of executable specificatons. This is a specification written in a form that is 'human readable' to a high level as possible (definition without code comments) and using the same programming language as the code itself to allow easy define and run without the use of an external system or tool.

That brings us to the 'Dart Exec Spec' or the executable specification wrapper for dart.
1. Write your specifications as tests
2. Test using the dart test framework
3. Use the Testrecord singleton to report your test results.

Notes:
a) With this test wrapper, all tests are shown as passed even when not passed.
b) Mocking is not yet implemented

Usage:
>dart test -p vm --plain-name "Whole Application"