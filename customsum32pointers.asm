[BITS 32]
global sum

section .text
; void sum(int a, int b, int* result);
sum:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]  ; a 
    mov edx, [ebp+12] ; b
    add eax, edx      ; add and store result in eax
    mov edx, [ebp+16] ; value of the result pointer
    mov dword [edx], eax  ; *result = EAX
    pop ebp
    ret
