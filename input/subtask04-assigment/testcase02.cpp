int main(string argv[]) {
    int a,b,c,d,e;
    a = 12;
    b = a;
    c = a;
    d = b;
    e = b;

    a += a;
    b += b;
    c /= c;

    cout << a << " " << b << " " << c << " " << d << " " << e << endl;
    e = 100;
    e <<= 2;
    cout << e << endl;
    e >>= 4;
    cout << e << endl;
}