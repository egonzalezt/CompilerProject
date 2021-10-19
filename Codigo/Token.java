package com.company;

public class Token {
    public String id;
    public String contenido;
    public int fila;
    public int columna;

    public Token(String id, String contenido, int fila, int columna) {
        this.id = id;
        this.contenido = contenido;
        this.fila = fila;
        this.columna = columna;
    }

    @Override
    public String toString() {
        return "Token{" + "id->'" + id + ", contenido->'" + contenido + ", fila->" + fila + ", columna->" + columna + '}' + "\n";
    }

}