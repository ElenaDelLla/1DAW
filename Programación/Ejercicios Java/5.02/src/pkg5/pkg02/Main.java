package pkg5.pkg02;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        final int tamano = 10;
        int contadorPO=0;
        int contadorNE=0;
        int contadorCERO=0;
        
        int[] lista = new int[tamano];

        for (int i = 0; i < lista.length; i++) {
            System.out.println("Introduce 10 números");
            lista[i] = sc.nextInt();
            if(lista[i]>0){
                contadorPO++;
            }
            if(lista[i]<0){
                contadorNE++;
            }
            if(lista[i]==0){
                contadorCERO++;
            }
            
        }
        System.out.println("El número de positivos es "+contadorPO);
        System.out.println("El número de negativos es "+contadorNE);
        System.out.println("El número de ceros es "+contadorCERO);
    }

}
