#include <stdio.h>

extern void sum(int a, int b, int* result);
int main()
{
    int a = 50;
    int b = 60;
    int result = 0;

    sum(a, b, &result);  
    
    printf("a+b=%i\n", result);
}