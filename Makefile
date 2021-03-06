# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bpierce <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/25 10:27:14 by bpierce           #+#    #+#              #
#    Updated: 2018/03/08 22:04:15 by bpierce          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell

FILES = main \
		main_helper \
		signal \
		input_revamped \
		parse_paths \
		parse_command_line \
		open_quotes \
		expand_environmental_variables \
		autocomplete \
		history \
		split_by_semicolon \
		split_by_and \
		split_by_arg \
		split_helper \
		minishell \
		environ \
		b_env \
		b_setenv \
		b_unsetenv \
		b_cd \
		b_echo \
		b_byp

C_LOC = src/
C_NAM = $(addsuffix .c, $(FILES))
C_SRC = $(addprefix $(C_LOC), $(C_NAM))

O_LOC = obj/
O_NAM = $(addsuffix .o, $(FILES))
O_SRC = $(addprefix $(O_LOC), $(O_NAM))

LIB_LOC = libft/
LIB_NAM = libft.a
LIB_SRC = $(addprefix $(LIB_LOC), $(LIB_NAM))

H_LOCS = -I inc -I libft/inc
HEADERS = inc/ft_minishell.h

C_FLAGS = -Wall -Wextra -Werror

TEST_MAIN = main_for_testing.c

RED = [31m
GREEN = [32m
BLUE = [34m
YELLOW = [33m
MAGENTA = [35m
GREY = [37m
GREEN_LIGHT = [92m
GREEN_LIGHT_BLINK = [5;92m
YELLOW_LIGHT = [93m
YELLOW_BOLD = [1;33m
YELLOW_LIGHT_BOLD = [1;93m
MAGENTA_LIGHT = [95m
BLINK = [5m
END_COLOUR = \033[0m

all: $(NAME)

$(NAME): $(O_SRC) $(LIB_SRC)
	@echo "$(YELLOW_BOLD)Compiling executable... $@$(END_COLOUR)"
	@gcc $(C_FLAGS) $^ -o $@
	@echo
	@echo "$(GREEN_LIGHT)     xxXXXXXXXXxx     $(END_COLOUR)"
	@echo "$(GREEN_LIGHT)  xXX------------XXx  $(END_COLOUR)"
	@echo "$(GREEN_LIGHT)xXX--- $(GREEN_LIGHT_BLINK)COMPLETE$(END_COLOUR) $(GREEN_LIGHT)---XXx$(END_COLOUR)"
	@echo "$(GREEN_LIGHT)xXX---- $(GREEN_LIGHT_BLINK)YIPPEE$(END_COLOUR) $(GREEN_LIGHT)----XXx$(END_COLOUR)"
	@echo "$(GREEN_LIGHT)  xXX------------XXx  $(END_COLOUR)"
	@echo "$(GREEN_LIGHT)     XXxxxxxxxxXX     $(END_COLOUR)"
	@echo

$(O_LOC)%.o: $(C_LOC)%.c $(HEADERS)
	@echo "$(GREY)Re-compiling src file... $(END_COLOUR)$(YELLOW)$<$(END_COLOUR)"
	@gcc $(C_FLAGS) $(H_LOCS) -o $@ -c $<

$(LIB_SRC): force
	@echo "$(YELLOW)----------- Checking Libft Library -----------$(END_COLOUR)"
	@printf "$(YELLOW_LIGHT)$@ re-compile status: $(END_COLOUR)"
	@make -C $(LIB_LOC)
	@echo "$(YELLOW)----------- Library Check Complete -----------$(END_COLOUR)"

force:
	@true

clean:
	@/bin/rm -rf $(O_SRC)
	@make clean -C $(LIB_LOC)
	@echo "$(GREEN)clean complete!$(END_COLOUR)"

fclean: clean
	@/bin/rm -f $(NAME)
	@make fclean -C $(LIB_LOC)
	@echo "$(GREEN)fclean complete!$(END_COLOUR)"

re: fclean all

test: $(NAME)
	@./$(NAME)

.PHONY: all test force clean fclean re
