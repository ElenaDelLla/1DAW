package pkg11.pkg2;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica el nombre del fichero");
        String nombre_fichero = sc.nextLine();

        File fichero = new File(nombre_fichero);
        if (!fichero.exists()) {
            System.out.println("El fichero indicado no existe");
        } else {

            BufferedReader leerFichero = null;
            try {
                leerFichero = new BufferedReader(new FileReader(fichero));
                String linea = leerFichero.readLine();
                while (linea != null) {
                    System.out.println(linea);
                    linea = leerFichero.readLine();

                }
            } catch (IOException e) {
                System.out.println("Error leyendo el fichero");
            } finally {
                try {
                    if (leerFichero != null) {
                        leerFichero.close();
                    }
                } catch (IOException e) {
                    System.out.println("Error cerrando el fichero");
                }

            }
        }
    }
}
