#include <iostream>

using namespace std;

int main(int argc, char* argv[]) {
    if (argc == 1) {
        while (1) {
            cout << "y" << endl;
        }
    } else {
        while (1) {
            for (int i = 1; i < argc; i++) {
                cout << argv[i] << " ";
            }
            cout << endl;
        }
    }
}
