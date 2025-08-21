; Simple assembly program using stdlib
[BITS 64]
global main
extern printf
extern scanf

section .bss
    age resd 1

section .rodata
    prompt db "Enter your age: ", 0
    fmt_in db "%d", 0
    fmt_out db "In 10 years you will be: %d", 10, 0
    mr_old db "You're old", 10, 0

section .text

; int printf(const char* fmt, e)
; printf("hello world %i", 50);
main:
    sub rsp, 8 

    ; Print out: Enter your age
    lea rdi, [rel prompt]
    xor eax, eax
    call printf

    ; Read the age: scanf("%d", &age)
    lea rdi, [rel fmt_in]
    lea rsi, [rel age]
    call scanf
    ; age variable should now be set within scanf
    mov eax, [rel age]
    add eax, 10  ; Add 10 years
    ; age isnt updated, EAX register is

    ; printf("In 10 years you will be: %d\n", eax);
    lea rdi, [rel fmt_out]
    mov esi, eax
    xor eax, eax
    call printf

    mov eax, [rel age]
    cmp eax, 120 
    jb .your_not_old

    xor eax, eax
    lea rdi, [rel mr_old]
    call printf


.your_not_old:

    xor rax, rax
    add rsp, 8
    ret