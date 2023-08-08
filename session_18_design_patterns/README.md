## Design Patterns - Iterator and Template

Design patterns are a set of architectural solutions to common problems.
By following these design patterns when appropriate you will be able to build
well-designed software systems without needing many years of experience to
get there. Instead you will just need to know when a design pattern applies
and what the most appropriate pattern is for a given situation. (But don't
turn all your code into a collection of design patterns!)

These design patterns are also useful for communication. Since a design pattern
often encompasses several classes together, it can be much more efficient to
simply say "our simulation uses a template pattern", than describe each class
and its relation to the other classes.

## The Iterator Design Pattern

Many objects in Python are iteratable. This means that they can produce items
in some sort of order.

Run the following code in a terminal:

```python
t = [1,2,3]
it = iter(t)
print(next(it))
print(next(it))
print(next(it))
print(next(it))
```

Notice that `iter()` and `next()` are actually keywords in Python, which shows
how important iterators are to the language!

By providing this simple interface it allows us to consistently use the same
code for dealing with sequences, even if there are wildly different
implementations underneath. The code could be displaying a simple linked list,
or it could be making web calls to an online service and displaying consecutive
results.

## The template design pattern

With the Template Design Pattern, we can create a basic structure in a base
class and let subclasses fill in the specifics. Think of it like a blueprint
for algorithms! We'll use inheritance and encapsulation to make it happen.

## Questions

### 1. The clock iterator

An iterator doesn't necessarily need to raise the StopIteration exception if
you want to represent an infinite sequence.

An example infinite loop might be given by our digital clocks. These devices
endlessly display the time of day before looping back to display a new day.

1. Write a class `ClockIterator` which can be used in the following code snippet:

```python
clock = ClockIterator()
for time in clock:
    print(time)
```

And the code should produce an infinite loop of output:

```
00:00
00:01
00:02
...
23:59
00:00
...
```

Bring your code to class and be prepared to paste it into breakout notes.

### 2. Template - Queue

Read up on the implementation of the various Python Queue classes:
https://github.com/python/cpython/blob/3.11/Lib/queue.py
Don't pay too much attention to the low-level details, instead focus on the
high-level design of the three classes in that file.

In particular, notice how the `PriorityQueue` and `LifoQueue` have been
implemented. This should highlight the power of a good design using object-
oriented techniques.

1. Explain the difference between a normal queue, a priority queue, and a LIFO
   queue. Give a real-world example where one might find each type of queue.
2. Copy portions of the code from the `queue.py` file into your notes.
   in particular, focus on the following methods: `put`, `get`, `_init`, `_qsize`,
   `_put`, `_get`, `_qsize`, for the `Queue` class, the `PriorityQueue` class,
   and the `LifoQueue` class.
3. Using the code from (2) explain how the `Queue` class is used as a
   template for the other two classes. What is the same between the three
   classes? What is different?
4. Bring your code to class and be prepared to paste it into class notes if
   called on.

### 3. Template - unittest

A very useful framework that has been built into the python libraries itself
is `unittest`. This module builds a simple framework for testing code.
One does this by writing small examples where one knows the input, as well as
what the output should be. Creating many such different tests (each test
testing a different aspect of functionality) makes it very easy to detect
when a bug has been introduced. One should just get into the habit of writing
tests with the functionality that you are developing, and one must also run
those tests before pushing any new features live.

Unit testing is very important and will be fully covered in the next class which
focuses on the automated testing and deployment of a system.

1. Using AI tools, implement your own unit testing framework **that uses the
   template design pattern.**
2. Using your code from (1), write several simple tests for the `ClockIterator` class.
3. Make sure the code runs, and the tests pass!
4. Bring your code to class and be prepared to paste it into breakout notes.
