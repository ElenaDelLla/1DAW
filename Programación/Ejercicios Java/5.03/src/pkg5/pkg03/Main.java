
package pkg5.pkg03;

import java.util.Scanner;

public class Main {

    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introduce el número de alumnos");
        int alumnos= sc.nextInt();
        double media=0;
        double suma=0;
        
        
        double lista[]= new double[alumnos];
        
        for(int i=0; i<lista.length;i++){
            System.out.println("Introduce la nota del alumno "+(i+1));
            lista[i]=sc.nextDouble();
        }
        for(int i=0; i<lista.length;i++){
            suma=suma+lista[i];
            
        }
        media=suma/lista.length;
        for(int i=0; i<lista.length;i++){
            if(lista[i]>media){
                System.out.println("El alumno "+(i+1)+" tiene la nota superior a la media");
                
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
}
