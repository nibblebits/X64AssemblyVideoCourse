global asm_print_animal
extern printf

section .rodata
    fmt_name db "Name: %s", 10, 0
    fmt_legs db "Legs: %d", 10, 0
    fmt_age db "Age: %d", 10, 0

section .text
asm_print_animal:
    push rbp
    mov rbp, rsp
    ; backup the rbx value
    push rbx 

    lea rdi, [rbp+16]
    
    ; RDI = ADDRESS OF ANIMAL
    mov rbx, rdi 

    ; Print the name
    lea rdi, [rel fmt_name] ; 1st arg: format (printf)
    lea rsi, [rbx+0]        ; 2nd arg: &a->name
    xor eax, eax            ; no floating point vector args
    call printf

    ; Print the total legs (offset 20)
    lea rdi, [rel fmt_legs]  ; 1st arg: format 
    mov esi, dword [rbx+20]  ; 2nd arg (int) a->total_legs;
    xor eax, eax
    call printf

    ; print the age (offset 24)
    lea rdi, [rel fmt_age]     ; 1st arg: format
    mov esi, dword [rbx+24]    ; 2nd arg: (int) a->age;
    xor eax, eax
    call printf
    
    ; Restore the old rbx value and return
    pop rbx
    ; restore rbp
    pop rbp
    ret 