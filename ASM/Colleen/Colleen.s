; Colleen in asm
        global main
        extern printf

SECTION .rodata
space: DB "        ", 0
format: DB "; Colleen in asm%1$c%2$sglobal main%1$c%2$sextern printf%1$c%1$cSECTION .rodata%1$cspace: DB %3$c%2$s%3$c, 0%1$cformat: DB %3$c%4$s%3$c, 0%1$c%1$cSECTION .text%1$cmain:%1$c%2$spush rbp%1$c%2$scall print%1$c%2$spop rbp%1$c%2$sret%1$c%1$cprint:%1$c%2$spush rbp%1$c%2$smov rbp, rsp%1$c%2$smov rdi, format%1$c%2$smov rsi, 10%1$c%2$smov rdx, space%1$c%2$smov rcx, 34%1$c%2$smov r8, format%1c%2$s; call printf%1$c%2$scall printf%1$c%2$sleave%1$c%2$sxor rax, rax%1$c%2$sret%1$c", 0

SECTION .text
main:
        push rbp
        call print
        pop rbp
        ret

print:
        push rbp
        mov rbp, rsp
        mov rdi, format
        mov rsi, 10
        mov rdx, space
        mov rcx, 34
        mov r8, format
        ; call printf
        call printf
        leave
        xor rax, rax
        ret
