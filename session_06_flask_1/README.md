## The Flask Microframework

Flask is called a microframework because it is lightweight and minimalistic,
providing the bare bones of features a simple web application requires. It
supports basic HTTP requests, connections to databases and a frontend, but
is easily extensible to a wide variety of other requirements.

Web/app frameworks have largely come to define modern app development, and you
will almost certainly run into them again at some point in the future. Try to
get a solid grasp of what frameworks accomplish, and why we have them! They
might seem complex and overwhelming at first, but they are the glue that makes
every part work with each other in a functioning application. They give us a
template/roadmap, or backbone if you will, to create dynamic and fun
applications in a much more efficient manner.

## Pre-class work

1. Work through thhe tutorial in question 1, and commit your code to your PCW repo.
2. Answer all questions in Question 2, which will strengthen your knowledge with Flask, and commit the answers to your PCW repo.

### 1. Flask tutorial

Work through the official Flask tutorial:
https://flask.palletsprojects.com/en/2.3.x/tutorial/

This official Flask tutorial introduces the main features of Flask.
The focus today is on defining templates and views which are covered in the sections up
to the end of the _Blog Blueprint_ section. We cover topics like testing and deployment
later in the course.

- Work though the tutorial one section at a time.
- Use the internet and AI tools to help you debug if you get stuck.
- Research any code that you don't understand.
- **Commit the code to your PCW repo before you come to class**

### 2. Answer the following questions in a README.md file

1. In your own words, what is Flask and why it is considered as a microframework?
2. What are the roles of the following parts in a Flask app:
   - templates
   - static files
   - requirements.txt
   - virtual environment `venv`
   - render_template
   - redirect
   - url_for
   - session
3. When we run a Flask app, you may need to use the following commands. Explain the goal of each command.
   ```bash
   $ pip3 install -r requirements.txt
   ```
   ```bash
   $ export FLASK_APP=app
   ```
   ```bash
   $ python3 -m flask run
   ```
4. There are many ways to run a Flask model, the two common ways are

   ```bash
   export FLASK_APP=app.py
   python3 -m flask run
   ```

   or

   ```bash
   python3 app.py
   ```

   Explain the differences between two commands, and when would you use each of them.

5. Why should we define specific version of libraries in `requirements.txt`? How can you find the version you should use?
6. What is the role of `@app.route` in the code below? Why do we put it right before defining the function. What is the default value for `methods` (in the documentation)?
   ```python
   @app.route('/', methods=['GET'])
   def main():
   	return 'Hello'
   ```
7. What is a decorator? Why should we use decorators in our Flask app?
8. What is the `config` attribute in a Flask app? How can you define `TESTING=True` or `SECRET_KEY='abc'`?
9. Lots of modern servers normally return data in the JSON format. What is JSON and why should we use it?
10. What is the default host and port in Flask? How can you change the host and port?

Commit your answers to a README.md file in the repo. They don't have to be extensive
written answers, just enough to prompt you into giving a complete verbal answer
if you are called on.
