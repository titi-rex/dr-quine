; Grace write herself into her kid

%define SOURCE "; Grace write herself into her kid%1$c%1$c%%define SOURCE %3$c%4$s%3$c, 0%1$c%1$c%%macro head 0%1$cglobal main%1$cextern fopen%1$cextern fprintf%1$c%1$cSECTION .rodata%1$cspace: DB 10, %3$c        %3$c, 0%1$cformat: DB SOURCE%1$ckid: DB %3$cGrace_kid.s%3$c, 0%1$cperm: DB %3$cw%3$c, 0%1$c%%endmacro%1$c%1$c%%macro code 0%1$cSECTION .text%1$cmain:%2$spush rbp%2$smov rdi, kid%2$smov rsi, perm%2$scall fopen%2$spop rbp%2$spush rbp%2$smov rdi, rax%2$smov rsi, format%2$smov rdx, 10%2$smov rcx, space%2$smov r8, 34%2$smov r9, format%2$scall fprintf%2$spop rbp%2$sxor rax, rax%2$sret%1$c%%endmacro%1$c%1$chead%1$ccode%1$c", 0

%macro head 0
global main
extern fopen
extern fprintf

SECTION .rodata
space: DB 10, "        ", 0
format: DB SOURCE
kid: DB "Grace_kid.s", 0
perm: DB "w", 0
%endmacro

%macro code 0
SECTION .text
main:
        push rbp
        mov rdi, kid
        mov rsi, perm
        call fopen
        pop rbp
        push rbp
        mov rdi, rax
        mov rsi, format
        mov rdx, 10
        mov rcx, space
        mov r8, 34
        mov r9, format
        call fprintf
        pop rbp
        xor rax, rax
        ret
%endmacro

head
code
