## Continuous Integration

It is great if we have lots of testing code, but people tend not to be very
reliable at running the tests when they should (at least when compared to the
reliability of most computers). Very often programmers will commit code to
the repo without running the entire test suite. This can significantly
complicate the debugging of an issue, since you can not be sure whether the bug
was introduced by your changes, or else by someone else's changes, but they
forgot to test it fully.

In time the value of a fully automated process becomes clear. In this session
we will set up such an automated system which builds the entire environment from
scratch and runs all the necessary tests with every single push to a code repo.

## Questions

### 1. Build a continuous integration pipeline

After completing the readings for this session, complete the steps below to use
GitHub Actions for running a continuous integration test.

1. Copy your flask app from the unit testing session into this folder. Make sure
   that it still runs correctly.
2. Copy the unit tests that you wrote from the last session, and copy it
   into the `tests` folder. Include a `requirements.txt` file which contains all
   the necessary dependencies. This can be easily generated with the following
   command:
   `pip freeze > requirements.txt`
3. Create a `.github/workflows/ci.yaml` file. This GitHub actions file
   should run on every commit to any branch. It should install all the
   dependencies, and then run the unit tests.
4. Make sure GitHub Actions are enabled in your repo, then push your changes to GitHub
   and see that the test runs.
5. Paste the URL of a successful integration test run on GitHub Actions into
   the pre-class workbook provided in the class page.
   This will be an URL of the form: `https://github.com/<github_username>/cs162-pcw-<github_username>/actions/runs/<build_number>`

Use AI tools to assist you if you get stuck at any point. Also check the
course slack channel, as there are often issues that affect many students.

### 2. Read ci.yaml

Read through the `.github/workflows/ci.yaml` file in its entirety, and make sure you understand
each command, what it achieves, and why it has been included.

Be prepared to explain these commands to the rest of the class.

### 3. (Optional) Secure Environment Variables

If one relies on GitHub for an entire deployment, then there is a single point
of failure. Imagine having to insert all of your application's usernames and
passwords into the `ci.yaml`. This would require a large amount of trust
that this company would not let our secret data fall into the wrong hands.

As a solution, GitHub allows encrypted secrets, which goes a long way to
securing your deployment pipeline. Read up on:
https://docs.github.com/en/actions/reference/encrypted-secrets
And be able to describe how this works.
