#!/usr/bin/env escript

main([]) -> loop("y");
main(Args) -> loop(string:join(Args, " ")).

loop(Yes) -> io:format("~ts~n", [Yes]), loop(Yes).
