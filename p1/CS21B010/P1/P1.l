%option noyywrap

%{

#include "P1.tab.h"
#include <string.h>
		
%}

%%


"#define" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_DEFINE;}
"static" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_STATIC;}
"void" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_VOID;}
"main" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_MAIN;}		
"String" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_STRING;} 
"{" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_C_LEFT;}
"}" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_C_RIGHT;}
"(" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_LEFT;}
")" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_RIGHT;}
"[" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_S_LEFT;}
"]" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_S_RIGHT;}
"System.out.println" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_SYSPRINT;}
"public" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_PUBLIC;}
"?" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_QUESTION;}
"return" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_RETURN;}
"boolean" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_BOOLEAN;}
"int" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_S_INT;}
"else" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_ELSE;}
"d0" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_DO;}
"while" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_WHILE;}
"&&" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_ANDAND ;}
"||" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_OROR;}
"!=" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_NOTEQ;}
"<=" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_LESSEQ;}
"+" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_PLUS;}
"-" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_MINUS;}
"*" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_MULTI;}
"/" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_DIVIDE;}
"true" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_TRUE;}
"false" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_FALSE;}
"this" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_THIS;}
"new" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_NEW;}
"!" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_NOT;} 
"class" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_CLASS;}
"if" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_IF;}
";" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_SEMICOLON;}
"=" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_EQ;}
"," {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_COM;}
"." {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_DOT;}
"length" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_LENGTH;}
"extends" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_EXTENDS;}
"exit" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_QUIT;}
"quit" {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_QUIT;}
"//"[^\n]* 
"/*"[^"*/"]"*/"
[a-zA-Z_][0-9a-zA-Z_]* {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_ID;}
[0-9]+ {yylval.str=strdup(yytext); /*printf("%s",yytext);*/ return T_INT;}

[ \n\t\r\f] {/*printf("%s",yytext);*/}

. {}

%%
