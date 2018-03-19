/*
* C program to illustrate how a file stored on the disk is read
*/
#include <stdio.h>
#include <stdlib.h>

void main()
{
	FILE *fptr;
	char filename[15] = "D:\\Frame.txt";
	char ch;
	/*  open the file for reading */
	while (1){
		fptr = fopen(filename, "r");
		if (fptr == NULL)
		{
			printf("Cannot open file \n");
			exit(0);
		}
		ch = fgetc(fptr);
		if (ch == '1'){
			printf("Received data is:");
			ch = fgetc(fptr);
			while (ch != EOF)
			{
				printf("%c", ch);
				ch = fgetc(fptr);
			}
			fclose(fptr);
			int ack;
			printf("sent for ack by entering 1 otherwise 0\n");
			scanf("%d", &ack);
			if (ack == 1){
				FILE *fptr2 = fopen(filename, "w");
				fprintf(fptr2, "0\n");
				fclose(fptr2);
			}
		}
		fclose(fptr);
	}


	fclose(fptr);
}