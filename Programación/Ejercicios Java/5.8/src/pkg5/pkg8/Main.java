package pkg5.pkg8;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int tamaño = 5;
        int[] lista = new int[tamaño];

        for (int i = 0; i < lista.length; i++) {
            System.out.println("Introduce el número para la posición " + (i + 1));
            lista[i] = sc.nextInt();
        }
        System.out.println("Introduce un número");
        int numero = sc.nextInt();
        boolean encontrado = false;
        for (int i = 0; i < lista.length && !encontrado; i++) {

            if (lista[i] == numero) {
                System.out.println("se encuentra en posicion: " + i);
                encontrado = true;
            }

        }
        if (!encontrado) {
            System.out.println("El número no se encuentra en la lista");
        }
    }

}
