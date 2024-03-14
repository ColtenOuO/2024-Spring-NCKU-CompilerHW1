int main(string argv[]) {
    int a = 0,b = 0,c = 10;
    if( a == 0 && b == 0 ) {
        cout << a << b << c << endl;
    }

    if( c - b >= 0 ) {
        cout << "OK!" << endl;
    }

    if( ( a == 0 && b != 0 ) || c == 10 ) {
        cout << "test1" << endl;
    }
    else {
        if( ( c == 10 || a != 0 ) && ( ( a == 0 && b == 0 && c == 0 && ( c == 10 || (a) == 0 ) ) ) ) {
            cout << "test2" << endl;
        }
        else {
            cout << "test3" << endl;
            if(true) {
                cout << "test4" << endl;
            }
        }
    }

    if(true){
        cout << "test6" << endl;
    }

    return 0;
}