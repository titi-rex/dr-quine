#include <stdio.h>
#include <stdlib.h>

#define X 5

const char* data = "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$c#define X %4$c%1$c%1$cconst char* data = %2$c%3$s%2$c;%1$c%1$cint  main(void)%1$c{%1$c#if X >= 0%1$c  char cmd[100];%1$c  const char x = 48 + X - 1;%1$c  const char name[] = {83, 117, 108, 108, 121, 95, x, 0};%1$c%1$c  sprintf(cmd, %2$c%%s.c%2$c, name);%1$c  FILE* f = fopen(cmd, %2$cw%2$c);%1$c  if (!f)%1$c    return (1);%1$c  fprintf(f, data, 10, 34, data, x);%1$c  fclose(f);%1$c  sprintf(cmd, %2$ccc -o %%1$s %%1$s.c; ./%%1$s%2$c, name);%1$c  system(cmd);%1$c#endif%1$c  return (0);%1$c}%1$c";

int  main(void)
{
#if X >= 0
  char cmd[100];
  const char x = 48 + X - 1;
  const char name[] = {83, 117, 108, 108, 121, 95, x, 0};

  sprintf(cmd, "%s.c", name);
  FILE* f = fopen(cmd, "w");
  if (!f)
    return (1);
  fprintf(f, data, 10, 34, data, x);
  fclose(f);
  sprintf(cmd, "cc -o %1$s %1$s.c; ./%1$s", name);
  system(cmd);
#endif
  return (0);
}
