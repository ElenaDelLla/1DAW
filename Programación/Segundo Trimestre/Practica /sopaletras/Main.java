/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sopaletras;

import java.util.Arrays;

/**
 *
 * @author G08
 */
public class Main {

    public static void main(String[] args) {

        char[][] sopa = {{'M', 'R', 'T', 'I', 'U', 'A', 'U'}, {'C', 'E', 'F', 'G', 'S', 'H', 'J'}, {'A', 'A', 'S', 'A', 'V', 'J', 'J'}, {'S', 'S', 'C', 'A', 'X', 'S', 'K'}, {'C', 'E', 'R', 'O', 'M', 'E', 'L'}};
        String[] palabras = {"CASA", "MESA"};

        SopaLetras sopita = new SopaLetras(5, 7, 2);

        sopita.cargar(sopa, palabras);

        System.out.println(Arrays.toString(sopita.buscar(palabras[0])));
        System.out.println(Arrays.toString(sopita.buscar(palabras[1])));
        sopita.mostrar(sopita.resolver());

    }
}
