#include <iostream>
#include <cstdlib>

int main() {
    string username;
    char choice;

    cout << "Welcome to Python Dependency Downloader for Python 3.11" << endl;

    do {
        cout << "Checking Python 3.11" << endl;

        if (system("dir \"C:\\Users\\%username%\\AppData\\Local\\Microsoft\\WindowsApps\\python3.11.exe\" > nul 2>&1") == 0 ||
            system("dir \"C:\\Users\\%username%\\AppData\\Local\\Programs\\Python\\Python311\" > nul 2>&1") == 0) {
            cout << "Python 3.11 is installed." << endl;
        }
        else {
            cout << "Python 3.11 isn't detected." << endl;
            cout << "1) Microsoft Version." << endl;
            cout << "2) Python Website version." << endl;
            cout << "Choose your number: ";
            cin >> choice;

            switch (choice) {
            case '1':
                system("start \"\" https://apps.microsoft.com/detail/9NRWMJP3717K?hl=en-US&gl=US");
                break;
            case '2':
                system("start \"\" https://www.python.org/downloads/release/python-3110/");
                break;
            default:
                cout << "Invalid choice. Please try again." << endl;
            }

            cout << "When you are done installing, press any key to check again!" << endl;
            system("pause > nul");
        }

        cout << "1) Install" << endl;
        cout << "2) Uninstall" << endl;
        cout << "3) Exit" << endl;
        cout << "Choose your number: ";
        cin >> choice;

        string dependency;

        switch (choice) {
        case '1':
            cout << "Enter the dependency name: ";
            cin >> dependency;
            system(("pip install " + dependency).c_str());
            break;
        case '2':
            cout << "Enter the dependency name: ";
            cin >> dependency;
            system(("pip uninstall " + dependency).c_str());
            break;
        case '3':
            cout << "Exiting script. Goodbye!" << endl;
            exit(0);
        default:
            cout << "Invalid choice. Please try again." << endl;
        }
    } while (true);

    return 0;
}
