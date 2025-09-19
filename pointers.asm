[BITS 64]
global asm_change_val
global asm_get_char

section .text
; first arg = RDI (int**)
; second arg = RSI
; ...
asm_change_val:
    mov rdi, [rdi]
    ; now just int*
    mov dword [rdi], 123   ; change **ptr = 123;
    ret

asm_get_char:
    ; RDI = string pointer const char*
    ; RSI = index
    ; RDI holds the address to the "Hello world"
    ; move the pointer to the correct index
    add rdi, rsi ; Heads up if you use an array of ints, multiply by 4
    xor rax, rax
    mov al, [rdi] ; go into the helloworld address pull out first index
    ret