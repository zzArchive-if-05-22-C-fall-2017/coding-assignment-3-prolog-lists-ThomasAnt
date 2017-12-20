prepend(L,X,[X|L]).

addElement([],X,[X]).
addElement([H|T],X,[H|ExtendedTale]):-addElement(T,X,ExtendedTale).

hasLength([],0).
hasLength([H|T],L + 1):-hasLength(T,L).

remove([X|T],X,T).
remove([H|T],X,[H|ReducedTale]):-remove(T,X,ReducedTale).