
right_angle_triangle_console :-
    write('Enter the height of the right-angled triangle: '),
    read(H),
    (   integer(H), H > 0 ->
        nl,
        print_triangle(H, 1)
    ;   write('Invalid input for height. Please input a valid integer that is positive.'), nl
    ).


print_triangle(H, C) :-
    C =< H,
    print_row(C),
    nl,
    Next is C + 1,
    print_triangle(H, Next).


print_row(X) :-
    X > 0,
    write('#'),
    X1 is X - 1,
    print_row(X1).
print_row(0).



