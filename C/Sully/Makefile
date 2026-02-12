
CC		= clang
CFLAGS	= -Wall -Wextra -Werror

DIFF	= diff --color=always

NAME	= Sully
SRC		= $(NAME).c

OUTPUT		= _0 _1 _2 _3 _4 _5
OUTPUT_NAME	= $(addprefix $(NAME), $(OUTPUT))
OUTPUT_SRC	= $(addsuffix .c, $(OUTPUT_NAME))

TMP_DIR		= tmp
OUTPUT_TMP	= $(addprefix $(TMP_DIR)/, $(OUTPUT_SRC))


.PHONY: all clean fclean re test diff

all: $(NAME)

clean:
	@rm -f $(OUTPUT_SRC)
	@rm -rf tmp
	@echo Clean

fclean: clean
	rm -f $(OUTPUT_NAME)
	rm -f $(NAME)

re: fclean all

$(NAME): $(SRC)
	$(CC) $(CFLAGS) -o $@ $<

test: $(NAME) clean
	@mkdir -p $(TMP_DIR); cp $(NAME) $(TMP_DIR)/$(NAME); cd $(TMP_DIR); ./$(NAME);
	@echo Number of files: $$(ls -la tmp | grep Sully | wc -l)

diff: test
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_5.c;
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_4.c;
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_3.c;
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_2.c;
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_1.c;
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_0.c;

