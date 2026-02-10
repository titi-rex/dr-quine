#include <stdio.h>

// help: 10 -> \n, 9 -> \t, 34 -> ", 92 -> '\'

void	print(char *s)
{
	printf(s, 10, 10, 92, 92, 34, 92, 10, 10, 9, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 9, 34, s, 34, 10, 10, 9, 10, 9, 10, 10);
}

int	main(void)
{
	// The string below contain the program source code
	char	*s = "#include <stdio.h>%c%c// help: 10 -> %cn, 9 -> %ct, 34 -> %c, 92 -> '%c'%c%cvoid%cprint(char *s)%c{%c%cprintf(s, 10, 10, 92, 92, 34, 92, 10, 10, 9, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 9, 34, s, 34, 10, 10, 9, 10, 9, 10, 10);%c}%c%cint%cmain(void)%c{%c%c// The string below contain the program source code%c%cchar%c*s = %c%s%c;%c%c%cprint(s);%c%creturn (0);%c}%c";

	print(s);
	return (0);
}
