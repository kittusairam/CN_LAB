#include<stdio.h>
#include<stdlib.h>
int main(){
	FILE *fptr = NULL;
	while (1){
		fptr = fopen("D:\\Frame_go_back.txt", "r");
		char ch = fgetc(fptr);
		if (ch == NULL){
			printf("file not found\n");
			exit(0);
		}
		fclose(fptr);
		if (ch > '0'&&ch <= '5'){
			fptr = fopen("D:\\Frame_go_back.txt", "r");
			char ch = fgetc(fptr);
			ch = fgetc(fptr);
			while (ch != EOF){
				printf("%c", ch);
				ch = fgetc(fptr);
			}
			int error_pos;
			printf("\nenter a number which frame is error no error for -1\n");
			scanf("%d", &error_pos);
			if (error_pos >-1 && error_pos<5){
				fptr = fopen("D:\\Frame_go_back.txt", "w");
				fprintf(fptr, "-");
				char p[2];
				itoa(error_pos, p, 10);
				fprintf(fptr, p);
				fclose(fptr);
			}
			if (error_pos == -1){
				fptr = fopen("D:\\Frame_go_back.txt", "w");
				fprintf(fptr, "0");
				fclose(fptr);
			}
		}
	}
}