
ASM		= nasm
AFLAGS	= -f elf64
CC		= gcc
CFLAGS	= -no-pie

DIFF	= diff --color=always

NAME	= Grace
SRC		= $(NAME).s
OBJ		= $(SRC:.s=.o)
OUTPUT	= $(NAME)_kid.s

.PHONY: all clean fclean re test diff

all: $(NAME)

clean:
	rm -f $(OBJ) $(OUTPUT)

fclean: clean
	rm -f $(NAME)

re: fclean all

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $<

$(OUTPUT): $(NAME)
	./$(NAME)

%.o: %.s
	$(ASM) $(AFLAGS) $< -o $@


diff: $(OUTPUT)
	$(DIFF) $(SRC) $(OUTPUT)


