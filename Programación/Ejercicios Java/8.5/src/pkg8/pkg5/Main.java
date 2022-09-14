package pkg8.pkg5;
import java.util.Scanner;

public class Main {
    Scanner sc = new Scanner(System.in);
    public static FiguraGeometrica[] figuras = new FiguraGeometrica[20];
    
    public static  int menu(){
        System.out.println("Elige una opcion");
        int opcion=0;
        while(opcion > 1 || opcion <3 ){
        System.out.println("1. Añadir figura");
      
        System.out.println("2. Mostrar figura");
        
        System.out.println("3. Salir");
       opcion = sc.nextInt()
        
        }
       
    }
    public int menuFiguras(){
        int opcion=0;
        while(opcion > 1 || opcion <= 4){
            
            switch(opcion){
            
                
            }
        }
    }
    public static void main(String[] args) {

    }

}
