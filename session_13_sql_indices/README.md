## SQL indices

A SQL index allows us to keep track of the rows in a table sorted by a particular
column. In nearly all cases this dramatically speeds up SQL queries!

### Finding a row

```sqlite3
SELECT * FROM table1 WHERE IDNumber = 87987987;
```

If there is no index on IDNumber, then this query will get expanded into
something like the following pseudocode:

```python3
for row in table1:
    if row.IDNumber == 87987987:
        print(row)
```

If there are roughly _M_ rows in table1, then this will require work roughly
proportional to _O(M)_. On the other hand if a index is created then it is
possible to do a tree traversal on the index to find the correct location.
If the rows are unique, then the tree traversal will be _O(log M)_ work. For
a large table, this is a huge difference in efficiency.

### Joining a table

Joins on un-indexed columns are essentially implemented as nested for loops.
For example, the query:

```sqlite3
SELECT * FROM table1 INNER JOIN ON table2 WHERE table1.data1 = table2.data2;
```

will get expanded into something like the following pseudocode:

```python3
for row1 in table1:
    for row2 in table2:
        if row1['data1'] == row2['data2']:
            print((row1, row2))
```

If table1 has _M_ rows and table2 has _N_ rows, then the database will need to
do work roughly proportional to _O(MN)_.

### Large un-indexed tables

(Run this exercise through an AI tool and work through the answers.)

In `random.sql` there is a slow query which joins three un-indexed tables
together. Since this is a nested for loop and the tables are roughly the
same size then it will take _O(N³)_ time.

1. Now figure out how to index the table(s) such that the query is able to run
   much faster.
2. Quantify the time taken for each version with the `.timer` command.
3. Write pseudo code explaining how the fast query is now being implemented.
4. Give your estimate of the asymptotic scaling behavior in big-O notation
   for the fast query.
5. Give the asymptotic scaling behavior for creating an index.

(Note that SQLite's query planner is smart enough to create temporary indices
in this case, and it's still faster than the naive scan. We have to
explicitly turn off the automatic indexing to better understand what's going
on.)

### Query optimization and indices

(Run this exercise through an AI tool and work through the answers.)

Some SQL commands can run much faster if the order of constraints is changed.
For example, consider:

```sqlite3
SELECT Name, Phone FROM Customer WHERE Gender = 'f' AND ZipCode = '90210';
```

It would be inefficient to efficiently find all female customers, and then
scan through all zip codes. Instead it is better to find all customers in the
given zip code and then select the women.

1. Give pseudo-code for the case that there are no indexes.
2. Give pseudo-code for the case that there is an index on Gender. Roughly how
   much more efficient is this than without any indices? (Assume your
   customers follow the same gender distribution as the general population.)
3. Give pseudo-code for the case that there is an index on ZipCode. Assuming
   that there are roughly 10,000 different zip codes for your customers, how
   much more efficient is this than without any indices?
4. Find out about composite indices. What would a good composite index look
   like in this case? Write pseudo-code for this case.
5. Find out what a covering index is. What would it look like in this case?
   Is a covering index more or less efficient than a composite index, and why?

## Questions

Using AI tools, create SQLite code for the following apps:

1. **Car Rental and Fleet Management Platform**
2. **E-commerce Customer Support Ticketing System**

Pay particular attention to the necessary indexes which will be needed to
make the queries efficient. (Also, make sure that your queries benefit from
the indexes!)

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
