; Simple ASM example

; ********************************************************************
section     .data

; -----
; Define constants
; equ means constant!

EXIT_SUCESS     equ     0       ; successful operation
SYS_exit        equ     60      ; call code for termination

; -----
; Byte / 8b variable decl

bVar1           db      17
bVar2           db      9
bResult         db      0

; -----
; Word / 16b variable decl

wVar1           dw      17000
wVar2           dw      9000
wResult         dw         0

; -----
; Double-word / 32b var decl

dVar1           dd      17000000
dVar2           dd      9000000
dResult         dd      0

; -----
; quadword / 64b variable decl

qVar1           dq      170000000
qVar2           dq      90000000
qResult         dq      0

; **********************************************************************************
; Code Section

section     .text
global _start
_start:

; Performs series of basic addition ops to demonstrate format of program

; -----
; Byte Example
; bResult = bVar1 + bVar2

    mov     al, byte [bVar1]        ; Move 
    add     al, byte [bVar2]
    mov     byte [bResult], al      ; The lower byte of RAX

; -----
; Word example
; wResult = wVar1 + wVar2

    mov     ax, word [wVar1]
    add     ax, word [wVar2]
    mov     word [wResult], ax      ; The lower word of RAX

; -----
; DW example

    mov     eax, dword [dVar1]
    add     eax, dword [dVar2]
    mov     dword [dResult], eax    ; The lower DOUBLe word of RAX (i.e. lower half, 32 bits)

; -----
; Quadword example

    mov     rax, qword [qVar1]
    add     rax, qword [qVar2]
    mov     qword [qResult], rax

; **************************************************************
; Done; terminate the program.

last:
    mov     rax, SYS_exit           ; Call code for exit
    mov     rdi, EXIT_SUCESS        ; Exit program with success
    syscall
