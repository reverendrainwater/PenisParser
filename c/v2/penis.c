/*
 * penis.c
 *
 *  Created on: 8 maj 2017
 *      Author: it4e
 */
#include "stdio.h"
#include "stdlib.h"

int main(int argc, char ** argv) {
	FILE * file;
	char x;

	if((file = fopen(argv[1], "r")) == NULL)
		puts("u tricking me with peniszz u lil mastrbat0r"), exit(1);

	puts("penis ");
	while((x = fgetc(file)) != EOF)
		x == ' ' ? puts("penis ") : 0;

	return 0;
}



