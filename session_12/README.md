## The Flask Microframework

Flask is called a microframework because it is lightweight and minimalistic, providing the bare bones of features a simple web application requires. It is able to support basic HTTP requests, connections to databases and a frontend.

## Preclass

1. Answer all questions in Question 1, which will strengthen your knowledge with Flask.
2. Question 2 applies what you've learned to creating a kanban board. This must
be answered. You will be asked to paste in a portion of your Kanban server code
in as a poll response, so please have this handy when you come to class. Note
that this preclass work forms the basis of assignment 2.
3. Question 3 is optional, but will give you insight into some of the techniques
used to create a more seamless user experience.

### 1. Answer following questions as detail as possible
1. What is Flask and why it is considered as a microframework in your own word?
2. What is the role of the following parts in a Flask app: 
	- templates
	- static
	- requirements.txt
	- virtual environment ```venv```
	- render_template
	- redirect
	- url_for
	- session
3. When we run a flask app, you may need to use the following commands, please explain the goal of each command.
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
	Please explain the differences between two commands, and when would you use each of them.

5. Why should we define specific version of libraries in ```requirements.txt```? How can you find the version you should use?
6. What is the role of ```@app.route``` in defining one endpoint? Why we put that one right before defining the function. What is the default value for ```methods```?
	```python
	@app.route('/', methods=['GET'])
	def main():
		return 'Hello'
	```
7. What is a decorator? Why should we use decorator in our Flask app?
8. What is ```config``` attribute in Flask app? How can you define ```TESTING=True``` or ```SECRET_KEY='abc'```?
9. When a client send a request to server, server normally return a JSON file. What is JSON and why should we use it?
10. What is the default host and port in Flask? How can you change the host and port?

### 2. Kanban server

After working through a Flask example and watching the ToDo application being
built, you should feel comfortable building your own Kanban application.

Your Kanban application should be able to:
1. Create a new item in the "To do" state.
2. Move any item from any state ("To do", "Doing", or "Done") to any other state.
3. Delete an item when it is done.
4. Perform some basic styling using a CSS file.  (This is shown in step 8 of the
   Flaskr tutorial)

### 3. (Optional) Building a JSON API in Flask

It is best practice to separate out your application data from the presentation
of the data.  Taken to its logical conclusion this leads to a clean separation
between static HTML and a JSON API.  (Just like those APIs that were queried
in the previous session.)  

Investigate the `jsonify()` method in Flask, as well as Flask `MethodViews`.
Together these can build a JSON API using sound object oriented principles.
As an example, one can use inheritance to ensure consistency between similar
end points.

One downside of this approach is that you now need to make client side requests.
Typically this is done in the webpage using JavaScript (or a JavaScript
framework).  There isn't enough time in this course to adequately cover
JavaScript, but if you already know some, or are willing to put the effort into
learning it, then please do so for this unit and/or the final project!
