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
		for (long int i = 0; i < 6; i++){
			for (long int j = 0; j < 999999999; j++);
			fptr = fopen(filename, "r");
			if (fptr == NULL)
			{
				printf("Cannot open file \n");
				exit(0);
			}
			ch = fgetc(fptr);
			fclose(fptr);
			if (ch == '0'){
				int frame[6];
				printf("enter frame data of 5 binary values:");
				scanf("%s", frame);
				FILE *fptr2 = fopen(filename, "w");
				fprintf(fptr2, "1\n");
				fprintf(fptr2, "%s", frame);
				fclose(fptr2);
				printf("wait for ack\n");
			}
		}
		printf("ack not received at given time so retransmited data \n");
	}
	
	
	fclose(fptr);
}