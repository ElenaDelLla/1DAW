package space;

import java.util.Scanner;

public class Space {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int numCasos = sc.nextInt();

        for (int i = 0; i < numCasos; i++) {
            int numPuntuaciones = sc.nextInt();
            sc.nextLine();
            char[][] puntuaciones = new char[numPuntuaciones][3];
            for (int j = 0; j < numPuntuaciones; j++) {
                String nombre = sc.nextLine();
                puntuaciones[j][0] = nombre.charAt(0);
                puntuaciones[j][1] = nombre.charAt(1);
                puntuaciones[j][2] = nombre.charAt(2);
            }
            for (int k = 0; k < 3; k++) {
                for (int l = 0; l < numPuntuaciones; l++) {
                    System.out.print(puntuaciones[l][k]);
                }
            }
        }
    }
}
