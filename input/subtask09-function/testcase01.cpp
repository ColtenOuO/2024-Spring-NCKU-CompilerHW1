bool check(int a,int b,string s,bool c) {
    cout << s << endl;
    cout << a << " " << b << " " << s << endl;
    return ( c == true );
}
int main(string argv[]) {
    bool result = check(1,2,"apple",true);
    int num = result + 7;
    cout << num << endl;

    return 0;
}