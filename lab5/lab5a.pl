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



% test cases

% Check if Tom is male:
 ?- male(tom).
 % Expected Result: true.
% List all children of Mary:
 ?- parent(mary, Child).
 % Expected Results: Child = ann; Child = fred.
 %Find all siblings of Ann:
 ?- sibling(ann, Sibling).
 % Expected Result: Sibling = fred.
% Determine if Fred has any grandparents:
 ?- grandparent(GP, fred).
 % Expected Result: GP = john.
% List all children of John who are female:
 ?- parent(john, Child), female(Child).
 % Expected Result: Child = mary.
% Find all ancestors of Fred:
 ?- ancestor(Anc, fred).
 % Expected Results: Anc = mary; Anc = john.
% List all grandchildren of John who are female:
 ?- grandparent(john, GC), female(GC).
 % Expected Results: GC = ann; GC = liz.
