[BITS 64]

global set_to_50

section .text
set_to_50:
    mov dword [rdi + rsi*4], 9
    ret
