write_triangle_to_file([], _).
write_triangle_to_file([Line | Rest], Stream) :-
    write(Stream, Line),
    nl(Stream),
    write_triangle_to_file(Rest, Stream).

isosceles_triangle_pattern_file(Height, Filename) :-
    generate_triangle(Height, 1, Lines),
    open(Filename, write, Stream),
    write_triangle_to_file(Lines, Stream),
    close(Stream),
    format('Isosceles triangle pattern written to file: ~w~n', [Filename]).

generate_triangle(H, CurrRow, Ls) :-
    CurrRow =< H,
    generate_line(CurrRow, H, L),
    NextRow is CurrRow + 1,
    generate_triangle(H, NextRow, RestLines),
    Ls = [L | RestLines].
generate_triangle(_, CurrRow, []) :-
    CurrRow > 0.

generate_line(Row, Height, Line) :-
    Spaces is Height - Row,
    Stars is 2 * Row - 1,
    length(SpaceList, Spaces), maplist(=(' '), SpaceList),
    length(StarList, Stars), maplist(=('*'), StarList),
    append(SpaceList, StarList, LineList),
    atom_chars(Line, LineList).