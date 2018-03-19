#include<stdio.h>
#include<stdlib.h>
int main(){
	FILE *fptr = NULL;
	char frame[5][5];
	while (1){
		fptr = fopen("D:\\Frame_go_back.txt", "r");
		char ch = fgetc(fptr);
		if (ch == NULL){
			printf("file not found\n");
			exit(0);
		}
		fclose(fptr);
		if (ch == '0'){
			fptr = fopen("D:\\Frame_go_back.txt", "w");
			fprintf(fptr, "5\n");
			printf("enter 5 frames of 3 bit \n");
			for (int i = 0; i < 5; i++){
				scanf("%s", frame[i]);
				fflush(stdin);
				fprintf(fptr, frame[i]);
				fprintf(fptr, "\n");
			}
			fclose(fptr);
		}
		else if (ch == '-'){
			fptr = fopen("D:\\Frame_go_back.txt", "r");
			int pos;
			ch = fgetc(fptr);
			ch = fgetc(fptr);
			pos = ch - '0';
			fclose(fptr);
			fptr = fopen("D:\\Frame_go_back.txt", "w");
			char p[2];
			itoa(pos, p, 10);
			fprintf(fptr,p);
			fprintf(fptr, "\n");
			printf("Retransmited of fallowing frames\n");
			for (int i = pos; i < 5; i++){
				fprintf(fptr, frame[i]);
				printf("%s\n", frame[i]);
				fprintf(fptr, "\n");
			}
			fclose(fptr);
		}

	}
	getchar();
	getchar();
	return 0;
}