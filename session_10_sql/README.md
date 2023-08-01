## SQL

For the unit on SQL we will be focusing on SQLite. This is a small
relational database which saves all tables from a single database
into a single file.

For the first few sessions, it is recommended that you run sqlite3 directly
through the sqlite3 shell. Search the internet for help to you get this up
and running for your particular platform.

For Windows 10 users, see here for help: https://www.youtube.com/watch?v=wXEZZ2JT3-k

SQlite comes preinstalled with Mac. If for some reason this is not the case, follow similar steps above.

Once you are able to run commands in the shell then you can begin creating
tables, inserting data and querying the data. A good approach is to
create a single long text file containing all the commands. Depending on the
platform the following might work for a file called `create.sql`:

```bash
$ sqlite3 < create.sql
```

This will execute all the commands against an in-memory database. If you want
the database to persist then you can tell sqlite to store the database in a file:

```bash
$ sqlite3 cs162.db < create.sql
```

Be careful when referring to the same .db file when tables are already created.
After running once, you can comment out CREATE and INSERT commands (or think about other solutions you might want to implement in production)

If your platform does not support piping in the commands then you will have to
do the following:

```bash
$ sqlite3
SQLite version 3.16.0 2016-11-04 19:09:39
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite> .read create.sql
```

Remember to comment your SQL commands! Single line comments use a double
hyphen (`--`), while multi-line comments use `/* ... */`.

## SQLite Cheat Sheet

There are many helpful commands in SQL. To get started, it may be helpful to review these cheat sheets or have them on the side as you're working through problems:
https://www.sqlitetutorial.net/sqlite-cheat-sheet/
https://d17h27t6h515a5.cloudfront.net/topher/2016/September/57ed880e_sql-sqlite-commands-cheat-sheet/sql-sqlite-commands-cheat-sheet.pdf

For a more comprehensive general SQL cheat sheet, see "SQL_cheat_sheet.pdf"

## Foreign Keys in SQLite Database

Foreign keys are created to enforce relationship between two tables. Generally, a foreign key in child table would be a column that is the primary key of primary table. The syntax to create the foreign key is

```
FOREIGN KEY (<Name of Variable>) REFERENCES <Parent Table>(<Name of foreign key>)
```

Foreign keys in Sqlite database are disabled by default for backward compatibility so, the foreign key constraints should be enforced at the beginning of SQL script or every time running the script.
The foreign key constraints can be added by following command:

```
PRAGMA foreign_keys = ON;
```

Further information is available at [https://sqlite.org/foreignkeys.html](https://sqlite.org/foreignkeys.html)

## Questions

Using AI tools, create SQLite code for the following apps:

1. **Personal Finance Management App**
2. **Recipe Recommendation and Meal Planning App**

Pay particular attention to primary keys and foreign key constraints.

You can get the tools to write _all_ of the code, but you do need to ensure:

1. The whole approach / idea / shema is sensible.
2. There are no logical errors in the SQL queries.
3. You can explain every line of generated code.

You can also use AI tools to explain the code to you. Just remember
that you can often get a confident explanation which turns out to
be wrong. So you need to be able to spot when the explanation is
wrong.

There are several steps to this process:

1. Create a new DB schema for each app.
2. Generate plausible data for the schema.
3. Decide on sensible questions that the user would need to know.
4. Write SQL queries to answer the questions.
5. Generate a diagram for each schema. Bring this diagram to class to assist you in discussing your design.

### Expectations:

1. A solution will probably need 4-8 tables in total.
2. Each table will need 3-20 rows of mock data. (This will depend on the app, and the questions you want to ask of it.)
3. Try to generate 3-5 questions for each app. The questions aren't necessarily
   deep or difficult. (For example, a user might need to know their monthly spend in
   a personal finance app.) Please explain why you feel the question is relevant.
4. After you have been through a couple of these, then we will expect you to understand the some of the deeper design issues. For example, you might need to think about how indexes will make your queries more efficient. Or how normalization will make data more reliable.
5. Generating this shouldn't take longer than 30 minutes. If you are spending longer than this, then you are probably overthinking it. (Or you are trying to generate a very complex app.) In total, you should spend about 3 hours on class prep - including readings, generating, debugging, and understanding the code. Expect to spend more
   time debugging and understanding the code than generating it.

### Submission:

Be sure to commit your SQL code to the PCW repo before you come to class.
Please also add short explanations of SQL code to give more context. You can
do this by adding comments directly in the SQL code, or by adding separate markdown
files to the repo to give broader context. Please include the ER diagram for each db schema as well.

When TAs are reviewing your code, they will start by looking for the db schema diagram
and then they will read the comments. Finally, they will look at the SQL code.

### Hints:

1. Chat a lot with your favorite chatbot. They are good at solving this.
2. Prompt your favorite chatbot to describe the application in more detail before you jump into a SQL schema. Edit the desciption to make it more precise.
3. Use the description to generate the schema.
4. Use the description of the application to also identify the queries that might need to be run.
5. **Once you have a schema and queries, then you must run everything in a sqlite3 shell to check that it works.**
6. Ask your favorite chatbot to generate a dot file directly from the schema. This is probably the easiest/most automated way to generate a schema diagram. (You can also ask your favorite chatbot on how to convert a dot file into a png file.)
