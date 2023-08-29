## Unit testing

Unit testing is a great approach to minimizing bugs in your code.

Coverage is a measure of how much of your code is tested by your unit tests.

There is an approach called Test Driven Development (TDD) which takes this to
the extreme. Here you write tests beforehand which describe the expected
behavior of your code.

## Questions

### 1. Prime library

Using AI tools, create a small python module that contains functions for
determining if a number is prime, and for finding the next prime number.
Please include a few versions of primality tests (for example a slow,
deterministic test, and a faster probabilistic test).

1. Write unit tests for your library. (You may use either the built-in `unittest`
   module, or the third-party `pytest` module.)
2. There are always more defensive tests that you can write! Generate more tests
   for your library. Cover things like floats, negative numbers, strings, etc.
   (My rough feeling is that a non-integer float for a primality test should raise
   an exception, but that a non-integer float for the next prime should be
   rounded.)
3. Generate a coverage report for your tests. (You may use either the built-in
   `coverage` module, or the third-party `pytest-cov` module.)
4. Bring your code and coverage report to class ready to discuss.

### 2. Flask app

Using AI tools write a flask app where:

1. Users can register a new account with an email and password.
2. Users can log in with an email and password
3. When logged in, they can submit simple arithmetical expressions and have them
   evaluated.
4. These expressions will be saved to the user's history, and will be visible
   on their dashboard.
5. Users can log out.
6. Please avoid use of the potentially unsafe `eval()` function.
7. Under normal circumstances, it would make sense to use a third-party library
   like [`safeeval`](https://pypi.org/project/safeeval/), however for pedagogical
   purposes, please implement your own recursive descent parser for simple mathematical
   expressions (ie. addition, subtraction, multiplication, division, and exponentiation). (Current AI tools can
   do this just fine.)

Now write unit tests for:

1. The login functionality
2. The logout functionality
3. The evaluation of simple mathematical expressions
4. The endpoint for viewing the user's history

Here are some useful links for writing unit tests for flask apps:

- https://flask.palletsprojects.com/en/2.3.x/testing/
- https://flask.palletsprojects.com/en/2.3.x/tutorial/tests/

You are welome to use AI tools for _all_ of the code in this question, but you
must be able to explain how it works.
