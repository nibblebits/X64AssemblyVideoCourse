; WHAT ARE REGISTERS

; registers are places we can store numbers

; AL (8-bit) AH(8-bits)
; AX(16-bit) (AH | AL >> 8) 
mov ax, 0xfff4
; AL = F4
; AH = FF
mov ah, 0xf3
; AX = F3F4

; EAX = 32 bits
; E(upper 16 bits) | AX (lower 16 bits)
mov eax, 0xf4f4ffff
; AX = ffff
; E = f4f4 (Remember you cant access E seperate)

; RAX (64 bit register)
; R | EAX
; R (upper 32 bits) EAX (lower 32 bits)

mov rax, 0xf4f4f4f4ffffffff
; EAX = ffffffff
; R = f4f4f4f4 (R cannot be accessed alone)


; AX, CX, DX, BX
; CX (CH | CL) ; 16 bits ECX(32 BITS)  RCX(64 BITS)
; AX (AH | AL) ; 16 bits EAX(32 BITS)  RAX( 64 BITS )
; DX (DH | DL) ; 16 bits EDX( 32 BITS ) RDX ( 64 BITS)
; BX (BH | BL) ; 16 bits EBX (32 BITS) RBX( 64 BITS)

; GENERAL PURPOSE REGISTERS
; RAX EAX AX AH AL = Mathematical operations, i.e division, mul
; RCX ECX CX CH CL = Counting (loops)
; RDX EDX DX DH DL = Data I/O in and out ins
; RBX EBX BX BH BL = Expects a calling convention where we push and pop the register


; Stack pointer
; RSP(64 bit), ESP(32 bit), AND SP(16 bit)
; Points to anywhere in memory
; push instruction called decrements by one word
; pop instruction called increments by one word

; RBP (64 bit), EBP(32 bit), and BP(16 bit)
; Points to an old stack pointer.
; Can also relatively address on the stack


; RDI (64 BIT) EDI(32 BIT) (DI 16 BIT)
; Used for string or data copying instructions
; for output

; RSI (64 bit) ESI (32 bit) (SI 16 bits)
; Used for string or data copying instructions
; for input.