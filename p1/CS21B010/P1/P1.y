%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    extern int yylex();
    extern int yyparse();
    extern FILE* yyin;
//void appendd((char *) &s1 , (char *) &s2);
    void yyerror(const char * s);
    int exec=1;
    
    char* appendd(char *s1 , char* s2);
    
    
    char* arr[10000];
    char* val[10000];
    int i;
   
    int ind=0;
    int ii;
    int search(char * macro)
    {
       for(ii = 0;ii<ind;ii++)
       {
       if(strcmp(arr[ii],macro)==0)
          {return 1;}
         } 
      
     
       return 0;
    }
    char* replace(char * macro)
    {
    int j;
      for(j=0;j<ind;j++)
       {
          if(strcmp(arr[j],macro)==0)
          {return val[j];}
       }
       return "";
    }
  
%}

%union {
    //int ival;
   //char str[1000];
   char * str;
    //char * str = (char*)malloc(1000*sizeof(char));
}
// TERMINAL TOKENS
%token<str> T_INT 
%token<str> T_ID
%token<str> T_DEFINE
%token<str> T_STATIC
%token<str> T_VOID
%token<str> T_MAIN
%token<str> T_STRING
%token<str> T_LEFT
%token<str> T_RIGHT
%token<str> T_C_LEFT
%token<str> T_C_RIGHT
%token<str> T_S_LEFT
%token<str> T_S_RIGHT
%token<str> T_SYSPRINT
%token<str> T_PUBLIC
%token<str> T_QUESTION
%token<str> T_RETURN 
%token<str> T_BOOLEAN
%token<str> T_S_INT
%token<str> T_ELSE
%token<str> T_DO
%token<str> T_WHILE
%token<str> T_ANDAND
%token<str> T_OROR
%token<str> T_NOTEQ
%token<str> T_LESSEQ
%token<str> T_PLUS
%token<str> T_MINUS
%token<str> T_DIVIDE
%token<str> T_MULTI
%token<str> T_TRUE
%token<str> T_FALSE
%token<str> T_THIS
%token<str> T_NEW
%token<str> T_NOT
%token<str> T_CLASS
%token<str> T_IF
%token<str> T_SEMICOLON
%token<str> T_EQ
%token<str> T_COM
%token<str> T_DOT
%token<str> T_LENGTH
%token<str> T_EXTENDS
%token<str> T_QUIT         // T_MAX T_NEWLINE NOT MADE

// NON-TERMINAL TOKENS
%type<str> goal
%type<str> MainClass 
%type<str> TypeDeclaration1
%type<str> TypeDeclaration
%type<str> Type_identifier1
%type<str> Method_declare1
%type<str> MethodDeclaration
%type<str> Question1
%type<str> Type_identifier2
%type<str> Type
%type<str> Statement
%type<str> Question2
%type<str> Statement1
%type<str> Expression1
%type<str> Expression
%type<str> PrimaryExpression
%type<str> MacroDefinition1
%type<str> MacroDefinition
%type<str> MacroDefStatement
%type<str> MacroDefExpression
%type<str> Question3
%type<str> Identifier1	

%start goal

%%

goal: MacroDefinition1 MainClass TypeDeclaration1  {$2=appendd($2,$3);strcat($$,$2);printf("%s\n",$$);/*printf("%s \n--hi \n  %s \n %s \n %s \n hii--",$$,$1,$2,$3);*/}      
    

MainClass : T_CLASS T_ID T_C_LEFT T_PUBLIC T_STATIC T_VOID T_MAIN T_LEFT T_STRING T_S_LEFT T_S_RIGHT T_ID T_RIGHT T_C_LEFT T_SYSPRINT T_LEFT Expression T_RIGHT T_SEMICOLON T_C_RIGHT T_C_RIGHT 

