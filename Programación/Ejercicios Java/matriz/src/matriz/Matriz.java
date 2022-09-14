/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package matriz;

import java.util.Scanner;

/**
 *
 * @author G08
 */
public class Matriz {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        char[][] puntuaciones = new char[2][3];

        for (int i = 0; i < puntuaciones.length; i++) {
            for (int j = 0; j < puntuaciones[i].length; j++) {
                puntuaciones[i][j] = sc.next().charAt(0);
            }
        }
        for (int i = 0; i < puntuaciones[0].length; i++) {
            for (int j = 0; j < puntuaciones.length; j++) {
                System.out.println(puntuaciones[j][i]);
            }
        }
    }

}
