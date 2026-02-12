
ASM		= nasm
AFLAGS	= -f elf64
CC		= gcc
CFLAGS	= -no-pie

DIFF	= diff --color=always

NAME	= Sully
SRC		= $(NAME).s
OBJ		= $(SRC:.s=.o)

TMP_DIR		= tmp

.PHONY: all clean fclean re test diff

all: $(NAME)

clean:
	rm -f $(OBJ) $(TMP_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $<

%.o: %.s
	$(ASM) $(AFLAGS) $< -o $@



test: $(NAME) clean
	@mkdir -p $(TMP_DIR); cp $(NAME) $(TMP_DIR)/$(NAME); cd $(TMP_DIR); ./$(NAME);
	@echo Number of files: $$(ls -la $(TMP_DIR) | grep Sully | wc -l)

diff: test
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_5.c;
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_4.c;
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_3.c;
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_2.c;
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_1.c;
	-$(DIFF) $(SRC) $(TMP_DIR)/$(NAME)_0.c;


