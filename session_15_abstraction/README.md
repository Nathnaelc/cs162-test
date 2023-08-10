# Session 4: Abstraction

This class develops the idea that abstraction is the key concept needed for developing large complex software applications.

In this pre class work, you will implement 4 versions of Blackjack.
Each version can be completely written by AI tools (if you can get them to produce working versions).

1. Implement blackjack in Python using only functions
2. Implement blackjack in Python using classes
3. Extend the functional implementation so that is easy to switch between two PRNG algorithms.
4. Extend the class-based implementation so that is easy to switch between two PRNG algorithms.

PRNG stands for Pseudo Random Number Generator. This is a fancy way of saying "random number generator".
The reason for the "pseudo" is that computers are deterministic machines, and so they cannot generate
truly random numbers. Instead, they generate numbers that are "random enough" for most purposes.

The two PRNG methods are:

1. Linear Congruential Generator
2. Mersenne Twister

What we have here are two paradigms, "functional" programming and object-oriented programming.
The extension represents a feature that needs to be implemented in each paradigm.
The goal is to see which paradigm is easier to extend, and build a short argument why it's the case.

- Look at the changes required for each paradigm. How many lines of code need to change? (How does this change if this was a codebase with millions of lines code, rather than a simple blackjack implementation?)
- What code would need to change in the extended version of each paradigm if we wanted to add a third PRNG algorithm?
- What code would need to change if we needed to run several versions of the same PRNG algorithm in parallel?

Build an argument on which paradigm is easier to extend, and why.

## Submission:

- Please commit all 4 versions to your PCW repo.
- Test that they work by running them from the command line. Do they handle ace values correctly? Are there any bugs?
- Sketch out your argument for which paradigm is easier to extend in a markdown file called `README.md` and commit it to your PCW repo.
  Your argument should refer directly to lines of code in your implementations as supporting evidence.
  Part of your argument should clearly define #abstraction in a software context, and explain why it is important.
- Also be prepared to discuss your argument in class.

(Again, you can freely use AI tooling to help you write the argument, as long as you are able to explain and defend it in class.)
