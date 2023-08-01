# Health and Fitness Tracking App

In this assignment, you will design a comprehensive database schema and SQL queries for a Health and Fitness Tracking App. The application aims to help users track their health metrics, log workouts, monitor nutrition, record sleep patterns, and offer personalized fitness recommendations. Your task is to propose a detailed SQL data schema and create SQL code to perform various data queries for the application.

## Assignment Instructions:

### Step 1: Health and Fitness Tracking App Overview

Provide a detailed description of the Health and Fitness Tracking App. Describe its primary objectives, target audience, and the specific health and fitness metrics it will track, including sleep data. Explain how the app will benefit users in achieving their fitness goals and maintaining a healthy lifestyle.

### Step 2: Identify Data Requirements

Identify the key data elements that the app needs to store and manage. This includes user data, workout information, nutrition logs, sleep patterns, and any other relevant health metrics. Discuss the relationships between different data elements and the importance of capturing these data points for the success of the application.

### Step 3: Design the SQL Data Schema

Based on the identified data requirements, design a detailed SQL data schema that accurately represents the structure of the database for the Health and Fitness Tracking App. Include all necessary tables, columns, primary keys, foreign keys, and constraints. Justify your data schema design decisions and explain how it aligns with the application's objectives.

### Step 4: SQL Query Scenarios

Create SQL code to perform various data queries that the Health and Fitness Tracking App may require. Ensure your queries cover a wide range of scenarios to extract valuable insights from the database. Consider scenarios related to workout tracking, nutrition analysis, sleep pattern assessment, user progress monitoring, and personalized recommendations.

### Step 5: Data Population

Generate sample data and populate the database with relevant records to test your SQL queries. Ensure that the data includes various user profiles, workout sessions, nutrition logs, sleep patterns, and health metrics. Use realistic values to simulate real-world usage scenarios of the application.

### Step 6: Query Optimization (Optional - Advanced)

As an optional challenge, explore ways to optimize the SQL queries you have written. Discuss any performance issues you encountered and propose potential solutions to enhance query efficiency.

## Submission

For this assignment you may write your SQL code directly in the SQLite dialect,
or else you may use SQLAlchemy and write python code. In either case, your
primary submission must be a PDF listing of a `README.md` file followed by the
rest of your code, but you must also submit a zip file containing all the code.
When this code is run then it must clearly print to screen the results of any
SQL queries that are run. As part of your assignment, your must highlight places
where you have appropriately used data normalization, indices, and transactions.
Please draw attention to any areas of your assignment where you have exceeded
the requirements of this assignment.

### Execution (Python)

In a `README.md` file you must include a series of commands to execute all the
relevant parts of your code:

These are the recommended commands for macOS:

```bash
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
python3 create.py
python3 insert_data.py
python3 query_data.py
```

Recommended commands for Windows:

```cmd
python3 -m venv venv
venv\Scripts\activate.bat
pip3 install -r requirements.txt
python3 create.py
python3 insert_data.py
python3 query_data.py
```

### Execution (SQLite)

In a `README.md` file you must include a series of commands to read the various
files your have submitted. For example:

```sqlite3
.read create.sql
.read insert_data.sql
.read query_data.sql
```

### Hints and best practices:

- Make sure you set up all your foreign key constraints and indexes correctly.
- Test your code! Unit tests are the best.
- Use the [Python Faker library](https://faker.readthedocs.io/en/master/) to generate as much random data as you need for your assignment.
- Write a clear README to summarize your work for this assignment.
- Explain the intent of your code, database design, and database queries in code comments.
- Please make sure that the virtual environment `venv` is **not** included in your Zip file. Virtual environments are not portable, and if you installed it
  on your laptop then it is unlikely to work anywhere else.
- Also, make sure the Python cache `__pycache__` is **not** included in the Zip file. This is less important than `venv` but it is still best practice to exclude it when distributing your source code. To understand why, [read this StackOverflow explanation](https://stackoverflow.com/a/16869074).
