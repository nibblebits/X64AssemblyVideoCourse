[BITS 32]

global print_animal
extern printf

section .data
fmt: db 'Animal name: %s, total_legs=%i', 10, 0
section .text
print_animal:
    push ebp
    mov ebp, esp
    ; stack alignment for printf
    sub esp, 12 
    ; animal name: [ebp+8] (10 bytes long)
    ; padding +2 bytes.
    ; [ebp+8+2+10] - total legs
    push dword [ebp+20]  ; total legs
    lea eax, [ebp+8]
    push dword eax       ; address of animal name
    push dword fmt       ; address of fmt label
    ; 20 - 16 = 4 , 16 - 4 = 12
    call printf
    add esp, 24  
    pop ebp
    ret

