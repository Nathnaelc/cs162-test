# Session 4: Abstraction

In this pre class work, you will complete two tasks.

1. Add support for a new language into a existing game (see part 3) 
2. Implement random number generators (see part 4)

Be sure to read through each prompt carefully and understand the expected outcome.

## 1. Get started

To set up a suitable [environment variable](https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html) for this session's code:

**Windows**
```bash
set PYTHONENCODING='utf-8 python3 blackjack.py'
```
**macOS**
```bash
export PYTHONENCODING='utf-8 python3 blackjack.py'
```

Next, run the Blackjack program.

```bash
python blackjack.py
```

You should be able to play a simplified form of Blackjack.

## 2. Read `blackjack.py` and identify its structure

The exercise for today's seminar is to refactor this program into a well-designed, object-oriented program. An object-oriented program is not necessarily a good program, and what follows is a short justification of why we should care about good design and object-orientation.

For this course, we will consider a program to be well designed if:

>There are many potential features that could be added to the program, and each feature only requires a small number of locations to edited.

This is arguably *the* key aspect of good design.
It is the only requirement that allows a project to grow in scale and complexity.
If you have a project of millions of lines of code (e.g., the Linux kernel or a modern web-browser) then good design is essential.
Consider a large project that is badly designed (i.e., adding a single feature usually affects the entire codebase) then progress will necessarily be very slow.
Not only will an engineer need to understand millions of lines of code, but they will also need to simultaneously make changes in many locations to avoid introducing bugs.
This bad project also has the side effect that whenever one new feature is rolled out by another team, it will most likely affect the progress of all other teams ("stepping on each other's toes").

The thing that can save us is the notion of abstraction.
We can break down a large project into many small subsystems.
Each subsystem can hide the complexity of the implementation from other subsystems.
This decouples what a subsystem does from how it does it.  

This notion of good design doesn't necessarily lead us into object-oriented principles, and there have been other interesting approaches (e.g. Google's functional programming techniques).
However, historically object-orientation has been the most successful and scaled to the largest projects.

Phew! That was quite a long aside.
Let's get back to today's task of getting a better codebase for our little Blackjack project.
This is a poorly designed project because all sorts of things are done all over the place.

Before moving on, read through `blackjack.py` to see how the random number generator is used in many different places. This is an example of poor design.

## 3. Add support for another language

Now, let's look at an example of good design.

Run the following code in a terminal:

**Windows**
```bash
set LANG=zh_CN
python blackjack.py
```
**macOS**
```bash
LANG=zh_CN python blackjack.py
```

And the Blackjack program is in Chinese!

Minerva is a very multicultural institution with many different languages being spoken.
While we use English in the classroom, we certainly should accommodate non-native speakers if they want to play Blackjack in their leisure time and in their native language.
The best way to do this is to abstract away how a particular prompt in the game is presented to the user.

A bad implementation will require a single global variable called language and have code littered with if statements like this. (Please excuse my Google translation.)

```python
if LANGUAGE == 'en':
    print('You have gone bust!')
elif LANGUAGE == 'de':
    print('Du bist Pleite gegangen!')
elif LANGUAGE == 'es':
    print('¡Te has vuelto loco!')
```

Every time we want to add another language, we would need to find each if-statement in the whole code base and add the appropriate translation for that language.

A good implementation should require translation changes in one location or a very small number of locations in the code.

