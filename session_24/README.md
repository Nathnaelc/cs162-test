## Continuous Integration
It is great if we have lots of testing code, but people tend not to be very
reliable at running the tests when they should (at least when compared to the
reliability of most computers).  Very often programmers  will commit code to
the repo without running the entire test suite.  This can significantly
complicate the debugging of an issue, since you can not be sure whether the bug
was introduced by your changes, or else by someone else's changes, but they
forgot to test it fully.

In time the value of a fully automated process becomes clear. In this session
we will set up such an automated system which builds the entire environment from
scratch and runs all the necessary tests with every single push to a code repo.

## Tasks

After completing the readings for this session, complete the steps below to use
GitHub Actions for running a continuous integration test.

1. Fork the following repo to your own personal account:
https://github.com/minerva-schools/cs162-continuous-integration
(You will notice the option to fork the repo on the top right hand side of the
GitHub page.)

2. Use the integration test that you wrote from the last session, and copy it
into the `tests` folder.  Include a `requirements.txt` file which contains all
the necessary dependencies. This can be easily generated with the following
command:
`pip freeze > requirements.txt`

3. Update the `.github/workflows/ci.yaml` file on the last few lines to install 
your requirements and then run your tests. 
Notice that your tests are no longer in the root folder.
For example, if your original integration tests ran with the command:
`python3 integrate.py`
Then you will need to update the yaml file to have the line:
`python3 tests/integrate.py`

4. Make sure GitHub Actions are enabled in your repo, then push your changes to GitHub
   and see that the test runs.

5. Bring to class the URL of a successful integration run on GitHub Actions in your
personal account. This will be an URL of the form:
`https://github.com/<github_username>/cs162-continuous-integration/actions/runs/<build_number>`

## Questions

### 1. Read ci.yaml
Read through the `ci.yaml` file in its entirety, and make sure you understand
each command, what it achieves, and why it has been included.  (There are one or
two commands which rely on a large amount of scripting, and it is ok if you
don't understand every aspect of those commands.)

Be prepared to explain these commands to the rest of the class.

### 2. SQL
GitHub Actions also provides access to a few common databases such as MySQL and
Postgres. In this case our project bundles a postgres database already.
What are the pros and cons of using the provided database, versus bundling
our own?

### 3. (Optional) Secure Environment Variables
If one relies on GitHub for an entire deployment, then there is a single point
of failure.  Imagine having to insert all of your application's usernames and
passwords into the `ci.yaml`.  This would require a large amount of trust
that this company would not let our secret data fall into the wrong hands.

As a solution, GitHub allows encrypted secrets, which goes a long way to 
securing your deployment pipeline. Read up on:
https://docs.github.com/en/actions/reference/encrypted-secrets
And be able to describe how this works.
