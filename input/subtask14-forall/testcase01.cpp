int mod(int num,int mod) {
    if( num < 0 ) return ( num + ( num * -1 / mod + 1 ) * mod ); // cool!
    return num % mod;
}
void nothing_function(string s){
    cout << s<< endl;
    cout << mod(10000000007,99824353) << endl; // very big number!
    cout << mod(-10,2) << endl;
    return;
}
int main(string argv[]) {
    nothing_function("Hello world");
    // comment
/*
multi comment
    Tab \t
    Space
* star *
*/
/**
 * Cool multi comment
 *//*Flowing multi comment*///Flowing comment
    int apple = 99824353;
    nothing_function("apple!");

    if( mod(apple,2) % 2 == 1 ) {
        if( apple == 998244353 ) {
            for(int i=0;i<10;i+=1) { /* for loop */
                int q = 10;
                while( q != 0 ) /* while loop */
                {
                    q -= 1;
                    cout << "OK!" << endl;
                }
            }
            for(int i=0;i<20;i+=2) {
                int q = mod(apple,2);
                while( q > 0 ) {
                    q -= 1;
                    cout << "OK!" << endl;
                }
            }
        }
        else {
            nothing_function("something wrong");
        }
    }

    cout << mod(apple,2) << endl;
}

// comment
/*
multi comment
    Tab \t
    Space
* star *
*/
/**
 * Cool multi comment
 *//*Flowing multi comment*///Flowing comment