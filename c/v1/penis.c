#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char * argv[])
{   FILE * file;
	int i = 0;
	char c = ' ';
	int word_count = 1;
	int newline_count = 1;
	file = fopen(argv[1], "r");
	if(file == NULL)
		printf("YOU DUMBASS, PASS A FILE NAME.\n");
	while((c = fgetc(file)) != EOF) {
		if(c == ' '){
		    word_count++;
		} else if (c == '\n'){
		    newline_count++;
		}
	}

	int word_lines = word_count / newline_count;
	while(word_count > -1){
	    for (i = word_lines; i > -1; i--){
			if (word_count > -1) printf("penis ");
			word_count--;
		}
		printf("\n");
	}
    return 0;
}
