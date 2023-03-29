package sintactico;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup /* Regresar el análisis */
%full /* Retornar toda la cadena */
%line /* Regresa la línea */
%char /* Regresa la columna en la que se encuentra */
L = [a-zA-Z_]+
D = [0-9]+
ESPACIO = [ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
{ESPACIO} {/*Ignore*/} /* Espacios en blanco */
";" {return new Symbol(sym.PUNTOCOMA, yychar, yyline, yytext());}
"CREATE" {return new Symbol(sym.CREATE, yychar, yyline, yytext());}
"DATABASE" {return new Symbol(sym.DATABASE, yychar, yyline, yytext());}
{L}({L}|{D})* {return new Symbol(sym.NOMBRE, yychar, yyline, yytext());}

