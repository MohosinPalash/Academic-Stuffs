#include<stdio.h>

//To check whether the token is a keyword or not!
int isKeyword(const char* token)
{
    const char keywords[32][20]= {"auto","break","case","char",
                                  "const","continue","default","do","double",
                                  "else","enum","extern","float",
                                  "for","goto","if","int","long",
                                  "register","return","short","signed",
                                  "sizeof","static","struct","switch",
                                  "typedef","union","unsigned",
                                  "void","volatile","while"
                                 };
    for(int i=0; i<32; i++)
    {
        if(strcmp(token,keywords[i])==0)
            return 1;
    }
    return 0;
}

//To check whether the token is an operator or not!
int isOperator(const char* token)
{
    const char operators[40][10] = {".","->","++","--","!","~","(type)","*","&",
                                    "sizeof","*","/","%","+","-","<<",">>","<",
                                    "<=",">",">=","==","!=","&","^","|","&&","||",
                                    "?:","=","+=","-=","*=","/=","%=","&=","^=",
                                    "|=","<<=",">>="
                                   };

    for(int i=0; i<40; i++)
    {
        if(strcmp(token,operators[i])==0)
            return 1;
    }
    return 0;
}

//To check whether the token is an separator or not!
int isSeparator(const char* token)
{

    if(token[0]==',' || token[0]==':' || token[0]==';' || token[0] == 39)
        return 1;
    else
        return 0;
}

//To check whether the token is a parenthesis or not!
int isParentheses(const char* token)
{

    if(token[0]=='(' || token[0]==')')
        return 1;
    else
        return 0;
}
//To check whether the token is a curlybraces or not!
int isCurlybrackets(const char* token)
{

    if(token[0]=='{' || token[0]=='}')
        return 1;
    else
        return 0;
}

//To check whether the token is an identifier or not!
int isIdentifier(const char* token)
{
    if(isalpha(token[0]) || token[0]=='_')
    {
        for(int i=1; token[i]!='\0'; i++)
        {
            if(token[i] =='_' )
                continue;
            if(!isalnum(token[i]) )
                return 0;
        }
        return 1;
    }
    return 0;
}

int isNum (const char* lex)
{
    int i, l, s;
    i=0;
    if(isdigit(lex[i]))
    {
        s=1;
        i++;
    }
    else if(lex[i]=='.')
    {
        s=2;
        i++;
    }
    else s=0;
    l=strlen(lex);
    if(s==1)
        for(; i<l; i++)
        {
            if(isdigit(lex[i]))
                s=1;
            else if(lex[i]=='.')
            {
                s=2;
                i++;
                break;
            }
            else
            {
                s=0;
                break;
            }
        }
    if(s==2)
        if(isdigit(lex[i]))
        {
            s=3;
            i++;
        }
        else
            s=0;
    if(s==3)
        for(; i<l; i++)
        {
            if(isdigit(lex[i]))
                s=3;
            else
            {
                s=0;
                break;
            }
        }
    if(s==3) s=1;
    return s;

}


int main (void)
{
    char input_code[100000];
    printf("Input your code to compile:\n\n");
    //To get multiple line input
    scanf("%[^$]s", input_code);

    FILE *f1, *f2, *f3;

    //Insert the code into a new file
    f1 = fopen("storeCode.txt","w");
    fputs(input_code, f1);
    fclose(f1);


    char c;


    f1 = fopen("storeCode.txt","r");
    f2 = fopen("separatedCode.txt","w");

    if(!f1)
        printf("Input file is not found!");
    else
    {

        //To separate the lexemes
        int x =0;
        while( (c= fgetc(f1)) != EOF )
        {
            if(c==39)
            {
                fputc(' ',f2);
                fputc(c,f2);
                continue;
            }

            if(x==0 && (c ==';' || c ==',' || c =='='|| c =='+'|| c =='-'|| c =='*'|| c =='/'|| c =='%'|| c =='('|| c ==')'|| c =='{'|| c =='}' || c =='['|| c ==']'|| c =='!'|| c =='>'|| c =='<'|| c =='&' || c =='"')  )
            {
                fputc(' ',f2);
                fputc(c,f2);
                x=1;
            }
            else if( x==1 && (c ==';' || c ==',' || c =='='|| c =='+'|| c =='-'|| c =='*'|| c =='/'|| c =='%'|| c =='('|| c ==')'|| c =='{'|| c =='}' || c =='['|| c ==']'|| c =='!'|| c =='>'|| c =='<'|| c =='&' || c =='"')  )
            {
                fputc(c,f2);
            }
            else if ( x==1 && (c !=';' || c !=',' || c !='='|| c !='+'|| c !='-'|| c !='*'|| c !='/'|| c !='%'|| c !='('|| c !=')'|| c !='{'|| c !='}' || c !='['|| c !=']'|| c !='!'|| c !='>'|| c !='<'|| c !='&' || c !='"') )
            {
                fputc(' ',f2);
                fputc(c,f2);
                x=0;
            }
            else if( x==0 && (c !=';' || c !=',' || c !='='|| c !='+'|| c !='-'|| c !='*'|| c !='/'|| c !='%'|| c !='('|| c !=')'|| c !='{'|| c !='}' || c !='['|| c !=']'|| c !='!'|| c !='>'|| c !='<'|| c !='&' || c !='"') )
            {
                fputc(c,f2);
            }
        }
        fclose(f1);
        fclose(f2);

        //Print the lexemes
        printf("\n\nThe separated lexemes are:\n\n");

        f2 = fopen("separatedCode.txt","r");
        while( (c=fgetc(f2) ) != EOF)
            printf("%c", c);
        fclose(f2);

        f2 = fopen("separatedCode.txt","r");
        f3 = fopen("output.txt","w");

        char p[1024];
        while(fscanf(f2, "%1023s", p) !=EOF)
        {
            if( isOperator(p))
            {
                fputs("[ op ",f3);
                fputs(p,f3);
                fputs(" ]",f3);
            }
            else if( isKeyword(p))
            {
                fputs("[ kw ",f3);
                fputs(p,f3);
                fputs(" ]",f3);
            }
            else if( isNum(p))
            {
                fputs("[ num ",f3);
                fputs(p,f3);
                fputs(" ]",f3);
            }
            else if( isIdentifier(p))
            {
                fputs("[ id ",f3);
                fputs(p,f3);
                fputs(" ]",f3);
            }
            else if( isSeparator(p))
            {
                fputs("[ sep ",f3);
                fputs(p,f3);
                fputs(" ]",f3);
            }
            else if( isParentheses(p))
            {
                fputs("[ par ",f3);
                fputs(p,f3);
                fputs(" ]",f3);
            }
            else if( isCurlybrackets(p))
            {
                fputs("[ cb ",f3);
                fputs(p,f3);
                fputs(" ]",f3);
            }
            else
            {
                fputs("[ unkn ",f3);
                fputs(p,f3);
                fputs(" ]",f3);
            }
        }
        fclose(f3);

    }
    fclose(f1);
    fclose(f2);

    printf("\n\nToken Type and Names:\n\n");

    f3 = fopen("output.txt","r");
    while( (c=fgetc(f3) ) != EOF)
        printf("%c", c);
    fclose(f3);

    printf("\n\n");
}



