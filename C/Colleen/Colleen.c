#include <stdio.h>

// help: 10 -> \n, 9 -> \t, 34 -> ", 92 -> '\'

void	print(char *s)
{
	printf(s, 9, 10, 34, 92, s);
}

int	main(void)
{
	// The string below contain the program source code
	char	*s = "#include <stdio.h>%2$c%2$c// help: 10 -> %4$cn, 9 -> %4$ct, 34 -> %3$c, 92 -> '%4$c'%2$c%2$cvoid%1$cprint(char *s)%2$c{%2$c%1$cprintf(s, 9, 10, 34, 92, s);%2$c}%2$c%2$cint%1$cmain(void)%2$c{%2$c%1$c// The string below contain the program source code%2$c%1$cchar%1$c*s = %3$c%5$s%3$c;%2$c%2$c%1$cprint(s);%2$c%1$creturn (0);%2$c}%2$c";

	print(s);
	return (0);
}
