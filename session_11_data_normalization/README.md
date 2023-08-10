## Data Normalization

Data normalization refers to the degree to which potentially-shared
information is moved into separate tables.

### Definitions of normalization

Search the internet and find good definitions and examples of the following:

- First normal form
- Second normal form
- Third normal form
- Denormalization
- Composite key

Simple examples are given [here](https://www.essentialsql.com/get-ready-to-learn-sql-database-normalization-explained-in-simple-english/), and [here](https://www.youtube.com/watch?v=UrYLYV7WSHM)
but you might find better resources. Compare those answers with the
answers given by a chatbot of your choosing.

## Questions

Using AI tools, create SQLite code for the following apps:

1. **Online Bookstore and Inventory Management**
2. **Fitness Class Booking and Attendance Tracking**

Make sure you understand what normal form your design corresponds to.
Be able to give an example of how your design would need to change to
move to a **lower** normal form.

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
