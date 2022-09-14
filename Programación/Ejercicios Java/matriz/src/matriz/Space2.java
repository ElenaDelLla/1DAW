/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package matriz;

import java.util.Scanner;

public class Space2 {

    public static Scanner sc = new Scanner(System.in);

    public static void casoPrueba() {

        int filas = sc.nextInt();
        // leo los datos por teclado por filas de tipo char
        sc.nextLine();
        char[][] puntuaciones = new char[filas][3];

        for (int i = 0; i < puntuaciones.length; i++) {
            String linea = sc.nextLine();
            puntuaciones[i][0] = linea.charAt(0);
            puntuaciones[i][1] = linea.charAt(1);
            puntuaciones[i][2] = linea.charAt(2);

        }
        // muestro los datos por columnas sin saltos de linea

        for (int j = 0; j < 3; j++) {
            for (int i = 0; i < puntuaciones.length; i++) {
                System.out.print(puntuaciones[i][j]);
            }
        }
    }

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();
        for (int i = 0; i < n; i++) {
            casoPrueba();
        }
    }

}
