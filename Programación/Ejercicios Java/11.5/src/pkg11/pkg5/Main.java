package pkg11.pkg5;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {

    public static String ruta = "Ficheros/ejercicios";
    public static String fichero = ruta + "Ejercicios.text";

    public static void inicio() {

        File fichero = new File(ruta);

        if (!fichero.exists()) {
            if (!fichero.mkdirs()) {
                System.out.println("No se ha podido encontar el fichero ni la ruta indicada");
            }
        }
    }

    public static int menu() {
        Scanner sc = new Scanner(System.in);
        int opcion = 0;

        while (opcion < 1 || opcion > 3) {

            try {
                System.out.println("1. Crear fichero");
                System.out.println("2. Mostrar el contenido del fichero");
                System.out.println("3. Salir");
                opcion = sc.nextInt();

            } catch (InputMismatchException e) {
                System.out.println("El valor introducido no es correcto, cuelve a intentarlo");
                sc.nextInt();
            }

        }
        return opcion;
    }

    public static void crearFichero() {
        Scanner sc = new Scanner(System.in);
        BufferedWriter ficheroEscritura = null;

        try {
            ficheroEscritura = new BufferedWriter(new FileWriter(fichero));
            System.out.println("Nombre: ");
            ficheroEscritura.write(sc.nextLine() + "\n");
            System.out.println("Apellidos: ");
            ficheroEscritura.write(sc.nextLine() + "\n");
            System.out.println("Ciudad de nacimiento: ");
            ficheroEscritura.write(sc.nextLine() + "\n");

        } catch (IOException e) {
            System.out.println("Error escribiendo el fichero");
        } finally {
            try {
                if (ficheroEscritura != null) {
                    ficheroEscritura.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero");
            }
        }

    }

    public static void mostarFichero() {

        BufferedReader ficheroLectura = null;

        try {
            ficheroLectura = new BufferedReader(new FileReader(fichero));
            String linea = ficheroLectura.readLine();
            if (linea != null) {
                System.out.println(linea);
                linea = ficheroLectura.readLine();
            }
        } catch (FileNotFoundException e) {
            System.out.println("No se ha podido encontrar el fichero");
        } catch (IOException e) {
            System.out.println("Error leyendo el fichero");
        } finally {
            try {
                if (ficheroLectura != null) {
                    ficheroLectura.close();
                }

            } catch (IOException e) {
                System.out.println("Error cerrando el fichero");
            }

        }

    }

    public static void main(String[] args) {

        inicio();

        int opcion = menu();

        while (opcion != 3) {

            switch (opcion) {

                case 1:
                    crearFichero();
                    break;
                case 2:
                    mostarFichero();
                    break;

            }
            opcion = menu();
        }
    }

}
