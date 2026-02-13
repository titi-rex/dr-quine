global main
extern fopen, fprintf, fclose, sprintf, system, printf

; prepare command macro
%macro mkcmd 1
  push rbp
  mov rdi, cmd
  mov rsi, %1
  mov rdx, [abs X]
  call sprintf
  pop rbp
%endmacro

SECTION .data
X: DD 5
fna: DB __?FILE?__ ; file name

source: DB "global main%1$cextern fopen, fprintf, fclose, sprintf, system, printf%1$c%1$c; prepare command macro%1$c%%macro mkcmd 1%1$c  push rbp%1$c  mov rdi, cmd%1$c  mov rsi, %%1%1$c  mov rdx, [abs X]%1$c  call sprintf%1$c  pop rbp%1$c%%endmacro%1$c%1$cSECTION .data%1$cX: DD %3$d%1$cfna: DB __?FILE?__ ; file name%1$c%1$csource: DB %2$c%4$s%2$c, 0 ; source code%1$cperm: DB %2$cw%2$c, 0 ; file open mode%1$c%1$ccmd: times 128 DB 0 ; cmd buffer%1$ccmdbase.1: DB %2$cSully_%%d.s%2$c, 0%1$ccmdbase.2: DB %2$cnasm -f elf64 -o Sully_%%1$d.o Sully_%%1$d.s && cc -no-pie -o Sully_%%1$d Sully_%%1$d.o; rm Sully_%%1$d.o; ./Sully_%%1$d;%2$c, 0%1$ccmdbase.3: DB %2$cnasm -f elf64 -o Sully_%%1$d.o Sully_%%1$d.s && cc -no-pie -o Sully_%%1$d Sully_%%1$d.o; rm Sully_%%1$d.o;%2$c, 0%1$c%1$cSECTION .text%1$cmain:%1$c; test if original file%1$c  mov al, 46%1$c  cmp [abs (fna+5)], al%1$c  je mkcmd.1%1$c  dec DWORD [abs X] ; if not, decrease X%1$c%1$cmkcmd.1:%1$c  mkcmd cmdbase.1 ; prepare file name%1$c%1$c; create file%1$c  push rbp%1$c  mov rdi, cmd%1$c  mov rsi, perm%1$c  call fopen%1$c  pop rbp%1$c%1$c  mov r12, rax ; save file handle%1$c%1$c; write source code%1$c  push rbp%1$c  mov rdi, rax%1$c  mov rsi, source%1$c  mov rdx, 10%1$c  mov rcx, 34%1$c  mov r8, [abs X]%1$c  mov r9, source%1$c  call fprintf%1$c  pop rbp%1$c%1$c; close file%1$c  mov rdi, r12%1$c  push rbp%1$c  call fclose%1$c  pop rbp%1$c%1$c  cmp DWORD [abs X], 0 ; test if last file (don't run it)%1$c  jle mkcmd.3%1$c%1$cmkcmd.2:%1$c  mkcmd cmdbase.2 ; prepare command build + run%1$c  jmp exe%1$c%1$cmkcmd.3:%1$c  mkcmd cmdbase.3 ; prepare command build%1$c%1$cexe:%1$c; exec command%1$c  push rbp%1$c  mov rdi, cmd%1$c  call system%1$c  pop rbp%1$c%1$c  xor rax, rax%1$c  ret%1$c", 0 ; source code
perm: DB "w", 0 ; file open mode

cmd: times 128 DB 0 ; cmd buffer
cmdbase.1: DB "Sully_%d.s", 0
cmdbase.2: DB "nasm -f elf64 -o Sully_%1$d.o Sully_%1$d.s && cc -no-pie -o Sully_%1$d Sully_%1$d.o; rm Sully_%1$d.o; ./Sully_%1$d;", 0
cmdbase.3: DB "nasm -f elf64 -o Sully_%1$d.o Sully_%1$d.s && cc -no-pie -o Sully_%1$d Sully_%1$d.o; rm Sully_%1$d.o;", 0

SECTION .text
main:
; test if original file
  mov al, 46
  cmp [abs (fna+5)], al
  je mkcmd.1
  dec DWORD [abs X] ; if not, decrease X

mkcmd.1:
  mkcmd cmdbase.1 ; prepare file name

; create file
  push rbp
  mov rdi, cmd
  mov rsi, perm
  call fopen
  pop rbp

  mov r12, rax ; save file handle

; write source code
  push rbp
  mov rdi, rax
  mov rsi, source
  mov rdx, 10
  mov rcx, 34
  mov r8, [abs X]
  mov r9, source
  call fprintf
  pop rbp

; close file
  mov rdi, r12
  push rbp
  call fclose
  pop rbp

  cmp DWORD [abs X], 0 ; test if last file (don't run it)
  jle mkcmd.3

mkcmd.2:
  mkcmd cmdbase.2 ; prepare command build + run
  jmp exe

mkcmd.3:
  mkcmd cmdbase.3 ; prepare command build

exe:
; exec command
  push rbp
  mov rdi, cmd
  call system
  pop rbp

  xor rax, rax
  ret
