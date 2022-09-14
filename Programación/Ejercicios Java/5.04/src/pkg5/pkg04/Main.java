
package pkg5.pkg04;

import java.util.Scanner;

public class Main {

    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        float alturas[]=new float[5];
        
        for(int i=0;i<alturas.length;i++){
        System.out.println("Introduce la altura de la persona "+(i+1));
        alturas[i]=sc.nextFloat();
        }
        Alturas a = new Alturas();
        a.cargar();
        System.out.println("La media de las alturas es "+a.calcularPromedio());
        System.out.println("El número de personas que superan la media son "+a.mayoresPromedio());
        System.out.println("El número de personas que no superan la media son "+a.menoresPromedio());
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
}
