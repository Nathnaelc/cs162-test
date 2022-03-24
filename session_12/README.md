## The Flask Microframework

Flask is called a microframework because it is lightweight and minimalistic, providing the bare bones of features a simple web application requires. It supports basic HTTP requests, connections to databases and a frontend, but is easily extensible to a wide variety of other requirements.

Web/app frameworks have largely come to define modern app development, and you will almost certainly run into them again at some point in the future. Try to get a solid grasp of what frameworks accomplish, and why we have them! They might seem complex and overwhelming at first, but they are the glue that makes every part work with each other in a functioning application. They give us a template/roadmap, or backbone if you will, to create dynamic and fun applications in a much more efficient manner.

## Preclass

1. Answer all questions in Question 1, which will strengthen your knowledge with Flask.
2. Question 2 applies what you've learned to creating a kanban board. This must
be answered. You must commit this work to your PCW repo.
Note that this preclass work forms the basis of assignment 2.
3. Question 3 is optional, but will give you insight into some of the techniques
used to create a more seamless user experience.
4. Question 4 is optional but strongly recommended for you. You will have a chance 
to create more flask apps. Repetition of the basics will make you a much more 
productive programmer!

### 1. Answer the following questions with as detail as possible
1. In your own words, what is Flask and why it is considered as a microframework?
2. What are the roles of the following parts in a Flask app: 
	- templates
	- static files
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

5. Why should we define specific version of libraries in `requirements.txt`? How can you find the version you should use?
6. What is the role of `@app.route` in defining one endpoint? Why we put that one right before defining the function. What is the default value for `methods`?
	```python
	@app.route('/', methods=['GET'])
	def main():
		return 'Hello'
	```
7. What is a decorator? Why should we use decorators in our Flask app?
8. What is the `config` attribute in Flask app? How can you define `TESTING=True` or `SECRET_KEY='abc'`?
9. Lots of modern servers normally return JSON files. What is JSON and why should we use it?
10. What is the default host and port in Flask? How can you change the host and port?

### 2. Kanban server

After working through a Flask example and watching the ToDo application being
built, you should feel comfortable building your own Kanban application.

Your Kanban application should be able to:
1. Create a new item in the "To do" state.
2. Move any item from any state ("To do", "Doing", or "Done") to any other state.
3. Delete an item when it is done.

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

### 4. (Optional) Get your hands dirty!
Please follow tutorials provided below if you want to have more experience with Flask.
#### _Option A. Flaskr Microblogging Tutorial:_

The official Flask tutorial covers setting up a simple microblogging
application. Work through the application here:
https://flask.palletsprojects.com/en/2.0.x/tutorial/

Only sections through "Blog Blueprint" are required.
However, other cool and important sections include "Test Coverage" and "Deploy to Production." It could be helpful to at least skim the central ideas of these sections for when you work "in the real world."

If you want to compare your results with the final output, have a look here:
https://github.com/pallets/flask/tree/master/examples/tutorial


#### _Option B. A Basic Todo Application:_

Follow the youtube video at: https://www.youtube.com/watch?v=4kD-GRF5VPs

```bash
pip3 install flask Flask-SQLAlchemy
```

Once the program is running, then you can visit: http://127.0.0.1:5000/ and see
everything working!  Try adding new tasks and then marking them as done.

Notice how straightforward it is to use SQLAlchemy with Flask.  It is strongly
encouraged that you use SQLAlchemy for both your final project and your web
assignment.

(Optional) Find out how to use checkboxes to mark an item as complete.

#### _Option C. The Simplest Flask Application Ever:_

Build a super-simple Flask application to your liking. Some ideas include:

1. Dice rolling service;
2. Email generator service;
3. A service that builds on the pre-class work you did for 9.1, the HTTP Requests class, like:
	- For instance, a simple maps service that pulls map data from Google Maps API
	- A service to query for current weather in different cities
	- A service to query for current cryptocurrency market prices
	- A service to query times in another time zone
4. Password generator (although it's bad to generate the passwords server side!)

Your web application should incorporate at least:
1. One HTTP `GET` request that retrieves something from either a local database or an online service.
2. One HTTP `POST` request. This will involve creating a form that takes user input (via HTML forms or Flask forms like WTForms).
3. A simple HTML frontend that has a form and has fields to output the values for your service.

Keep it short and simple!

You should be able to visit your site at: http://127.0.0.1:5000/.
