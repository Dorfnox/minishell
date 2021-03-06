/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strccount.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bpierce <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/06/25 18:14:30 by bpierce           #+#    #+#             */
/*   Updated: 2017/06/26 11:37:11 by bpierce          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int		ft_strccount(char *str, char c)
{
	int i;

	i = 0;
	if (str && c)
	{
		while (*str)
		{
			if (*str == c)
				i++;
			str++;
		}
		return (i);
	}
	return (-1);
}
