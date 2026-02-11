
CC		= clang
CFLAGS	= -Wall -Wextra -Werror -g3 -fsanitize=address

DIFF	= diff --color=always

NAME	= Sully
SRC		= $(NAME).c
OUTPUT	= $(NAME)_{0..4}.c $(NAME)_{0..4}

all: $(NAME)

clean:
	rm -f $(OUTPUT)

fclean: clean
	rm $(NAME)

re: fclean all

$(NAME): $(SRC)
	$(CC) $(CFLAGS) -o $@ $<

$(OUTPUT): $(NAME)
	./$(NAME)

diff: $(OUTPUT)
	$(DIFF) $(SRC) $(OUTPUT)
