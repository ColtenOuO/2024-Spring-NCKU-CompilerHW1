int main(string argv[]) {
    int a,b,c,d,e;
    a = ~243 & 15;
    b = a >> 1;
    c = a;
    d = b | 9;
    e = b;

    a += a;
    b += b;
    c /= c;

    cout << a << " " << b << " " << c << " " << d << " " << e << endl;
    e = 100 ^ 255;
    e <<= 2;
    cout << e << endl;
    e >>= 4;
    cout << e << endl;
}