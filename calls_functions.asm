; printf("%d", 50);

BITS 64
default rel 

extern printf
global main

section .data
fmt db "%ld", 10, 0 

section .text

_sum:
   ; EXECUTES HERE
   add rdi, rsi 
   mov rax, rdi 
   ret
main:
   mov rdi, 50
   mov rsi, 20
   call _sum
   ; print the result
   mov rdi, fmt 
   mov rsi, rax 
   xor eax, eax 
   call printf 

   xor eax, eax
   ret
   