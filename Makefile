# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acolas <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/01/07 16:54:15 by acolas            #+#    #+#              #
#    Updated: 2019/03/20 22:07:33 by acolas           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

EXEC_FILE = corewar
SRCS = 

OBJS = $(SRCS:.c=.o)
CC = gcc
INCLUDES = -I libft/ -I ./includes
CFLAGS = -Wall -Wextra -Werror

.PHONY : all clean fclean re

all : $(EXEC_FILE)

$(EXEC_FILE) : $(OBJS) libft/libft.a  
		@$(CC) $(CFLAGS) -Llibft -lft $^ -o $@

%.o: %.c
	    @$(CC) $(CFLAGS) $(INCLUDES) -c $^ -o $@

libft/libft.a:
		@make -C libft

clean :
		@make -C libft clean
		@rm -rf $(OBJS)

fclean : clean
		@make -C libft fclean
		@rm -rf $(EXEC_FILE)

re : fclean all
