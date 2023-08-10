## Inheritance vs Composition

Today's reading and exercises will help you better understand when to use inheritance and when to use object composition.

If you have confusions once you have completed the readings, then please use AI tools to help answer your questions.

Now complete the following questions:

## Questions:

### 1. Zoo management system

Design a system to manage a zoo. The zoo has many different types of animals,
each of which has different needs. For example, a lion needs to be fed meat
while a giraffe needs to be fed leaves. All animals live in different enclosures
which have different properties.

For example, the savannah enclosure has:

1. A daily feeding schedule
2. A temperature range of 25°C - 31°C
3. Contains herds of zebra, giraffe, and antelope

While the shark enclosure:

1. Has a weekly feeding schedule
2. A temperature range of 17°C - 18°C
3. Contains a single shark

Looking at the animals in the zoo, it is clear that there are some common
properties. For example, all animals have a name, a weight, and age.
However, there are also some differences. For example, a lion has a mane, and can
roar, while a shark can swim, but makes no sound.

Design a system which represents all parts of the problem and can flexibly
add new animals and enclosures.

### 2. Identity Access Management - IAM

For web services and various other services, it is crucial to get access control
correctly implemented. As an example, consider logging onto Forum.  
In this case, there are students and professors, each
of whom is part of multiple courses. In each course, one might have different
roles, for example, a professor might be a teacher in one class while taking another
class as a student. Professors are able to do more things on the platform than
students, for example, send the class to breakout. There might be other actions as
well, for example, some students might be privileged with the option of enabling
or disabling student drawing on slides. When things break (as they sometimes
do), then it will be really useful to have people with tech support privileges
come into any class and perform any action.

Design a system which represents all parts of the problem and can flexibly
assign students and professors to new classes. The system must also be able
to efficiently determine whether a person is able to perform a particular
action, such as sending the class to a breakout.

## Submission:

- Please commit both python solutions to your PCW repo.
- Test that they work by running them from the command line.
- Identify all examples of inheritance and composition in your code.

(Again, you can freely use AI tooling to help you write the argument, as long as you are able to explain and defend it in class.)
