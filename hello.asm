BITS 64
default rel

section .data
msg: db "Hello world", 0x0A ; message + newline

section .text
global _start

_start:
    ; write(1, msg, len)
    mov rax, 1       ; sys_write
    mov rdi, 1       ; file descriptor 1 = stdout
    lea rsi, [rel msg]  ; Pointer to message
    mov rdx, 12         ; 12 bytes to write to stdout
    syscall

    ; exit(0)
    mov rax, 60     ; sys_exit
    xor rdi, rdi    ; status 0
    syscall