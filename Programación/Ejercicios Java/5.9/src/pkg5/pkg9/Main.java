package pkg5.pkg9;

import java.util.Scanner;

public class Main {

    public static int[] burbuja(int[] lista) {

        for (int i = 1; i < lista.length; i++) {
            for (int j = 0; j < lista.length - i; j++) {
                if (lista[j] > lista[j + 1]) {
                    int a = lista[j];
                    lista[j] = lista[j + 1];
                    lista[j + 1] = a;

                }
            }

        }
        return lista;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int tamaño = 10;
        int[] lista = new int[tamaño];

        for (int i = 0; i < lista.length; i++) {
            System.out.println("Introduce el número para la posición " + (i + 1));
            lista[i] = sc.nextInt();
        }
        burbuja(lista);
        for (int i = 0; i < lista.length; i++) {
            System.out.println(lista[i]);
        }
        /*
        int[] lista2 = {4,3,2,1};
        burbuja(lista2);
        for (int i = 0; i < lista2.length; i++) {
            System.out.println(lista2[i]);
        }
        int[] lista3 = {3,2,1,4};
        burbuja(lista3);
        for (int i = 0; i < lista3.length; i++) {
            System.out.println(lista3[i]);
        }*/
    }

}