Complete the following steps to add support for your language. The steps below are based on [this resource](https://inventwithpython.com/blog/2014/12/20/translate-your-python-3-program-with-the-gettext-module/).

1. Make sure you are in the right working directory for Session 4, `cs162\session_04`:

   - For a guide on changing directories (Windows) refer to here: https://www.howtogeek.com/659411/how-to-change-directories-in-command-prompt-on-windows-10/ 
   - For Mac here: https://www.macworld.com/article/221277/command-line-navigating-files-folders-mac-terminal.html
   - On Windows, you must use the command prompt as an administrator: https://www.howtogeek.com/194041/how-to-open-the-command-prompt-as-administrator-in-windows-8.1/ 

2. Download `pygettext.py` to the `session_04` directory:

   - The file is part of the Python organization on Github. [You can find the file at this link.](https://raw.githubusercontent.com/python/cpython/main/Tools/i18n/pygettext.py)
   - Download/Save the file to your computer.
   - Move the file to the `session_04` directory located on your computer.

3. Run the following command: (pygettext.py should be in the same folder)

   ```bash
   python pygettext.py -d blackjack blackjack.py
   ```
  This will generate a `.pot` file.

4. Download PoEdit here: https://poedit.net/download

   - Open your new `.pot` file using PoEdit
   - Choose the new language you want to use. Standardized Script-Language codes are here: https://www.softaculous.com/docs/admin/scripts-language-codes/
   - You can either translate by manually typing into "translation" or use their auto-generated translations on the right panel

5. In the pre-class work folder (under `session_04/locale`) create a new folder: <YOUR_LANGUAGE_CODE>/LC_MESSAGES

6. Save the translation from PoEdit to this new sub-sub directory as "blackjack"

   - PoEdit will handle the file extensions
   - This will create a `.mo` and `.po` file. Whatever you do **do not edit these files manually**
   - You can also just save as is, and then manually change the name of the .mo file to "blackjack.mo"
   - Your sub-directories should be formatted exactly the same as for `zh_CN/LC_MESSAGES`

7. In terminal run:

   **Windows:**
   ```bash
   set LANG=<your_new_language_code>
   python blackjack.py
   ```
   **macOS:**
   ```bash
   LANG=<your_new_language_code> python blackjack.py
   ```

8. The Blackjack game should now run in the new language you have chosen. Repeat for as many languages as desired!

### Think about the following questions

1. Did you write any code?
2. Did the translation process require any knowledge about programming?
3. Why is this a good implementation of abstraction?

## 4. Abstracting out the random number generator

In a real project, we would (and should) use the facilities provided by python in the `random` module. However, this exercise gives you the opportunity to design a simple class and to see how the refactored code is (hopefully) simpler and better separated from the rest of the code.

The current implementation of the random function within blackjack is badly designed. Think about whether there are any leaks in the current version of implementation, and whether it satisfies the concept of abstraction.

### 4.1 Refactor the current random number generator 

It turns out that [RANDU](https://en.wikipedia.org/wiki/RANDU) is actually a bad random number generator (and RANDU was used by many real scientific computing centers for over a decade).
A better choice is to use a lagged Fibonacci generator (which is what is actually used in the `random` module).

In order to change to a new random number generator, we first have to make it easy to isolate the current random number generator.

Identify the following:

1. The current implementation refers to the data for the random number generator in many different lines. Identify each line of code where this happens.
2. If we are using a random number generator, what functionality do we actually care about and what functionality is internal to the random number generator? That is, how can we abstract out the random number generator?

Program the following:

1. Build a random number generator function based on the existing RANDU code
2. Refactor your blackjack code. Create a new random number generator class that can be used to easily switch between different random number generator functions
3. Use this new class throughout the rest of the code

**HINT:** You do not need to implement any new random functionality. The goal is to reorganize the existing random functionality. A lot of this refactoring can be done by moving (copy and pasting) existing lines of code.

### 4.2 Use a new random number generator 

There is some example code for you to use in the file `mersenne.py` (this python code is adapted from [here](http://code.activestate.com/recipes/578056-mersenne-twister/)).

Your next task is to refactor this code so that it is also in a class so that you can switch the random number generator used by the Blackjack code between the two classes.

**HINT 2:** Your classes might look something like this.

```python
# Class design
class Mersenne:
  def __init__(self, seed=None):
    if seed is None:
      self.seed = ...
    else:
      self.seed = seed
    self._initalize()
  def _initalize(self):
    ...
  def _generate_numbers(self)
    ...
  def sample(self):
    ...

class RANDU:
  def __init__(self, seed=None, c=65539, m=2147483648):
    self.c = c
    self.m = m
    if seed is None:
      ...
    else:
      ...
  def sample(self):
    ...
```

From this code, we can easily change the random method by changing the initialization of ```rand``` to ```rand = Mersenne(seed)```. The idea is to design ```Mersenne``` and ```RANDU``` classes to achieve this goal.
