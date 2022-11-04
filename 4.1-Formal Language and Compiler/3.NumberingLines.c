#include<stdio.h>
int main (void)
{
    FILE *f1, *f2;
    char c;
    int i=1;

    f1 = fopen("NumberingLine_input.txt","r");
    f2 = fopen("NumberingLine_output.txt","w");

    if(!f1)
        printf("Input file is not found!");
    else
    {
        char p[100];
        itoa(i, p, 10);
        fputs(p,f2);
        fputc(':',f2);
        i++;
        while( (c=fgetc(f1)) != EOF)
        {
            if((c=='\n'))
            {
                char p[100];
                itoa(i, p, 10);
                fputc('\n',f2);
                fputs(p,f2);
                fputc(':',f2);
                i++;
            }
            else
            {
                fputc(c,f2);
            }
        }
    }
    fclose(f1);
    fclose(f2);

    f2 = fopen("NumberingLine_output.txt","r");
    while( (c=fgetc(f2)) != EOF)
        printf("%c", c);
    fclose(f2);
}


