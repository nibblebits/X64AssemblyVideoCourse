; XMM0 - XMM15 (16 registers, 128 bits each)
; XMM0 - XMM7 (8 registers for AMD64 ABI)

; You cant put floating point numbers in normal registers
; RDI, RSI...

default rel
global main
extern printf

section .rodata
    fmt_a:  db "Double a = %f", 10, 0
    fmt_sum: db "a + b = %f", 10, 0
    fmt_mix: db "From int %d to double %.2f", 10, 0
    fmt_c: db "Float c = %f", 10 ,0
    fmt_cmul: db "c * 3.5=%f", 10, 0

    a: dq 3.141592653589793  ; 64-bit double
    b: dq 2.718281824590045  ; 64-bit double
    c: dd 1.5   ; 32 bit float
    cst_3_5: dd 3.5  ; 32 bit float

section .text
main:
    push rbp
    mov rbp, rsp

    ; Print a double
    lea rdi, [fmt_a]
    movsd xmm0, [a]
    mov al, 1     ; 1 floating point number to print
    call printf

    ; Compute and print a+b (double)
    lea rdi, [fmt_sum]
    movsd xmm0, [a]
    addsd xmm0, [b]
    mov al, 1
    call printf

    ; Mix integers and doubles in one printf
    lea rdi, [fmt_mix]
    mov esi, 42       ; RSI = second arg, ESI = lower 32 bits
    cvtsi2sd xmm0, esi  ; Converts int to double
    mov al, 1
    call printf

    ; Print a float thats promoted to a double
    lea rdi, [fmt_c]
    movss xmm0, [c]  ; (floating point number 32-bits)
    cvtss2sd xmm0, xmm0 ; promptes float to double for printf
    mov al, 1
    call printf

    ; Multiply float by 3.5 and print
    lea rdi, [fmt_cmul]
    movss xmm0, [c]
    movss xmm1, [cst_3_5]
    mulss xmm0, xmm1    ; float multiply
    cvtss2sd xmm0, xmm0  ; promote to double for printf
    mov al, 1
    call printf

    xor eax, eax
    leave
    ret





