# IF.05.22_LOAL

## Recursion and Lists in PROLOG

### Recursions
We will start with the knowledge base `genealogy` from the last coding assignment. What we basically need is the clause `parent/2`:
```
parent(adam, john).
parent(eve, john).
parent(eve, lisa).
parent(john, anne).
parent(john, pat).
parent(pat, jacob).
parent(carol, jacob).
```

Now we want to express the relation `ancestor/2` which says that `X` is an ancestor of `Z`if `X` is a parent, a grandparent, a grand-grandparent, etc. of `Z`.

Since we have no loops available in PROLOG, we have to find another way to express such a relation. So we think of the notion of *ancestor* in terms of *ancestor* itself in the following way:
`X` is an ancestor of `Z` if
- `X` is a parent of `Z` or
- there exists a `Y` which is a child of `X` and is an ancestor of `Z`

In PROLOG this looks like
```
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
```

### Lists
#### Basics
A list in PROLOG is started and ended by typing square brackets ([a, b, c]), very similar to lists in JavaScript. Contrary to JavaScript there is no access via indices available in PROLOG, which would not make very much sense consicering the absence of an iterator statement like `for` or `while`.

The recursive structure of PROLOG much more suggests to think of loops in terms of their first element and the rest of the list. In PROLOG terminology we talk about the *Head* and the *Tail* of a list.

Consider the list `X = [a, b, c, d, e, f]`, the Head of `X` is the element `a` and the tail of `X`is `[b, c, d, e, f]`. Try to figure out what the head and the rest of such a small list like `[a]` could be.

#### Heads and Tails in PROLOG
In PROLOG we can write heads and tails as follows: `[X | Y]`, where `X` is the head and `Y` is the tail of the list. The pipe symbol is the explicit separator between head and tail. To make it more clear, we define two predicates `head/2` and `tail/2`:
```
head([Head | Tail], Head).
tail([Head | Tail], Tail).
```
You will have recognized that both definitions give a warning about singleton variables. This is similar to the warning about unused variables in Java, C, etc. To get rid of this warning we can use *anonymous variables* which are denoted via an underscore. The warning-free definitions of the two clauses above would be then
```
head([Head | _], Head).
tail([_ | Tail], Tail).
```
With these two clauses one can check whether the considerations about head and tail of the list `[a]` in the last section were correct.

#### Some More Examples
Now we can apply our new knowledge about recursion and lists to create some new great clauses. Lets start with a check whether an element is **member of a list**. First we consider a trivial part of this problem.
- An element `Head` is element of a list if `Head` is the head of the list.

The recursive part is then
- An element `X` is not the head of the list then it must be a member of the tail.

In prolog this look like:
```
isMember(X, [X | _]).                        
isMember(X, [_ | Tail]) :- isMember(X, Tail).
```

A second example deals with the notion of **concatenation**. If we concatenate two lists, we create a new list holding the members of the first list followed by the members of the second list. We start again, guess what, with the trivial part.
- If we concatenate the empty list and an arbitrary list `L` we get `L`.

Now the recursive part:
- Concatenating a list `[H|T]` and a list `L` results in a list `[H|ExtendedTail]`, if the concatenation of `T` and `L` yields the list `ExtendedTail`.

In PROLOG this looks like
```
concatenate([], L, L).
concatenate([H|T], L, [H|ExtendedTail]) :- concatenate(T, L, ExtendedTail).

```

Experiment with the given knowledge base to get familiar with the whole system.
