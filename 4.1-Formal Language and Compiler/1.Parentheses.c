#include<stdio.h>
int main (void)
{
    FILE *f1, *f2;
    char c;

    f1 = fopen("parentheses_input.txt","r");
    f2 = fopen("parentheses_output.txt","w");

    if(!f1)
        printf("Input file is not found!");
    else{
        while( (c= fgetc(f1)) != EOF){
            if( (c == '(') || (c == ')') ){
                fputc(c, f2);
            }
        }
    }
    fclose(f1);
    fclose(f2);

    f2 = fopen("parentheses_output.txt","r");
    while( (c=fgetc(f2)) != EOF)
        printf("%c", c);
    fclose(f2);
}
