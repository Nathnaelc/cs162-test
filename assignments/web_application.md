# Hierarchical Todo List App

## Description

The goal of this assignment is to create a web application that allows users to
create hierarchical todo lists. The application should allow users to create
multiple lists, and each list should be able to contain multiple items. Each
item should be able to contain multiple sub-items, and so on. The user should
be able to create, edit, and delete lists and items. The user should also be
able to move items between lists.

Your visual design can be very straightforward. In practice, a
true recursive solution is difficult to style in a way that is both
visually appealing and easy to use. For this reason, you are allowed to
limit the depth of the hierarchy to 3 levels. (This means that
each list can contain items, and each item can contain sub-items, and
each sub-item can contain sub-sub-items, but no further.)

The true value of a hierarchical todo list is that it allows users to
hide the sub-items of a given item. This allows users to focus on the
most important tasks, and to hide the details until they are ready to
deal with them. For this reason, your application should allow users
to hide and show the sub-items of any item.

## Submission

1. Your primary submission must be a PDF listing of your Python code. This will allow your grader to attach feedback to the code in the PDF. Please do not put any CSS / HTML files in the pdf. Only include the README, and Flask / React code.
2. Your secondary submission must be a Zip file containing all the code and documentation for your project. This will allow your grader to run your code and interact with the app.
3. Finally, you need to demo your project. Provide a link in your `README.md` file to a screen recording of you using your app and explaining what you are doing. Demo all the features of your project. The screen recording should be at most 5 minutes long but probably more like 3 minutes long in most cases.

## Installation

As part of your submission you must include a Zip file with all the necessary
code and HTML, a `requirements.txt` file, and a `README.md` file. To get your
application to run should only require the following steps:

**macOS:**

```bash
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
python3 app.py

npm install
npm start
```

**Windows:**

```bash
python3 -m venv venv
venv\Scripts\activate.bat
pip3 install -r requirements.txt
python3 app.py

npm install
npm start
```

**Please try to download your assignment and run it before submitting it!**

## Hints and best practices

- You can do this using exclusively Flask, and you can do this using exclusively React. But you will probably have a better product if you use a bit of both. (There are cases where you might want to be strategic, for example, you might want to focus your efforts exclusively on the backend for this project, and for the final project.)
- Write a clear README to give an overview of your project, its features, and where the different parts of the code are located.
- Write detailed code comments. The code comments should explain the intent of the different parts of your code. (Or get a tool which comments your code for you!)
- Test your code! Unit tests are the best, and good tests get a bonus 4 for #testing.
- Make sure your screen recording is shared/viewable by your grader. [Loom](https://loom.com/) is a great tool that runs in your browser and is free for educational (`.edu`) accounts. (You don't have to use Loom if you prefer something else.)
- Please don't worry about polishing your demo! It's fine if you make mistakes, and it's fine if you have to repeat yourself. The purpose of the demo is to show that you have a working app, and to give you a chance to explain what you did.
- Make sure that the virtual environment `venv` is **not** included in your Zip file. Virtual environments are not portable, and if you installed it on your laptop then it is unlikely to work anywhere else.
