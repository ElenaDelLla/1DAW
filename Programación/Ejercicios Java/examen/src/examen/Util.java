package examen;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Util {

    public static int leerInt() {

        Scanner sc = new Scanner(System.in);
        while (true) {
            try {
                return sc.nextInt();
            } catch (InputMismatchException e) {
                System.out.println("El valor introducido no es válido, vuelve a intentarlo");
                sc.nextLine();
            }
        }

    }

    public static int menu(String[] lista) {
        int opcion = 0;

        while (opcion < 1 || opcion > lista.length) {
            for (int i = 0; i < lista.length; i++) {
                System.out.println((i + 1) + ". " + lista[i]);
            }
            opcion = Util.leerInt();
        }

        return opcion;
    }
}
