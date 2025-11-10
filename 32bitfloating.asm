; ST0-ST7

; ST0
; ST1
; ST2
; ...

global main
extern printf

section .rodata
    fmt_a:  db "a (float) = %f", 10, 0
    fmt_b:  db "b (double) = %f", 10, 0
    fmt_sum: db "a + b = %f", 10, 0

section .data
    a: dd 1.5 ; 32 bit float ( 4 bytes )
    b: dq 2.75  ; 64 bit float ( 8 bytes) 

section .text
main:
    push ebp
    mov ebp, esp

    ; print a (promote float to a double then print)
    fld dword [a]   ; ST0 = a
    sub esp, 8      ; ensure alignment for printf
    fstp qword [esp] ; pushes a 64 bit double argument
    push dword fmt_a 
    call printf
    add esp, 12  ; pop args (8 for double + 4 for fmt)

    ; print b which is already a double
    fld qword [b]  ; ST0 = b (double)
    sub esp, 8
    fstp qword [esp] ; store ST0 on the stack
    push dword fmt_b
    call printf
    add esp, 12

    ; print a + b 
    fld dword [a]   ; ST0 = a
    fadd qword [b]  ; ST0 = a + b
    sub esp, 8
    fstp qword [esp] ; result stored on stack
    push dword fmt_sum
    call printf
    add esp, 12

    xor eax, eax
    leave ; pop ebp
    ret