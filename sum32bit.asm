[BITS 32]
extern sum
global sum_asm
sum_asm:
    push ebp
    push dword 60 ; C
    push dword 40 ; B 
    push dword 20 ; A
    call sum
    add esp, 12   ; 3 * 4(word-size)

    pop ebp
    ret

