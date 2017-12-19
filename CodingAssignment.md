# IF.05.22 Theoretical Informatics 2017

## Objective
The goal of this assignment is to train recursion and lists in PROLOG.

## Materials
- gProlog
- An editor

## Required Tasks
1. Implement a clause `prepend/3` which adds an element `E` in front of a list `L`.
2. Implement a clause `addElement/3` which adds an element `E` at the end of a list `L`.
2. Implement a clause `hasLength/2` which calculates the length of a list.
3. Implement a clause `remove/3` which removes an element `E` from a list `L`.

## Hints
- `addElement/3` works very similar to `concatenate/3` as given in the tutorial [RecursionAndLists](RecursionAndLists.md).
- One can think about `remove/3` as we thought about `isMember` in the [tutorial](RecursionAndLists.md):
   - If `E` is the head of `L` then the result is the tail of `L`.
   - If `E` is in the tail of `L` we must remove `E` from the tail of `L`.
- Another way to think about `remove/3` would be to consider it as the reversion of `addElement/3` (`ReducedTail` instead of `ExtendedTail`).


## Things to Learn
- PROLOG Lists
- Recursion

## Evaluation
Do all the required tasks and make a pull request. If you make a pull request, you might have to chance to present your solution in our next training unit.
