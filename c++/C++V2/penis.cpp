#include <fstream>
#include <iostream>
#include <regex>

int main (int argc, char **argv) {
    std::ifstream in (*(argv + 1));
    std::regex rep ("\\w+");
    std::string line;
    while (getline (in, line)) {
        std::cout << std::regex_replace (line, rep, "penis") << std::endl;
    }
    in.close ();
    return 0;
}
