#include <stdio.h>
#include <stdlib.h>

#define X 5

const char* data = "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$c#define X %4$d%1$c%1$cconst char* data = %2$c%3$s%2$c;%1$c%1$cint  main(void)%1$c{%1$c  char cmd[100];%1$c  int x = X - 1;%1$c%1$c  if (__FILE_NAME__[5] == 46)%1$c    x = X;%1$c  sprintf(cmd, %2$cSully_%%d.c%2$c, x);%1$c%1$c  FILE* f = fopen(cmd, %2$cw%2$c);%1$c  if (!f)%1$c    return (1);%1$c  fprintf(f, data, 10, 34, data, x);%1$c  fclose(f);%1$c  if (x > 0)%1$c    sprintf(cmd, %2$ccc -o Sully_%%1$d Sully_%%1$d.c; ./Sully_%%1$d;%2$c, x);%1$c  else%1$c    sprintf(cmd, %2$ccc -o Sully_%%1$d Sully_%%1$d.c;%2$c, x);%1$c  system(cmd);%1$c  return (0);%1$c}%1$c";

int  main(void)
{
  char cmd[100];
  int x = X - 1;

  if (__FILE_NAME__[5] == 46)
    x = X;
  sprintf(cmd, "Sully_%d.c", x);

  FILE* f = fopen(cmd, "w");
  if (!f)
    return (1);
  fprintf(f, data, 10, 34, data, x);
  fclose(f);
  if (x > 0)
    sprintf(cmd, "cc -o Sully_%1$d Sully_%1$d.c; ./Sully_%1$d;", x);
  else
    sprintf(cmd, "cc -o Sully_%1$d Sully_%1$d.c;", x);
  system(cmd);
  return (0);
}
