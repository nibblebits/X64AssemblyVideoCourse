#include <stdio.h>

extern void asm_change_val(int** ptr);
extern char asm_get_char(const char* str, int index);
int main()
{
    const char* hello = "hello world";
    char c = asm_get_char(hello, 1);
    printf("The character index 1= %c\n", c);
    return 0;
}