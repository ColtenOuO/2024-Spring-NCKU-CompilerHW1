
# 2024-Spring-NCKU-CompilerHW1

112-2 國立成功大學編譯系統作業 1 初始檔案

## Environmental Setup

For linux

- Install Dependencies

```shell
sudo apt install build-essential flex bison git
```

## Build Your Scanner

```shell
make build
```

## Build And Run Your Scanner

```shell
make all < ../input/subtask00-helloworld/testcase01.cpp
```

## Judge Your Scanner

```shell
./judge.sh
```

## Token Table

| Symbol            | Token         |
| ----------------- | ------------- |
| `>>`              | SHR           |
| `<<`              | SHL           |
| `&`               | BAN           |
| `\|`              | BOR           |
| `~`               | BNT           |
| `^`               | BXO           |
| `+`               | ADD           |
| `-`               | SUB           |
| `*`               | MUL           |
| `/`               | DIV           |
| `%`               | MOD           |
| `!`               | NOT           |
| `>`               | LES           |
| `<`               | GTR           |
| `>=`              | GEQ           |
| `<=`              | LEQ           |
| `==`              | EQL           |
| `!=`              | NEQ           |
| `&&`              | LAN           |
| `\|\|`            | LOR           |
| `=`               | VAL_ASSIGN    |
| `+=`              | ADD_ASSIGN    |
| `-=`              | SUB_ASSIGN    |
| `*=`              | MUL_ASSIGN    |
| `/=`              | DIV_ASSIGN    |
| `%=`              | REM_ASSIGN    |
| `>>=`             | SHR_ASSIGN    |
| `<<=`             | SHL_ASSIGN    |
| `&=`              | BAN_ASSIGN    |
| `\|=`             | BOR_ASSIGN    |
| `~=`              | BNT_ASSIGN    |
| `^=`              | BXO_ASSIGN    |
| `++`              | INC_ASSIGN    |
| `--`              | DEC_ASSIGN    |
| `(`               | '('           |
| `)`               | ')'           |
| `[`               | '['           |
| `]`               | ']'           |
| `{`               | '{'           |
| `}`               | '}'           |
| `:`               | ':'           |
| `;`               | ';'           |
| `,`               | ','           |
| `cout`            | COUT          |
| `auto`            | AUTO_T        |
| `void`            | VOID_T        |
| `char`            | CHAR_T        |
| `int`             | INT_T         |
| `long`            | LONG_T        |
| `float`           | FLOAT_T       |
| `double`          | DOUBLE_T      |
| `bool`            | BOOL_T        |
| `string`          | STR_T         |
| `if`              | IF            |
| `else`            | ELSE          |
| `for`             | FOR           |
| `while`           | WHILE         |
| `return`          | RETURN        |
| `break`           | BREAK         |
| `true`            | BOOL_LIT      |
| `false`           | BOOL_LIT      |
| {Integer number}  | INT_LIT       |
| {Float number}    | FLOAT_LIT     |
| {Identifier}      | IDENT         |
| {multiline comment}   | MULTI_COMMENT |
| {singleline comment}  | COMMENT       |
| {string}          | STRING_LIT    |
| {character}       | CHAR_LIT      |

## Example of Your Scanner Output

- Input

```cpp
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
int main(string argv[]) {
    cout << "Hello World!";
}
```

- Output

```text
COMMENT          // comment
MULTI_COMMENT    /*
multi comment
    Tab \t
    Space
* star *
*/
MULTI_COMMENT    /**
 * Cool multi comment
 */
MULTI_COMMENT    /*Flowing multi comment*/
COMMENT          //Flowing comment
INT_T
IDENT            main
'('
STR_T
IDENT            argv
'['
']'
')'
'{'
COUT
SHL
STRING_LIT       "Hello World!"
';'
'}'

Total line: 13
```
