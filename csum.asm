[BITS 64]
global sum
; int sum(int x:rdi, int y:rsi);
sum:
    mov rax, rdi
    add rax, rsi
    ; All C programs expect the return value
    ; to be in the RAX register.
    ret
