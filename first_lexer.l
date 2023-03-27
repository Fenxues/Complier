%{
#include <stdlib.h>
#include <stdio.h>
#define NUM 201612345
int num_chars = 0;
int num_ids=0;
int num_lines=1;
%}
delim [ ]
letter [A-Za-z]
digit [0-9]
number {digit}+
id {letter}+

%%
\n {num_lines++;printf("\n");}
{number} {int r=atoi(yytext);
	  if(r==NUM)   printf("夏天的鼻涕怪 "); 
  	  else         printf("%s ",yytext);
  	   num_ids++;
  	  }
{delim} {printf(" ");}
{id} {printf("%s ",yytext);num_chars+=yyleng;num_ids++;}

%%
main()
{
	yylex();
	printf("\n# of ids = %d ,# of chars = %d ,# of lines = %d ",num_ids , num_chars,num_lines);
}