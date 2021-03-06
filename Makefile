# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dgerard <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/05/23 19:15:03 by dgerard           #+#    #+#              #
#    Updated: 2017/09/07 16:18:51 by dgerard          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fractol

FLAGS = -Wall -Werror -Wextra

LIBS = libs/libft/libft.a\
	   libs/minilibx/libmlx.a

SRCS = main.c\
	   draw_line.c\
	   phi.c\
	   fractal.c\
	   key_controls.c\

FRAMEWORKS = -framework OpenGL -framework AppKit

OFILES = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OFILES)
	@make -C libs/libft/
	@make -C libs/minilibx/
	@gcc $(CFLAGS) -o $@ $(OFILES) $(LIBS) $(FRAMEWORKS)
	@echo "\033[32m[fract-ol created ( ͡° ͜ʖ ͡°)]\033[0m"

%.o: %.c
	@gcc $(CFLAGS) -c $^ -o $@
	@/bin/echo -n "❂❂❂❂❂"

clean:
	@/bin/rm -f rm $(OFILES)
	@echo "\033[31m[.o files deleted (╯°□°）╯︵ ┻━┻ ]\033[0m"
	@make -C libs/libft/ clean
	@make -C libs/minilibx/ clean

fclean: clean
	@/bin/rm -f rm $(NAME)
	@echo "\033[31m[executable deleted ᕙ(⇀‸↼‶)ᕗ ]\033[0m"
	@make -C libs/libft/ fclean

re: fclean all
