
package potencia;
import java.util. Scanner;

public class Potencia {
   
       
   public static double potencia (double base, int exponente){
   
   double resultado=1;
   int i;
       for( i=1; i<=exponente; i++){
           resultado= base*exponente;
       }
       return resultado;
   } 
 
    public static void main(String[] args) {
        Scanner sc = new Scanner (System.in);
        
        System.out.println("Introduce la base");
        double base = sc.nextDouble();
        System.out.println("Introduce el exponente");
        int exp= sc.nextInt();
        
        double resultado = potencia(base,exp); 
        System.out.println("El resultado de la potencia de "+base+ " elevado a "+exp+ " es " +resultado);
        
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
}
