package pkg5.pkg01;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        final int numeros = 10;

        int sumapos = 0;
        int sumaneg = 0;
        int mediapos = 0;
        int medianeg = 0;
        int contadorposi = 0;
        int contadornega = 0;
        int lista[] = new int[numeros];

        for (int i = 0; i < lista.length; i++) {
            System.out.println("Introduce 10  números");
            lista[i] = sc.nextInt();

            if (lista[i] > 0) {
                sumapos = sumapos +lista[i];
                contadorposi++;
            } else {
                sumaneg = sumaneg + lista[i];
                contadornega++;
            }
           
        }
        System.out.println("la suma de los valores positivos es " + sumapos);
        
        System.out.println("La suma de los valores negativos es " + sumaneg);
        
        if(contadorposi>0){
            mediapos=sumapos/contadorposi;
            System.out.println("La media de los valores positivos es " + mediapos);
        }else{
            medianeg=medianeg/contadornega;
            System.out.println("La media de los valores negativos es " + medianeg);
        }
        
       
        
        
    }

}
