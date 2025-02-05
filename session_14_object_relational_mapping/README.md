# SQLAlchemy

SQLAlchemy is a object-relational-mapper (ORM). This means that it is able
to map from object-oriented code that you write in Python into SQL commands
that a database understands.

This layer of abstraction can allow an engineer to focus on writing good
object-oriented code, while SQLAlchemy will then map this into easy access on a
database. Having a layer of abstraction allows one to easily change the
underlying database. It is common for testing code to use a SQLite database,
while in production the code instead connects to a beefy server that is
able to satisfy many simultaneous queries coming from many machines.

# SQLAlchemy vs. SQLite3

Why don't we just use SQLite3 in Python (as seen in `SQLite3Sample.py`)?

Using an ORM like SQLAlchemy allows code to be used unchanged when connecting to different databases. This might allow us to use different databases in different contexts. Maybe we want fast unittests to run against a simple and small sqlite database, however we want to run a hefty server running Postgres in production. All that will need to be changed is the connection string (which can even be set in an environment variable).

For comparisons with an SQLite3 implementation in Python, compare `SQLAlchemySample.py` and `SQLite3Sample.py`. Check out this [link](http://www.sqlite.org/whentouse.html) to read more about when SQLite works well and when it doesn't.

# SQLAlchemy Tutorial

Work through the SQLAlchemy tutorial in the readings and then answer the questions at the bottom of the page.

## 1. Local Setup

First, install SQLAlchemy in terminal with:

```bash
$ pip install sqlalchemy
```

## 2. Setup on a Python Module

### Import SQLALchemy

```python
import sqlalchemy
```

### Create Engine

```python
from sqlalchemy import create_engine
engine = create_engine('sqlite:///:memory:', echo = True)
```

What's happening with the `create_engine()` function?

The engine connects to the database, and this function specifies which database it should connect to.

What is `sqlite:///`? Firstly, this initialises an SQLite Database, which allows us to use SQLite syntax the way we have learnt in prior classes.

`:memory:` simply implies that the SQLite database will not persist beyond individual sessions.
The database will only persist as long as the application instance is running.

If we do:

```python
engine = create_engine('sqlite:///try_database.db')
```

Then this creates a local .db file named `try_database.db` (if it doesn't exist already on your path). We will learn how to use SQLAlchemy to open up the .db file and see if there are any new entries. This `database.db` file will persist locally.

### Connect to engine

Now, connect to the engine interface that you created using the default `connect()` function.

```python
engine.connect()
```

### Declare a Base

The base maintains a catalogue of classes and tables in the base; each application will usually have one.

```python
from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()
```

After declaring a base, we will be able to define classes relative to the base. So each class should be created as class `'tablename'(Base)`.

### Create a Table Mapping

Let's initialise a simple table `Users` by initialising a User class and writing a `__repr__()`method to represent the schema.

```python
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship, sessionmaker

class User(Base):
	__tablename__ = 'users'
	id = Column(Integer, primary_key = True)
	name = Column(String)
	insurance_id = Column(Integer)

	def __repr__(self):
		return "<User(id={0}, name={1}, insurance_id={2})>".format(self.id, self.name, self.insurance_id)
```

Let's create another table to display foreign relationships.

```python
class Insurance(Base):
	__tablename__ = 'insurance'
	id = Column(Integer, ForeignKey('users.insurance_id'), primary_key = True)
	claim_id = Column(Integer)
	users = relationship(User)
```

### Create the Table Schema

After defining the schema of the table, we will need to actually create it in our database.

We have to call:

```python
Base.metadata.create_all(engine)
```

This is very important, as without calling `create_all(engine)` and binding it to the engine, the schema will not be initialised. Your table should now be created, and you will be able to add elements to it.

## Adding Elements to SQLAlchemy

Create an instance of your `User` class with:

```python
user = User(id = 1, name='sterne', insurance_id=1234)
```

And then add it to your DB, by starting a session.

```python
from sqlalchemy.orm import sessionmaker

Session = sessionmaker(bind=engine)
session = Session()
session.add(user)
session.commit()
```

`user` should now be in your database!

## Querying your Table

Let's check if `user` is in the database.

```python
print(session.query(User).filter_by(name='sterne').first())
```

It should print out:

```
<User(id=1, name=sterne, insurance_id=1234)>
```

Great!

## Reflecting an Existing Database with SQLAlchemy

Reflecting a table simply means being able to read its metadata, and being able to use SQLAlchemy to read the contents of the table.

```python
from sqlalchemy import Table, MetaData
metadata = MetaData()
users = Table('users', metadata, autoload=True, autoload_with=engine)
```

Load the table `users` that you initialised before with the above function.

The `autoload_with=engine` parameter ensures that it's connecting to the right engine interface.

### Print table metadata

The `__repr__()` method that you defined in your `User(Base)` class will return a string detailing the details of your database in the format you chose.

```
print(repr(users))
```

# Questions

Use the tutorial above as a guide to the following exercises. After reading the tutorial, check out the `SQLAlchemySample.py` file for a working implementation.

## Rewriting previous exercises

Choose 1 of these 4 SQL design exercises:

1. Personal Finance Management App
2. Recipe Recommendation and Meal Planning App
3. Online Bookstore and Inventory Management
4. Fitness Class Booking and Attendance Tracking

Choose 1 of these 4 exercises:

1. Online Learning Management System
2. Patient Health Record and Medical History Tracker
3. Car Rental and Fleet Management Platform
4. E-commerce Customer Support Ticketing System

In particular, you should rewrite the following parts of the exercise:

1. The `CREATE TABLE` commands should now use SQLAlchemy. The SQLAlchemy
   commands should also create primary key and foreign key constraints where
   appropriate.
2. The `INSERT` commands should now use SQLAlchemy.
3. The `SELECT` commands should now use SQLAlchemy. Make sure that you retrieve
   only relevant rows, and that you do not retrieve any extra rows. (In the past,
   some students have retrieved all rows from a table, and then filtered the rows
   using Python code. This is not acceptable, and will not work in a real-world
   database with millions of rows.)

### Expectations

You should use AI tools to write as much of the code for you as possible.
You should fix any mistakes that the AI tools make, and you should also
write any code that the AI tools cannot write for you.

### Submission

Be sure to commit your Python code to the PCW repo before you come to class.
Please make clear which of the exercises you are doing.
Your code should be well commented. The code can also be relatively unstructured
(e.g. no functions, and everything in a single file), but it should be clear
what each part of the code is doing.

When TAs are reviewing your code, they will start by looking for the db schema diagram
for the previous exercise, and then compare the schema diagram to the SQLAlchemy
code. Then they will run the Python code, and verify that the results are identical
for both the SQLAlchemy and SQLite versions. Then they will read the Python code,
and double check the logic.

## (Optional) Unit of Work

SQLAlchemy uses the unit-of-work design pattern to decide when to send updates to the
database. Read up on the unit-of-work design pattern, and then look at the
source code of SQLAlchemy where it implements it:

https://github.com/zzzeek/sqlalchemy/blob/master/lib/sqlalchemy/orm/unitofwork.py
