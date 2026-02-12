global main
extern fopen, fprintf, sprintf, system, printf

section .data
cmd: db "nasm -felf64 -o Sully_5.o Sully_5.s && cc -no-pie -o Sully_5 Sully_5.o; ./Sully_5;", 10

section .text
main:
        push rbp
        mov rdi, cmd
        call system
        push rbp
        ret
