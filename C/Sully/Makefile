
CC		= clang
CFLAGS	= -Wall -Wextra -Werror

NAME	= Colleen
SRC		= Colleen.c
OUTPUT	= $(NAME)_output.c

all: $(NAME)

clean:
	rm -f $(OUTPUT)

fclean: clean
	rm $(NAME)

re: fclean all

$(NAME): $(SRC)
	$(CC) $(CFLAGS) -o $@ $<

test: $(NAME)
	./$(NAME) > $(OUTPUT); diff $(SRC) $(OUTPUT);

