#include <stdio.h>
struct animal
{
    char name[20];
    int total_legs;
    int age;
};

extern void asm_print_animal(struct animal a);

int main(void)
{
    struct animal a = {"Dog", 4, 18};
    asm_print_animal(a);
    return 0;
}