int main(string argv[]) {
    int counter = 0;

    while( counter < 100000 ) {
        counter += 1;
        if( counter == 99999 ) {
            break;
        }

        if( counter % 91 == 0 ) {
            cout << "Hello World " << counter % 91 << endl;
        }

        cout << 998244353 % counter << endl;
    }

    cout << counter << endl;
}