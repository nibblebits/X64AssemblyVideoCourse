#include <stdio.h>
extern void sum_asm();

int sum(int a, int b, int c)
{
    printf("a=%i, b=%i, c=%i\n", a, b, c);
    return a + b + c;
}

int main()
{
    sum_asm();
    return 0;
}