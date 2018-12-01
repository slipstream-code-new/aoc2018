# AdventOfCode2018

Solutions for the [Advent of Code 2018](https://adventofcode.com/2018) puzzles.

Commits are mainly one-per-puzzle (i.e. two per day), although I may do some
"extra credit" commits after finding the correct answers, because I am using
these puzzles to finally gain some in-depth familiarity with Elixir.


## Development Journal

### Day 1

I'm muddling through the puzzles on my own until I can get the correct answer,
but after submitting, I am looking at some other folks' Elixir-based solutions.
It really underscores how much more efficient one can be in a language once one
has a good grasp of what is available in the standard library!

I *think* I made decent use of pattern matching and list-comprehension to
implement my solution. The main things that made my solution much less elegant
than it could have been were:

* I didn't realize that `String.to_integer` would correctly parse strings with
  the + prefix. This seems obvious now that I saw it elsewhere.

* I didn't know you about `Stream.cycle` and the fact that I could have used it
  with a List. I also didn't understand how I could have used
  `Enum.reduce_while` to continually iterate over the operations via
  `Stream.cycle` until the repeat is found. That's really cool.

Other things I learned:

* how to use "escript" to build a self-contained command line script in order to
  run my solution code over the input file. That will be something that probably
  comes in handy in the future.

* Even though I didn't need the guaranteed uniqueness of a MapSet structure to
  hold the previously-seen result and detect duplication (since the program
  would return the first duplication it detected, a plain List would never have
  duplication anyway) it still has an advantage in terms of the speed of finding
  an existing element in the collection, because it's implementation makes it a
  `O(log n)` operation (a list would be `O(n)`).

* This one makes me feel pretty dumb: remember to check your commit contents
  thoroughly. Apparently I had added the entire lib dir for the app modules into
  .gitignore while trying to just ignore the escript binary. So much for
  tracking the changes to Day 1. :-/
