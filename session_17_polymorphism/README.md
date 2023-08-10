## Polymorphism

### Dunder methods

### Logging handlers

### Abstract Base class

## Questions:

### 1. DIY Class hierarchy

Using AI tools, create a class hierarchy of your own design. You should have
at least 6 classes, and at least 2 levels of inheritance. You should have at
least two polymorphic methods that are overridden in the child classes.

For example, you can have `Animal` as the base class, `Mammal` and `Bird` as the
first level of inheritance, and `Dog` and `Cat` as the second level of inheritance.
You can then have a polymorphic method `speak()` and `act()`.

**Please don't do an animal hierarchy!** I want to see your creativity!

Come to class, with your code ready to paste for the prep poll.

### 2. The Python base `object`

Python provides certain functionality to all classes.

At the REPL, typing `type(x)` will show what type of variable `x` is, while
`dir(x)` will reveal all the methods that x has. Investigate the default behavior
of t. Examine the behavior that python gives using the following few lines of code:

```python
class BlankClass(object):
    '''This is a Blank class for CS162.'''
    pass
t = BlankClass()

class ClassWithAttr(object):
    x1 = 1
    x2 = 2

my_attr = ClassWithAttr()
my_attr.x3 = 3
```

Now find out about the following methods:

1.  help(t)
2.  type(t)
3.  dir(t)
4.  hash(t)
5.  id(t)
6.  hasattr(my_attr,'x3')
7.  getattr(my_attr,'x3')
8.  delattr(my_attr,'x3')
9.  vars(my_attr)
10. bool(t)

_Come to class able to give clear explanations of what is going on in each of
the above methods, and when one might use them._

### 3. Dunder methods

Using AI tools create a Python class that implements 5-10 interesting dunder
methods.
A good list of dunder methods can be found [here](https://mathspp.com/blog/pydonts/dunder-methods).

Please choose the dunder methods yourself, and make sure that you choose
methods that you understand. You should be able to explain what each method
does, and when it is called.

1. Write calling code that shows off the functionality of your dunder methods.
2. Add docstrings to your class and the dunder methods, and use the `help()`
   function to show off your documentation.
3. Bring your code to class and be prepared to paste it into breakout notes.

### 4. Logging

Logging is very useful, and a great example of polymorphism in action.

Read up on the different logging handlers here:
https://docs.python.org/3.5/library/logging.handlers.html#module-logging.handlers

Look at the source code for the logging module here:
https://github.com/python/cpython/blob/3.5/Lib/logging/handlers.py

1. Build up a list of all the classes defined in the logging library, and all
   the parent classes that it inherits from.
2. Now choose a class that inherits from logging.Handler and list all the
   methods that one can call on that handler.
3. Find a simple online tutorial on logging in Python and work your way through
   it.
