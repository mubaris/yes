#include <iostream>
#include <vector>

int main(int argc, char* argv[]) {
    std::string output;
    std::vector<std::string> args(argv+1, argv + argc);

    if (argc <= 1)
        output = "y";
    else
        for (const auto& str : args) output += str + " ";

    while (1)
        std::cout << output << "\n";
}
