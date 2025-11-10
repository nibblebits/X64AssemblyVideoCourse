#include <stdio.h>
#include <string.h>

// 0x00[||||] - 0x04
// 0x00 char s;
// 0x01 int a;
// s | 3 bytes of a 
// then it has to read another 4 byes
// final byte of a + 3 bytes of whatever else came after it.
struct animal
{
    char name[10];
    // add two bytes
    // char padding[2];
    int total_legs;
};

extern void print_animal(struct animal animal);

int main()
{
    struct animal animal;
    strncpy(animal.name, "Bob", sizeof(animal.name));
    animal.total_legs = 4;
    
    print_animal(animal);
}