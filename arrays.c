#include <stdio.h>

// set the index in the array to 50
extern void set_to_50(int* arr, int index);
int main(void)
{
    int a[] = {1, 2, 3, 4, 5};
    set_to_50(a, 2);

    for (int i = 0; i < 5; i++)
    {
        printf("%d", a[i]);
    }
    printf("\n");
    return 0;
}