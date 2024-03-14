int main(string argv[]) {
    int x = 3;
    float y = 3.14;
    int z1,z2;
    z1 = x + (int)(y);
    z2 = (float)x + y;
    cout << z1 << " " << z2 << endl;
    z1 = x + (int)(6.28);
    z2 = (float)(6) + y;
    cout << z1 << endl;
    cout << z2 << endl;
    
    
    return 0;
}