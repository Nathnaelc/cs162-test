## ACID and transactions

As a database grows in complexity there tend to emerge natural constraints as
part of the data modeling process. Fortunately, SQL provides ACID guarantees,
which can prevent any inconsistencies that violate those constraints.

An example
is a book exchange database. Every time two people swap a book,
there are two updates that need to happen. We need one new entry in the database
showing that book A was given to person 1 from person 2, and another entry
showing that book B was given to person 2 from person 1. If these two updates
are interrupted halfway through then it will look like book A was given with
nothing given in return. This would defeat the whole point of a book exchange.
The problem only gets more acute when dealing with money (the books don't
balance).

It is far better to make the updates all-or-nothing (atomic). This means that
the database is always in a consistent state. Today's exercises focus on sets
of instructions that must either all succeed, or all fail to ensure that the database
is left in a consistent state.

### ACID guarantees

Research and understand ACID guarantees (atomicity, consistency, isolation,
durability), for example [here](https://www.geeksforgeeks.org/acid-properties-in-dbms/).

### Write-ahead logging

Read up on [write-ahead logging](https://www.sqlite.org/wal.html). Using the
ideas contained there, write out a small example showing several updates being
made to a database using a write-ahead log. Show that if the update is
interrupted at any point then the database will be able to revert to a
consistent state.

This question does not require any code, but it does require a clear, detailed,
step-by-step description of the process.

## Questions

Using AI tools, create SQLite code for the following apps:

1. **Online Learning Management System**
2. **Patient Health Record and Medical History Tracker**

In your SQL queries, make sure to include at least two SQL transactions.
Give a short explanation of why you chose to use transactions in those places.

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
