
package pkg11.pkg14;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class Main {

  
    public static void main(String[] args) {
       
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica el nombre del fichero");
        String nombreFichero = sc.nextLine();
        System.out.println("Indica la palabra que quieres buscar en el fichero");
        String palabra = sc.nextLine();
        
        while (palabra.contains(" ")) {            
            System.out.println("La palabra no debe contener espacios en blanco");
            palabra = sc.nextLine();
        }
        BufferedReader ficheroLectura = null;
        try {
            ficheroLectura = new BufferedReader(new FileReader(nombreFichero));
            String linea = ficheroLectura.readLine();
            
            while (linea != null) {                
                
                if (linea.contains(palabra)) {
                    System.out.println(linea);
                }
                linea = ficheroLectura.readLine();
            }
        } catch (FileNotFoundException e) {
            System.out.println("No se encuentra el fichero");
        }catch(IOException e){
        
            System.out.println("Error leyendo el fichero");
        }finally{
        
            try {
                if (ficheroLectura != null) {
                    ficheroLectura.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero");
            }
        
        }
    }
    
}
