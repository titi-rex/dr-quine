
ASM		= nasm
AFLAGS	= -f elf64
CC		= gcc
CFLAGS	= -no-pie


NAME	= Colleen
SRC		= $(NAME).s
OBJ		= $(SRC:.s=.o)
OUTPUT	= $(NAME)_output.s


all: $(NAME)

clean:
	rm -f $(OUTPUT)

fclean: clean
	rm $(NAME)

re: fclean all

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $<

%.o: %.s
	$(ASM) $(AFLAGS) $< -o $@


test: $(NAME)
	./$(NAME) > $(OUTPUT); diff $(SRC) $(OUTPUT);

