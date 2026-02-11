#include <stdio.h>

#define X 5

const char* data = "#include <stdio.h>%1$c%1$c#define X %4$c%1$c%1$cconst char* data = %2$c%3$s%2$c;%1$c%1$cint  main (void)%1$c{%1$c  char x = 48 + X - 1;%1$c  char name[] = {83, 117, 108, 108, 121, 95, x, 46, 99, 0};%1$c%1$c  FILE* f = fopen(name, %2$cw%2$c);%1$c  if (f)%1$c  {%1$c    fprintf(f, data, 10, 34, data, x);%1$c  }%1$c  fclose(f);%1$c  return (0);%1$c}%1$c";

int	main(void)
{
  char x = 48 + X - 1;
  char name[] = {83, 117, 108, 108, 121, 95, x, 46, 99, 0};

  // name[7] = '\0';
  FILE* f = fopen(name , "w");
  if (f)
  {
    fprintf(f, data, 10, 34, data, x);
    // int pid = fork();
    // if (pid > 0)
    // {
    //  execlp("gcc", "gcc", FILE_NAME ".c", "-o", FILE_NAME (char *) NULL);
    // }
    // wait();
    // pid = fork()
    // 
      // printf("name is: Sully_%c.c\n", x);
  }
  fclose(f);
  return (0);
}