{$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$1=appendd($1,$6);$1=appendd($1,$7);$1=appendd($1,$8);$1=appendd($1,$9);$1=appendd($1,$10);$1=appendd($1,$11);$1=appendd($1,$12);$1=appendd($1,$13);$1=appendd($1,$14);$1=appendd($1,$15);$1=appendd($1,$16);$1=appendd($1,$17);$1=appendd($1,$18);$1=appendd($1,$19);$1=appendd($1,$20);$1=appendd($1,$20);$$=$1;}
          ;
TypeDeclaration1 : TypeDeclaration1 TypeDeclaration {$1=appendd($1,$2);$$=$1;}
                 |                      {$$=strdup("");}
                 ;
          
TypeDeclaration : T_CLASS T_ID T_C_LEFT Type_identifier1 Method_declare1 T_C_RIGHT 

{$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$1=appendd($1,$6);$$=$1;/*printf("\nhi  %s %s  %s %s %s %s hi\n",$1,$2,$3,$4,$5,$6);*/}

              |  T_CLASS T_ID T_EXTENDS T_ID T_C_LEFT Type_identifier1 Method_declare1 T_C_RIGHT 

{$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$1=appendd($1,$6);$1=appendd($1,$7);$1=appendd($1,$8);$$=$1;}
;

Type_identifier1 : Type_identifier1 Type T_ID T_SEMICOLON  {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$$=$1;/*printf("\n%s\n",$$);*/}
                |                          {/*printf("\nType_identifier1\n");*/$$=strdup("");}
                ;
                
Method_declare1  :  Method_declare1 MethodDeclaration {$1=appendd($1,$2);$$=$1;}
                |                        {$$=strdup("");}
                ;                        
                
MethodDeclaration :  T_PUBLIC Type T_ID T_LEFT Question1 T_RIGHT T_C_LEFT Type_identifier1 Statement1 T_RETURN Expression T_SEMICOLON T_C_RIGHT 
{$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$1=appendd($1,$6);$1=appendd($1,$7);$1=appendd($1,$8);$1=appendd($1,$9);$1=appendd($1,$10);$1=appendd($1,$11);$1=appendd($1,$12);$1=appendd($1,$13);$$=$1;}
;

