global main
extern fopen, fprintf, sprintf, system, printf

%macro mkcmd 1
  push rbp
  mov rdi, cmd
  mov rsi, %1
  mov rdx, [rel X]
  call sprintf
  pop rbp
%endmacro

SECTION .data
X: DD 5
fna: DB __?FILE?__
source: DB "global main%1$cextern fopen, fprintf, sprintf, system%1$c%1$c%%macro mkcmd 1%1$c  push rbp%1$c  mov rdi, cmd%1$c  mov rsi, %%1%1$c  mov rdx, [X]%1$c  call sprintf%1$c  pop rbp%1$c%%endmacro%1$c%1$cSECTION .data%1$cX: DD %3$d%1$cfna: DB __?FILE?__%1$csource: DB %2$c%4$s%2$c, 0%1$cperm: DB %2$cw%2$c, 0%1$ccmd: times 128 DB 0%1$ccmdbase.1: DB %2$cSully_%%d.s%2$c, 0%1$ccmdbase.2: DB %2$cnasm -f elf64 -o Sully_%%1$d.o Sully_%%1$d.s; cc -no-pie -o Sully_%%1$d Sully_%%1$d.o; rm Sully_%%1$d.o; ./Sully_%%1$d;%2$c, 0%1$ccmdbase.3: DB %2$cnasm -f elf64 -o Sully_%%1$d.o Sully_%%1$d.s; cc -no-pie -o Sully_%%1$d Sully_%%1$d.o; rm Sully_%%1$d.o;%2$c, 0%1$c%1$cSECTION .text%1$cmain:%1$c  mov al, 46%1$c  cmp [(fna+5)], al%1$c  je mkcmd.1%1$c  dec DWORD [X]%1$cmkcmd.1:%1$c  mkcmd cmdbase.1%1$c  mov rdi, cmd%1$c  mov rsi, perm%1$c  call fopen%1$c  push rbp%1$c  mov rdi, rax%1$c  mov rsi, source%1$c  mov rdx, 10%1$c  mov rcx, 34%1$c  mov r8, [X]%1$c  mov r9, source%1$c  call fprintf%1$c  pop rbp%1$c  cmp [X], 0%1$c  jl mkcmd.3%1$cmkcmd.2:%1$c  mkcmd cmdbase.2%1$c  jmp exe%1$cmkcmd.3:%1$c  mkcmd cmdbase.3%1$cexe:%1$c  push rbp%1$c  mov rdi, cmd%1$c  call system%1$c  pop rbp%1$c  xor rax, rax%1$c  ret%1$c", 0
perm: DB "w", 0
cmd: times 128 DB 0
cmdbase.1: DB "Sully_%d.s", 0
cmdbase.2: DB "nasm -felf64 -o Sully_%1$d.o Sully_%1$d.s && cc -no-pie -o Sully_%1$d Sully_%1$d.o; ./Sully_%1$d;", 0
cmdbase.3: DB "nasm -f elf64 -o Sully_%1$d.o Sully_%1$d.s; cc -no-pie -o Sully_%1$d Sully_%1$d.o; rm Sully_%1$d.o;", 0
format: DB "cmd is '%s'", 10

SECTION .text
main:
  mov al, 46
  cmp [rel (fna+5)], al
  je mkcmd.1
  dec DWORD [rel X]
mkcmd.1:
  mkcmd cmdbase.1
  mov rdi, cmd
  mov rsi, perm
  call fopen
  push rbp
  mov rdi, rax
  mov rsi, source
  mov rdx, 10
  mov rcx, 34
  mov r8, [rel X]
  mov r9, source
  call fprintf
  pop rbp
  cmp [rel X], 0
  jl mkcmd.3
mkcmd.2:
  mkcmd cmdbase.2
  jmp exe
mkcmd.3:
  mkcmd cmdbase.3
exe:
  push rbp
  mov rdi, format
  mov rsi, cmd
  call printf
  pop rbp

  push rbp
  mov rdi, cmd
  call system
  pop rbp
  xor rax, rax
  ret
