; ---- ADDING ----
mov al, 0x7F ; +127 (max signed 8 bit value)
add al, 1    ; 0x80 -128, ; OF = 1 (signed overflow)
             ; SF = 1, ZF = 0, CF = 0
             ; 10000000b

mov rbx, 5
add rbx, 3
; RBX = 8

add qword[memory_label], rbx

memory_label: dq 10

; --- SUBTRACTION ---
mov rax, 0
sub rax, 1    ; CF=1(borrow), OF=1(signed overflow), rax=-1

mov rbx, 10
sub rbx, 3    ; rbx=7

; ---- Multiplication ---
; 64-BIT UNSIGNED MULTIPLICATION
mov rax, 5000
mov rbx, 10
mul rbx  ; rdx:rax=rax*rbx=50000

;64-bit unsigned multiplication
; where we dont fit

mov rax, 0xFFFFFFFFFFFFFFFF
mov rbx, 2 
mul rbx       ; result= 0x1FFFFFFFFFFFFFFFE
; RDX=0x01, RAX=FFFFFFFFFFFFFFFE

; lower register multiplication
mov al, 25
mov bl, 10
mul bl          ; AX=250, CF=0 OF=0, AH=0
; AX(AH(8 bits) << 8 | AL(8 bits)) - 16 bits wide

; --- overflow the lower half ---
mov al, 200
mov bl, 200
mul bl  ; AX=40000, CF=1, OF=1

; --- signed multiplication example ---
mov al, -5      ; 0xFB (251 d)
mov bl, 10      ; 0x0A
imul bl         ; AX = -50 -> 0xFFCE (65,486)

; --- signed multiplication example with overflow ---
mov al, 100 ; 0x64
mov bl, 100 ; 0x64
imul bl   ; AX(AH|AL) = (AL * BL = 10000 -> 0x2710)
; CF=1, OF=1

; Two operand multiplication
mov rdx, 4
imul rdx, rsi  ; rdx= rdx*rsi

; --- unsigned devision example ---
mov ax, 250    ; dividend in AX
mov bl, 10     ; divisor
div bl         ; AL=25, AH=0 

; -- remainder example --
mov ax, 250
mov bl, 32
div bl   ; 250 / 32 = 7.8125 (floored) = 7
         ; AL=(250 / 32 = 7),(AH=250 % 32 = 26)
 
; --- signed divison example ---
mov rax, 1000000000
xor rdx, rdx 
mov rbx, 3
div rbx    ; RAX=(1000000000 / 3) = 3333333333, RDX=(1000000000 % 3) = 1

; --- signed divison ---
mov ax, -100
mov bl, 7
idiv bl ; AL=-14 (0xF2), AH=-2 (0xFE)
