parent(john, mary).
parent(john, tom).
parent(mary, ann).
parent(mary, fred).
parent(tom, liz).

male(john).
male(tom).
male(fred).
female(mary).
female(ann).
female(liz).



sibling(X,Y):-
    parent(Z, X),
    parent(Z, Y).

grandparent(X,Y):-
    parent(Z,Y),
    parent(X,Z).

ancestor(X,Y):-
    parent(X,Y),
    (parent(X,Z), ancestor(Z,Y)).

