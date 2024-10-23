solve_puzzle(Houses, GreenIndex) :-
 % Hint: Use the built-in Prolog Predicate to define all the possible combinations of the houses.
 Houses = [_,_,_,_],
 permutation(Houses, [red, blue, green, yellow]),

 % Clue 1: The red house is immediately to the left of the blue house
 next_to(red, blue, Houses),


 % Clue 2: The treasure is in the green house
 nth1(GreenIndex, Houses, green),


 % Clue 3: The yellow house is not next to the green house
 not_next_to(yello, green, Houses),


 % Clue 4: The green house is not in the second position from the left
 GreenIndex \= 2.


next_to(X, Y, [X,Y|_]).
next_to(X,Y, [Y,X| _]).
next_to(X, Y, [_|T]) :-
 next_to(X, Y, T).

not_next_to(X, Y, List) :-
 \+ next_to(X,Y, List).
