; Display* XOpenDisplay(const char* display_name)
; Connects to the X Server
; Returns a pointer to a display object
extern XOpenDisplay
; Window XDefaultRootWindow(Display* dpy)
; Returns the ID of the root window for the default screen of the display
extern XDefaultRootWindow
; Window XCreateSimpleWindow(Display* display, Window parent, int x, int y, int width, int height, int broder_width, unsignd long border_pixel, unsigned long background_pixel)
; Creates a top-level window that has a parent
; Returns the window id on success
extern XCreateSimpleWindow
; void XStoreName(Display* display, Window w, const char* name)
; Sets the window title 
extern XStoreName
; void XSelectInput(Display* display, Window w, long event_mask)
; Tells the X server what events we want for that window
; event_mask = bitmask of possible events e.g KeyPressMask
extern XSelectInput
; void XMapWindow(Display* display, Window window)
; Makes the window visible maps it on the screen then you will get
; expose events.
extern XMapWindow
; void XNextEvent(Display* display, XEvent* event_return)
; Blocks until the next event arrives then flls XEvent struct you provided
; The first 32 bits of XEvent is type.
extern XNextEvent
; void XDestroyWindow(Display* display, Window w)
; destroys the window and frees the server side resources
extern XDestroyWindow
; void XCloseDisplay(Display* display)
; Closes the ocnnection to the X Server and flushes pending requests
extern XCloseDisplay
extern exit

global main

%define KeyPressMask 1
%define ExposureMask 0x00008000
%define EVENT_KEYPRESS 2

section .data
title:   db "X64 assembly X11 Window", 0

section .bss
display_ptr:    resq 1 
window_id:      resq 1 
xevent_buf:     resq 198  ; XEvent 

section .text
main:
    push rbp
    mov rbp, rsp
    ; display = XOpenDisplay(NULL)
    xor rdi, rdi
    call XOpenDisplay
    test rax, rax 
    jz .fatal       ; if NULL, Fail
    mov [display_ptr], rax  ; <-- Display*

    ; root = XDefaultRootWindow(display)
    mov rdi, rax       ; display pointer
    call XDefaultRootWindow
    ; rax = root_window

    ; window = XCreateSimpleWindow(display, root, x=50,y=50, w=300, h=200, border_pixel=0, background_pixel=0)
    mov rdi, [display_ptr]  ; display
    mov rsi, rax            ; root window
    mov rdx, 50             ; x
    mov rcx, 50             ; y
    mov r8, 300             ; width
    mov r9, 200             ; height
    ; 7th, 8th, 9th arguments (right to left) 
    ; keep 16 byte alignment
    sub rsp, 32
    mov qword [rsp+16], 0    ; background pixel
    mov qword [rsp+8], 0     ; border_pixel
    mov qword [rsp], 1       ; border_width
    call XCreateSimpleWindow 
    add rsp, 32
    mov [window_id], rax

    ; XStoreName(dispaly, window, "X64 assembly X11 Window")
    mov rdi, [display_ptr]
    mov rsi, [window_id]
    mov rdx, title
    call XStoreName

    mov rdi, [display_ptr]
    mov rsi, [window_id]
    call XMapWindow

    ; XSelectInput(display, window, ExposureMask|KeyPressMask)
    mov rdi, [display_ptr]
    mov rsi, [window_id]
    mov rdx, (ExposureMask | KeyPressMask)
    call XSelectInput

.event_loop:
    ; XNextEvent (display, window)
    mov rdi, [display_ptr]
    lea rsi, [rel xevent_buf]
    call XNextEvent

    ; Check for a key press
    mov eax, dword [xevent_buf]
    cmp eax, EVENT_KEYPRESS
    jne .event_loop

    ; On a key press destory window and close display
    mov rdi, [display_ptr]
    mov rsi, [window_id]
    call XDestroyWindow

    ; return 0
    xor edi, edi
    call exit
    
.fatal:
    mov edi, 1
    call exit

