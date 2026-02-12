global main
extern fopen
extern fprintf
extern sprintf
extern printf
extern system

SECTION .data
X: DD 5
fna: DB __?FILE?__
source: DB "global main%1$cextern fopen%1$cextern fprintf%1$cextern sprintf%1$cextern system%1$c%1$cSECTION .data%1$cX: DD %3$d%1$c", 0

space: DB 10,"        ", 0
format: DB "cmd1 is %s", 10, 0
formatx: DB "X is %d", 10, 0

perm: DB "w", 0
cmd: times 100 db 0
cmd.base1: DB "Sully_%d.c", 0
cmd.base2: DB "cc -o Sully_%1$d Sully_%1$d.c; ./Sully_%1$d;", 0
cmd.base3: DB "cc -o Sully_%1$d Sully_%1$d.c;", 0

SECTION .text
main:
        mov al, 46
        cmp [(fna+5)], al
        je mkcmd.1
        dec DWORD [X]
        
mkcmd.1:
        push rbp
        mov rdi, formatx
        mov rsi, [X]
        call printf
        pop rbp

        push rbp
        mov rdi, cmd
        mov rsi, cmd.base1
        mov rdx, [X]
        call sprintf
        pop rbp

        push rbp
        mov rdi, format
        mov rsi, cmd
        call printf
        pop rbp

        push rbp
        mov rdi, cmd
        mov rsi, perm
        call fopen
        pop rbp

 ;       push rbp
 ;       mov rdi, rax
 ;       mov rsi, format
 ;       mov rdx, 10
 ;       mov rcx, 34
 ;       mov r8, 5
 ;       mov r9, format
 ;       call fprintf
 ;       pop rbp
 ;       
 ;       xor rax, rax
 ;       ret

