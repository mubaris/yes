#include <string>
#include <vector>
#include <cstdio>

///////////////////////////////////
// How to build and execute
//
// Build:
// g++ -o yes --std=c++11 yes.cpp
//
// option 1 - output 'yes'
// ./yes
//
// option 2 - output argument list
// ./yes argument_list

int main(int argc, char* argv[]) {
    std::string output;
    std::vector<std::string> args(argv+1, argv + argc);

    if (argc <= 1)
        output = "y";
    else
        for (const auto& str : args) output += str + " ";

    //while(1) - sometimes it checks if 1==1
    for(;;)
        //std::cout << output << "\n";
        printf("%s\n",output.c_str()); //printf is faster
}
