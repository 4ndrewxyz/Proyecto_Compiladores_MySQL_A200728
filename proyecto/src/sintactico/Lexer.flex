package sintactico;
import static sintactico.Token.*;
%%
%class Lexer
%type Token
L = [a-zA-Z_]+
D = [0-9]+
ESPACIO = [ ,\t,\r]+
%{
    public String lexeme;
%}
%%
{ESPACIO} {/*Ignore*/} /* Espacios en blanco */
";" {lexeme=yytext(); return PUNTOCOMA;}
"DATABASE" {lexeme=yytext(); return DATABASE;}
"CREATE" {lexeme=yytext(); return CREATE;}
{L}({L}|{D})*  {lexeme=yytext(); return NOMBRE;}
