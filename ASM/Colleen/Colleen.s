; Colleen in asm
global main
extern printf
SECTION .rodata
format: DB "SECTION .data%cformat: DB %c%s%c, 0%cSECTION .text%cmain:%c%c%c" , 0
SECTION .text
main:
push rbp
call print
pop rbp
xor rax, rax
ret
print:
push rbp
mov rbp, rsp
mov rdi, format
mov rsi, 10
mov rdx, 34
mov rcx, format
mov r8, 34
mov r9, 10
; push the left on the stack, on reverse order!
push 51
push 10
xor al, al
call printf
leave
ret
