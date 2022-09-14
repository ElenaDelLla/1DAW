
package pkg11.pkg3;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Main {

    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica el nombre fichero de origen");
        String nombreFicherOrigen = sc. nextLine();
        System.out.println("Indica el nombre del fichero destino");
        String nombreFicheroDestino = sc.nextLine();
        
        BufferedReader ficheroLectura = null;
        BufferedWriter ficheroEscritura= null;
        
        try {
            ficheroLectura= new BufferedReader(new FileReader(nombreFicherOrigen));
            ficheroEscritura = new BufferedWriter(new FileWriter (nombreFicheroDestino));
            String linea = ficheroLectura.readLine();
            
            while (linea != null) {                
                ficheroEscritura.write(linea.toUpperCase());
                linea = ficheroLectura.readLine();
            }
            
        } catch (FileNotFoundException e) {
            System.out.println("Fichero no encontrado");
        }catch(IOException e){
            System.out.println("Error leyendo el fichero");
        
        }finally{
            try {
                if (ficheroLectura != null) {
                    ficheroLectura.close();
                }
                if (ficheroEscritura != null) {
                    ficheroEscritura.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero");
            }
        
        
        }
        
        
    }
    
}
