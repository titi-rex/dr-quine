#include <stdio.h>
#include <fcntl.h>

#define SOURCE "#include <stdio.h>%1$c#include <fcntl.h>%1$c%1$c#define SOURCE %2$c%3$s%2$c%1$c#define KIDS open(%2$cGrace_kid.c%2$c, O_WRONLY | O_TRUNC | O_CREAT, 0644)%1$c#define GRACE() int main(void) {dprintf(KIDS, SOURCE, 10, 34, SOURCE); return (0);}%1$c%1$c/*%1$c  Grace write herself into her kid%1$c*/%1$c%1$cGRACE()%1$c"
#define KIDS open("Grace_kid.c", O_WRONLY | O_TRUNC | O_CREAT, 0644)
#define GRACE() int main(void) {dprintf(KIDS, SOURCE, 10, 34, SOURCE); return (0);}

/*
  Grace write herself into her kid
*/

GRACE()
