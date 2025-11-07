#include <stdio.h>
extern int sum(int x, int y);
int main()
{
    int x = 50;
    int y = 70;
    int result = sum(x, y);
    printf("x+y=%i", result);
    return 0;
}