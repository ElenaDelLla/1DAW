package tre34;

import java.util.Scanner;

public class Tre34 {

    public static boolean esPar(int numero) {
        if (numero % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("Introduce un número");
        int nume = sc.nextInt();

        while (nume > 0) {

            if (esPar(nume) == true) {
                System.out.println("el numero " + nume + " es par");

            } else if (esPar(nume) == false) {
                System.out.println("El número " + nume + " es impar");
            }
            System.out.println("Intorduce otro número");
            nume = sc.nextInt();
        }

        System.out.println("Fin del programa");

    }

}
