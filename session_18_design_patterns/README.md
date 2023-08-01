## Design Patterns - Singleton and Iterator

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

## The Singleton Design pattern

One of the most common design patterns is the Singleton design pattern. This
pattern is used whenever there should only be a single instance of the class.
This occurs more often than you might suspect. Some examples include:

- **logging**: whenever you want to perform logging, then you want to perform
  the logging in a single consistent manner. This means that any configuration
  should be performed only once, and then reused.
- **database connections**: database connections are expensive to establish
  and close. It is much cheaper to instead maintain one (or more) connections,
  and let multiple threads share the single connection(s). This means that
  the same database connection should be used (and hence accesible) from
  anywhere in the program.

Notice the commonality here. In all cases there should be a universal means of
accessing a single object.

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

## Questions

### 1. Singleton Implementation: Logging

A Christmas Tree program is contained in the ChristmasTree folder.

- Run the file using `python3 main.py`.
- Consult the internet to find example implementations of a singleton in Python.
- Add your own FileLog class in `log.py` so that wherever you create a new
  Logger, that it ends up using the same set of handlers, even though in
  this case there is only a single handler class.
  - Just use an INFO level, a WARNING level, and an ERROR level.
  - No need for logging filters.
  - No need for logging formatters.
- **YOUR SOLUTION MUST NOT USE `import logging`! The point is to implement our own**
  **logging library**
- You must be able to change the appropriate level of logging **globally** by
  adding a single line of logging configuration in main.py.

Please note that the Christmas tree application is a very hypothetical set of
libraries. It generates a random set of presents and distributes them to a
set of children. However the library requires that the process follows a particular
order. The usage of the library in `main.py` first does things correctly, and then
does things incorrectly. This is fine. We are using this example purely as a means
of testing your logging library, so we actually want to generate a few warnings and
errors!

Bring your code to class and be prepared to paste it into breakout notes.

### 2. The clock iterator

An iterator doesn't necessarily need to raise the StopIteration exception if
you want to represent an infinite sequence.

An example infinite loop might be given by our digital clocks. These devices
endlessly display the time of day before looping back to display a new day.

In this question write a class `ClockIterator` which can be used in the
following code snippet:

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

## Design Patterns - Template

### Template - Queue

Read up on the implementation of the various Python Queue classes:
https://github.com/python/cpython/blob/3.5/Lib/queue.py
Don't pay too much attention to the low-level details, instead focus on the
high-level design of the three classes in that file.

In particular, notice how the `PriorityQueue` and `LifoQueue` have been
implemented. This should highlight the power of a good design using object-
oriented techniques.

### Template - Simulation

The template design pattern is a powerful design pattern that usually forms the
basis of most frameworks. In `template.py` a simple simulation framework is
given. (Notice that the `AbstractSimulation` class doesn't need to know
anything about the `CannonBall` class, which inherits from
`AbstractSimulation`.)

### Template - unittest

A very useful framework that has been built into the python libraries itself
is `unittest`. This module builds a simple framework for testing code.
One does this by writing small examples where one knows the input, as well as
what the output should be. Creating many such different tests (each test
testing a different aspect of functionality) makes it very easy to detect
when a bug has been introduced. One should just get into the habit of writing
tests with the functionality that you are developing, and one must also run
those tests before pushing any new features live.

_Unit testing is very important and will be fully covered in a later unit which
focuses on the automated testing and deployment of a system. You are still
encouraged to write unit tests for your project in the meantime!_

## Questions

**Bring both your code, and the output from running your code, to class.**

1. Explain the difference between a normal queue, a priority queue, and a LIFO
   queue. Give a real-world example where one might find each type of queue.

2. Create your own python file `rule90.py` and import the `AbstractSimulation`
   from `template.py`. Now write an implementation of Wolfram's Rule 90 cellular
   automaton. Further details on Rule 90 can be found at:
   https://en.wikipedia.org/wiki/Rule_90
   Your implementation must inherit from `AbstractSimulation`, and should be
   runnable using the `run()` method. If it simplifies your code, then you can
   assume a finite-sized list of automata. You can also choose the simplest
   initialization for your automaton.

3. Using your code from the previous session on creating a `ClockIterator`,
   write test code for the situations given below. 1. The first thing returned from a `ClockIterator` should be the string "00:00". 2. The 60th thing returned from a `ClockIterator` should be the string "00:59". 3. The 61st thing returned from a `ClockIterator` should be the string "01:00". 4. The 1440th thing returned from a `ClockIterator` should be the string "23:59". 5. The 1441st thing returned from a `ClockIterator` should be the string "00:00".

4. Think about the subsystem for the final project that you are working on.  
   What unit tests could you write to test the functionality of that system.  
   Remember to keep the tests as small and targeted as possible! Write up a short
   description of those tests and bring them to class in a format suitable for
   pasting in a google doc.

5. (Optional) The queue class is thread safe. Search the internet to find out
   what this means. What is required to make `put()` and `get()` thread safe?
