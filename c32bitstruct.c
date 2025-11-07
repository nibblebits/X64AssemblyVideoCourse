#include <stdio.h>
#include <string.h>

struct animal
{
    char name[10];
    int total_legs;
} __attribute__((packed));

extern void print_animal(struct animal animal);

int main()
{
    struct animal animal;
    strncpy(animal.name, "Bob", sizeof(animal.name));
    animal.total_legs = 4;
    
    print_animal(animal);
}