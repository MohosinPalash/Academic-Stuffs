#include<stdio.h>
int main (void)
{
    char input_code[100000];
    printf("Input your code to compile:\n\n");
    //To get multiple line input
    scanf("%[^$]s", input_code);

    FILE *f1, *f2;

    //Insert the code into a new file
    f1 = fopen("storeCode.txt","w");
    fputs(input_code, f1);
    fclose(f1);


    char c;


    f1 = fopen("storeCode.txt","r");
    f2 = fopen("eraseComment.txt","w");

    if(!f1)
        printf("Input file is not found!");
    else
    {
        while( (c= fgetc(f1)) != EOF )
        {
            if(c== '\n')
            {
                continue;
            }
            else if( (c == '/'))
            {
                (c= fgetc(f1)) != EOF;

                if(c == '/')
                {
                    while( c != '\n' )
                    {
                        (c= fgetc(f1)) != EOF;
                        continue;
                    }
                }
                else if(c == '*')
                {
                    (c= fgetc(f1)) != EOF;
                    while(c != '*'){
                        (c= fgetc(f1)) != EOF;
                        if(c!='/')
                        continue;
                    }

                }
            }
            else
            {
                fputc(c,f2);
            }
        }
    }
    fclose(f1);
    fclose(f2);

    printf("\n\nYour code after erasing new lines and comments:\n\n");

    f2 = fopen("eraseComment.txt","r");
    while( (c=fgetc(f2) ) != EOF)
        printf("%c", c);
    fclose(f2);

     printf("\n\n");
}



