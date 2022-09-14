/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package decimos;

import java.util.Scanner;

/**
 *
 * @author G08
 */
public class Decimos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner sc = new Scanner(System.in);
        int numeroCasos = sc.nextInt();
        int numeroPares = 0;
        for (int i = 0; i < numeroCasos; i++) {
            int numDecimos = sc.nextInt();
            for (int j = 0; j < numDecimos; j++) {
                int decimo = sc.nextInt();
                if (decimo % 2 == 0) {
                    numeroPares++;
                }
            }
        }
        System.out.println("decimos posibles: " + numeroPares);

    }

}
