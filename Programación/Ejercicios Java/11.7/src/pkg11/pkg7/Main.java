package pkg11.pkg7;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Main {

    public static String ficheroOrigen = "";
    public static String ficheroDestino = "";

    public static int contarPalabrasEnLinea(String letra) {

        if (letra.length() == 0) {
            return 0;
        } else {
            int espacio = letra.indexOf(" ");
            if (espacio == -1) {
                return 1;
            } else {

                return 1 + contarPalabrasEnLinea(letra.substring(espacio + 1));
            }

        }

    }
    public static int contarPalabras(String fila){
    
        int contador = 0;
        BufferedReader ficheroLectura = null;
        
        try {
            ficheroLectura = new BufferedReader(new FileReader(fila));
            String linea = ficheroLectura.readLine();
            while (linea != null) {                
                contador += contarPalabrasEnLinea(linea);
                linea =  ficheroLectura.readLine();
            }
        } catch (FileNotFoundException e) {
            System.out.println("No se ha encontrado el fichero");
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
                
         return contador;
    }
    public static void leerRedaccion(){
    
        BufferedReader ficheroLectura = null;
        BufferedWriter ficheroEscritura = null;
        
        try {
            ficheroLectura = new BufferedReader(new FileReader(ficheroOrigen));
            ficheroEscritura = new BufferedWriter(new FileWriter(ficheroDestino));
            ficheroEscritura.write("Nombre\t Palabras\t Correcto\n\n");
            String linea = ficheroLectura.readLine();
            
                while (ficheroLectura != null) {                
                
                String redaccion = ficheroLectura.readLine();
                int numeroPalabras = contarPalabras(linea);
                
                    if (numeroPalabras >= 100 && numeroPalabras <= 200 ) {
                        
                        ficheroEscritura.write(nombre +"\t"+palabras+"\t"+ Correcto: SI);
                        
                    }
            }
            
        } catch (Exception e) {
        }
    
    
    
    
    }
    

    public static void main(String[] args) {

    }

}