Question1 : Type T_ID Type_identifier2 {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
          |                       {$$=strdup("");}
          ;


Type_identifier2 : Type_identifier2 T_COM Type T_ID  {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$$=$1;}
                 |                    {$$=strdup("");}
                 ;
                 
Type : T_S_INT T_S_LEFT T_S_RIGHT     {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
     | T_BOOLEAN                     {$$=$1;}
     | T_S_INT                         {$$=$1;}
     | T_ID                          {$$=$1;}
     
Statement : T_C_LEFT Statement1 T_C_RIGHT  {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
          | T_SYSPRINT T_LEFT Expression T_RIGHT T_SEMICOLON {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$$=$1;}
          | T_ID T_EQ Expression T_SEMICOLON {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$$=$1;}
          | T_ID T_S_LEFT Expression T_S_RIGHT T_EQ Expression T_SEMICOLON  {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$1=appendd($1,$6);$1=appendd($1,$7);$$=$1;}
          |T_IF T_LEFT Expression T_RIGHT Statement {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$$=$1;}
          | T_IF T_LEFT Expression T_RIGHT Statement T_ELSE Statement  {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$1=appendd($1,$6);$1=appendd($1,$7);$$=$1;}
          |T_DO Statement T_WHILE T_LEFT Expression T_RIGHT T_SEMICOLON  {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$1=appendd($1,$6);$1=appendd($1,$7);$$=$1;}
          
          | T_WHILE T_LEFT Expression T_RIGHT Statement {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$$=$1;}
          
          | T_ID T_LEFT Question2 T_RIGHT T_SEMICOLON   {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);
          if(search($1)==0){
          	printf("// Failed to parse macrojava code.");
          	exit(0);
          }
          $$=replace($1);}
          ;

Question2 :  {$$=strdup("");}
           | Expression1                   {$$=$1;}
          ;
          
Statement1 : Statement Statement1   {$1=appendd($1,$2);$$=$1;}
           |                    {$$=strdup("");}
           ;  
          
Expression1 : Expression1 T_COM Expression  {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
            | Expression                   {$$=$1;}
            ;
            
Expression : PrimaryExpression T_ANDAND PrimaryExpression {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
           | PrimaryExpression T_OROR PrimaryExpression {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
           | PrimaryExpression T_NOTEQ PrimaryExpression {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
           | PrimaryExpression T_LESSEQ PrimaryExpression {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
           | PrimaryExpression T_PLUS PrimaryExpression {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
           | PrimaryExpression T_MINUS PrimaryExpression {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
           | PrimaryExpression T_MULTI PrimaryExpression {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
           | PrimaryExpression T_DIVIDE PrimaryExpression {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
           | PrimaryExpression T_S_LEFT PrimaryExpression T_S_RIGHT {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$$=$1;}
           | PrimaryExpression T_DOT T_LENGTH {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
           | PrimaryExpression    {$$=$1;}
           | PrimaryExpression T_DOT T_ID T_LEFT Question2 T_RIGHT {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$1=appendd($1,$6);$$=$1;}  
           | T_ID T_LEFT Question2 T_RIGHT {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);
           if(search($1)){
           	$1=replace($1);
           	$$=$1;
           }
           else{
           	printf("// Failed to parse macrojava code.");
          	 exit(0);}
           }    
;
           
 PrimaryExpression : T_INT         {$$=$1;}   // define token not non-terminal
                   | T_TRUE        {$$=$1;}
                   | T_FALSE       {$$=$1;}
                   | T_ID          {$$=$1;}
                   | T_THIS        {$$=$1;}
                   | T_NEW T_S_INT T_S_LEFT Expression T_S_RIGHT {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$1=appendd($1,$5);$$=$1;}
                   | T_NEW T_ID T_LEFT T_RIGHT {$1=appendd($1,$2);$1=appendd($1,$3);$1=appendd($1,$4);$$=$1;}
                   | T_NOT Expression {$1=appendd($1,$2);$$=$1;}
                   | T_LEFT Expression T_RIGHT  {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
                   ;
   
MacroDefinition1 : MacroDefinition1 MacroDefinition {$$=strdup("");}
                 |                    {$$=strdup("");}
                 ;   
         
MacroDefinition :  MacroDefStatement   {$$=$1;}
                | MacroDefExpression  {$$=$1;}
                ;
                    
MacroDefStatement : T_DEFINE T_ID T_LEFT Question3 T_RIGHT T_C_LEFT Statement1 T_C_RIGHT {$2=appendd($2,$3);$2=appendd($2,$4);$2=appendd($2,$5);arr[ind]=$2;appendd($6,$7);appendd($6,$8);val[ind]=$6;ind++;}
               ;
              
MacroDefExpression : T_DEFINE T_ID T_LEFT Question3 T_RIGHT T_LEFT Expression T_RIGHT {$2=appendd($2,$3);$2=appendd($2,$4);$2=appendd($2,$5);arr[ind]=$2;appendd($6,$7);appendd($6,$8);val[ind]=$6;ind++;}
                   ;
 Question3 : T_ID Identifier1 {$1=appendd($1,$2);$$=$1;}
           |                  { $$=strdup("");}
           ;
           
Identifier1 : Identifier1 T_COM T_ID   {$1=appendd($1,$2);$1=appendd($1,$3);$$=$1;}
           |                  {$$=strdup("");}
            ;                            

 
%%


int main(){
    yyin = stdin;
	for( i =0;i < 10000;i++)
    {
       arr[i]=(char*)malloc(1000*sizeof(char));
       val[i]=(char*)malloc(1000*sizeof(char));
    }
    yyparse();
    return 0;
}

char * appendd(char *s1 , char *s2)
    {
       s1=(char*)realloc(s1,(strlen(s1)+strlen(s2)+2)*sizeof(char));
       strcat(s1," ");
       strcat(s1,s2);
       return s1;
       
    }

void yyerror(const char *s){
    fprintf(stdout, "// Failed to parse macrojava code.");
}
