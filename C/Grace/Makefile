
CC		= clang
CFLAGS	= -Wall -Wextra -Werror

DIFF	= diff --color=always

NAME	= Grace
SRC		= $(NAME).c
OUTPUT	= $(NAME)_kid.c

all: $(NAME)

clean:
	rm -f $(OUTPUT)

fclean: clean
	rm -f $(NAME)

re: fclean all

$(NAME): $(SRC)
	$(CC) $(CFLAGS) -o $@ $<

$(OUTPUT): $(NAME)
	./$(NAME)

diff: $(OUTPUT)
	$(DIFF) $(SRC) $(OUTPUT)

