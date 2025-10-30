extern printf
extern scanf

section .data
prompt_op:  db "Enter operator (+ - * /): ", 0
prompt_a:   db "Enter first number: ", 0
prompt_b:   db "Enter second number: ", 0
fmt_char:   db " %c", 0
fmt_int:    db "%ld", 0
fmt_result: db "Result: %ld", 10, 0
fmt_div0:   db "Error: division by zero!", 10, 0
fmt_inv:    db "Error invalid operator!", 10, 0

section .bss
op: resb 1
a: resq 1
b: resq 1
res: resq 1

section .text
global main

main:
    push rbp
    mov rbp, rsp 

    ; ask for the operator
    lea rdi, [rel prompt_op]
    xor rax, rax
    call printf

    ; read the operator
    lea rdi, [rel fmt_char]
    lea rsi, [rel op]
    xor rax, rax
    call scanf

    ; ask for left operand first number
    lea rdi, [rel prompt_a]
    xor rax, rax
    call printf

    lea rdi, [rel fmt_int]
    lea rsi, [rel a]
    xor rax, rax
    call scanf

    ; ask for the second number
    lea rdi, [rel prompt_b]
    xor rax, rax
    call printf

    lea rdi, [rel fmt_int]
    lea rsi, [rel b]
    xor rax, rax
    call scanf

    ; Load operands
    mov rax, [a]    ; Left operand
    mov rbx, [b]    ; Right operand
    mov cl, [op]    ; Op = cl

    ; choose operating
    cmp cl, '+'
    je .add
    cmp cl, '-'
    je .sub
    cmp cl, '*'
    je .mul
    cmp cl, '/'
    je .div

    lea rdi, [rel fmt_inv]
    xor rax, rax
    call printf
    jmp .done

.add:
    add rax, rbx
    jmp .print
.sub:
    sub rax, rbx
    jmp .print
.mul:
    imul rax, rbx
    jmp .print
.div:
    cmp rbx, 0
    je .div0
    cqo ; RDX:RAX 
    idiv rbx
    jmp .print
.div0:
    lea rdi, [rel fmt_div0]
    xor rax, rax
    call printf
    jmp .done

.print:
    lea rdi, [rel fmt_result]
    mov rsi, rax
    xor rax, rax
    call printf
.done:
    xor rax, rax
    pop rbp
    ret