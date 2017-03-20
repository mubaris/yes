#!/usr/bin/env swipl

:- initialization main.

main :- current_prolog_flag(argv, Argv),
        atomics_to_string(Argv, " ", Output),
        print(Output).

print("")     :- write('y'), nl, print("").
print(Output) :- write(Output), nl, print(Output).
