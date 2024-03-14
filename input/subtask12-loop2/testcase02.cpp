int main(string argv[]) {
    int a[10] = { 10, 21, 30, 41, 50 };
    
    for( auto i : a ) {
        cout << i << endl;

        if( i % 2 == 0 ) {
            cout << "Even" << endl;
        }
    }
}