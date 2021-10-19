package com.company;
import java.util.ArrayList;
import java_cup.runtime.*;

//Integrantes
//Esteban Gonzalez Tamayo
//Emanuel Isaza Vera

%%
%class lexer
%line
%column
%cup

%{

    public String errlex="";
    public ArrayList<Token> ts = new ArrayList<Token>();
    public Symbol symbol(int type)
    {
        return new Symbol(type,yyline,yycolumn);
    }

%}

//alfabeto

a = [a-zA-Z]
n = [0-9]
s = "_"
x = [\n\t\r ]

//exp reg

num = "-"?{n}+
real = "-"?{n}+"."{n}+
id = {a}({a}|{n}|{s})*
str = "'"({a}|{n}|{s}|" ")* "'"
com = "#" ({a}|{n}|{s}|" ")+
op_aritmetico = "+" | "-" | "*"
op_incremento = "++" | "--"
op_relacional = ">" | "<" | "<=" | ">=" | "==" | "!="
ol = "|"|"&"
asig = "="
Mientras = "Mientras"|"mientras"|"MIENTRAS"
FinMientras = "FinMientras"|"finmientras"|"FINMIENTRAS"|"Fin Mientras"|"fin mientras"
hacer = "hacer"|"HACER"|"Hacer"
pc=";"
ENT = "int"|"double"|"float"
cad = "String"
%%



"Programa" {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.Programa);}
"FinPrograma" {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.FinPrograma);}
{Mientras} {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.mientras);}
{hacer} {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.hacer);}
{FinMientras} {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.finmientras);}
"para" {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.para);}
"finpara" {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.finpara);}
"hasta" {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.hasta);}
"leer" {ts.add(new Token("Palabra reservada leer ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.leer);}
"escribir" {ts.add(new Token("Palabra reservada escribir", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.escribir);}
{pc} {ts.add(new Token("punto y coma ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.pc);}
{cad} {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.pal);}
"("  {ts.add(new Token("P. Izquierdo ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.pi);}
")" {ts.add(new Token("P. Derecho ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.pd);}
"si" {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.si);}
"finsi" {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.finsi);}
"entonces" {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.entonces);}
"sino" {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.sino);}
"," {ts.add(new Token("Palabra reservada ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.com);}
{num} {ts.add(new Token("Entero ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.num);}
{ENT} {ts.add(new Token("Entero ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.ent);}
{asig} {ts.add(new Token("Asignacion ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.asig);}
{real} {ts.add(new Token("Real ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.real);}
{id} {ts.add(new Token("Indentificador ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.id);}
{str} {ts.add(new Token("Cadena ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.str);}
{ol} {ts.add(new Token("operador logico ", yytext(),(yyline+1),(yycolumn+1)));return symbol(sym.ol);}
{op_aritmetico} {ts.add(new Token("Operador Aritmetico ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.op_aritmetico);}
{op_incremento} {ts.add(new Token("Operador Aritmetico ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.op_incremento);}
{op_relacional} {ts.add(new Token("Operador Relacional ", yytext(),(yyline+1),(yycolumn+1))); return symbol(sym.op_relacional);}
{com} {}
{x} {}
. {errlex+="\nError lexico, en linea-> " + (yyline+1) + " , "+ (yycolumn+1) + " caracter no valido-> " + yytext();}
