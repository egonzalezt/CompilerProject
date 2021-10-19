package com.company;

import java.io.FileReader;

public class Main {

    public static void main (String[] args) {
        // TODO code application logic here
        try{

            String ruta="C:\\Users\\esteb\\Google Drive\\Universidad\\Semestre 4\\Compiladores\\Protecto2.0\\src\\com\\company\\fuente.txt";

            lexer lex = new lexer(new FileReader(ruta));

            parser p = new parser(lex);

            p.parse();

            if(lex.errlex.isEmpty() && p.errsin.length()==0)
            {
                System.out.println("Compilacion correcta :)");
                System.out.println(lex.ts.toString());
            }
            else
            {
                System.err.println("Compilacion incorrecta F");
                System.err.println(lex.errlex);
                System.err.println(p.errsin);
            }

        }
        catch(Exception e){

            System.err.println(e.getMessage());
        }
    }
}
