sum_odd_numbers([],0).

sum_odd_numbers(A,S):-
    sum_odd_numbers_help(A, S, 0).

sum_odd_numbers_help([],S,S).

sum_odd_numbers_help([A|As],S,Acc):-
    A mod 2 =:= 1,
    Acc1 is Acc + A,
    sum_odd_numbers_help(As,S,Acc1).

sum_odd_numbers_help([A|As], S, Acc):-
    A mod 2 =:= 0,
    sum_odd_numbers_help(As, S, Acc).