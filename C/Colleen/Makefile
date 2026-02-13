
CC		= clang
CFLAGS	= -Wall -Wextra -Werror

DIFF	= diff --color=always

NAME	= Colleen
SRC		= $(NAME).c
OUTPUT	= $(NAME)_output.c

.PHONY: all clean fclean re diff

all: $(NAME)

clean:
	rm -f $(OUTPUT)

fclean: clean
	rm -f $(NAME)

re: fclean all

$(NAME): $(SRC)
	$(CC) $(CFLAGS) -o $@ $<

$(OUTPUT): $(NAME)
	./$(NAME) > $(OUTPUT)

diff: $(OUTPUT)
	$(DIFF) $(SRC) $(OUTPUT)

