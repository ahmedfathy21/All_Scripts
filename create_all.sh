#!/bin/bash
#set -x
arr=("C" "Python" "Bash" "C++" "JAVA")
    choice=$(printf "%s\n" "${arr[@]}" | rofi -dmenu -p "Choose a language")
    case $choice in
        "C")

        value_c=$(rofi -dmenu -p "Enter the name of the C file")
            echo '#include <stdio.h>

    int main() {
        printf("Hello, World!\n");
        return 0;
    }' > ${value_c}.c
    code ./${value_c}.c
            ;;
        "Python")
        value_py=$(rofi -dmenu -p "Enter the name of the py file")
            echo 'print("Hello, World!")' > ${value_py}.py
             code ./${value_py}.py
            ;;
        "Bash")
                 value_sh=$(rofi -dmenu -p "Enter the name of the sh file")
            echo '#!/bin/bash
    echo "Hello, World!"' > ${value_sh}.sh
     code ./${value_sh}.sh
            ;;
        "C++")
                 value_cpp=$(rofi -dmenu -p "Enter the name of the cpp file")
            echo '#include <iostream>   
    using namespace std;
    int main() {
        cout << "Hello, World!" << endl;
        return 0;
    }' > ${value_cpp}.cpp
    code ./${value_cpp}.cpp
            ;;
        "JAVA")
                 value_java=$(rofi -dmenu -p "Enter the name of the java file")
            echo 'public class HelloWorld {
        public static void main(String[] args) {
            System.out.println("Hello, World!");
        }
    }' > ${value_java}.java
                 code ./${value_java}.java

            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
