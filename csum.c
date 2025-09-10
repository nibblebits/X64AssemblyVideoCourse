#include <stdio.h>
#include <stdlib.h>

int sum(int x, int y);

int main(int argc, char** argv)
{
    int result = sum(50, 20);
    printf("Sum 50+20=%i", result);
    return 0;
}