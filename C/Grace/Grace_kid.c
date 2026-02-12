#include <stdio.h>
#include <fcntl.h>

#define SOURCE "#include <stdio.h>%1$c#include <fcntl.h>%1$c%1$c#define SOURCE %2$c%3$s%2$c%1$c#define KIDS open(%2$cGrace_kid.c%2$c, O_WRONLY | O_TRUNC | O_CREAT, 0644)%1$c#define GRACE(X) int main(void) {dprintf(KIDS, X, 10, 34, X); return (0);}%1$c%1$c/*%1$c  Grace write herself into her kid%1$c*/%1$c%1$cGRACE(SOURCE)%1$c"
#define KIDS open("Grace_kid.c", O_WRONLY | O_TRUNC | O_CREAT, 0644)
#define GRACE(X) int main(void) {dprintf(KIDS, X, 10, 34, X); return (0);}

/*
  Grace write herself into her kid
*/

GRACE(SOURCE)
