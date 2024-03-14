int main(string argv[]) {
    int a[3][3];
    for(int i=0;i<3;i++)
    {
        for(int j=0;j<3;j++)
        {
            a[i][j] = ( i + j + 998244353 ) % 82781;
        }
    }

    for(int i=2;i>=0;i--)
    {
        for(int j=0;j<3;j++)
        {
            cout << a[i][j] << endl;
        }
    }

    return 0;
}