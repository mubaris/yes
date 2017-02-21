import std.stdio : writeln;
import std.array : join;

void main(string[] args)
{
    immutable line = (args.length > 1) ? args[1..$].join(" ") : "y";

    while (true)
    {
        writeln(line);
    }
}
