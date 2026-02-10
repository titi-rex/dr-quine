
CC		= clang
CFLAGS	= -Wall -Wextra -Werror

DIFF	= diff --colors=always

NAME	= Grace
SRC		= $(NAME).c
OUTPUT	= $(NAME)_output.c

all: $(NAME)

clean:
	rm -f $(OUTPUT)

fclean: clean
	rm $(NAME)

re: fclean all

$(NAME): $(SRC)
	$(CC) $(CFLAGS) -o $@ $<

test: diff

$(OUTPUT): $(NAME)
	./$(NAME) > $(OUTPUT)

diff: $(OUTPUT)
	$(DIFF) $(SRC) $(OUTPUT)

