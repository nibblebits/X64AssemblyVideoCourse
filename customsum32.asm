[BITS 32]
global sum

section .text

; int sum(int x, int y);
sum:
    push ebp    ; 4 bytes
    mov ebp, esp
    mov eax, [ebp+8]  ; x 
    mov edx, [ebp+12] ; y
    add eax, edx 

    ; eax = result. And return value.
    pop ebp
    ret

