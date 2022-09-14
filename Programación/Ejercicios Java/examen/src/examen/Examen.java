package examen;

import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class Examen {

    private static final String NOMBRE_FICHERO = "peluditos.dat";
    private static ArrayList<Animal> animales;

    private static void menu() {

        String[] opciones = {"Añadir animal", "Mostrar todos los animales",
            "Mostrar listado de perros sin reserva", "Mostrar listado de gatos sin reserva", "Reservar",
            "Anular reserva", "Adoptar", "Salir"};
        int opcion = Util.menu(opciones);
        while (opcion != 8) {
            switch (opcion) {
                case 1:
                    anyadirAnimal();
                    break;
                case 2:
                    mostrarTodos();
                    break;
                case 3:
                    mostrarPerrosSinReserva();
                    break;
                case 4:
                    mostrarGatosSinReserva();
                    break;
                case 5:
                    reservar();
                    break;
                case 6:
                    anularReserva();
                    break;
                case 7:
                    adoptar();
                    break;
            }
            opcion = Util.menu(opciones);
        }

        if (opcion == 8) {
            salir();
        }
    }

    private static void anyadirAnimal() {
        Scanner sc = new Scanner(System.in);
        System.out.println("¿Qué deseas añadir?\n1. Perro\n2. Gato");
        int opcion = Util.leerInt();
        while (opcion != 1 && opcion != 2) {
            opcion = Util.leerInt();
        }
        System.out.println("Indique el nombre:");
        String nombre = sc.nextLine();
        System.out.println("Indique su edad:");
        int edad = Util.leerInt();
        if (opcion == 1) {
            Animal a = new Perro(nombre, edad);
            animales.add(a);
        } else {
            Animal a = new Gato(nombre, edad);
            animales.add(a);
        }
        System.out.println("Animal añadido");
    }

    private static void generarFichero(ArrayList<Animal> animales, String nombreFichero) {
        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(new FileWriter(nombreFichero));
            Iterator<Animal> it = animales.iterator();
            while (it.hasNext()) {
                Animal animal = it.next();
                bw.write(animal.toString());
                bw.newLine();
            }

        } catch (IOException e) {
            System.out.println("Error escribiendo el fichero de animales");
        } finally {
            try {
                if (bw != null) {
                    bw.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero de animales");
            }
        }
    }

    private static void mostrarTodos() {

        System.out.println("¿Desea verlo por pantalla o generar un fichero?\n1. Pantalla\n2. Fichero");
        int opcion = Util.leerInt();
        while (opcion != 1 && opcion != 2) {
            opcion = Util.leerInt();
        }
        Iterator<Animal> it = animales.iterator();
        if (opcion == 1) {
            while (it.hasNext()) {
                Animal animal = it.next();
                System.out.println(animal);
            }
        } else {
            System.out.println("Indique el nombre del fichero:");
            Scanner sc = new Scanner(System.in);
            String nombreFichero = sc.nextLine();
            generarFichero(animales, nombreFichero);
        }
    }

    private static void mostrarPerrosSinReserva() {
        Iterator<Animal> it = animales.iterator();
        while (it.hasNext()) {
            Animal animal = it.next();
            if (animal instanceof Perro && !animal.isReservado()) {
                System.out.println(animal);
            }
        }
    }

    private static void mostrarGatosSinReserva() {
        Iterator<Animal> it = animales.iterator();
        while (it.hasNext()) {
            Animal animal = it.next();
            if (animal instanceof Gato && !animal.isReservado()) {
                System.out.println(animal);
            }
        }
    }

    private static void reservar() {
        System.out.println("Indique su numero de identificación:");
        int identificador = Util.leerInt();
        Iterator<Animal> it = animales.iterator();
        while (it.hasNext()) {
            Animal animal = it.next();
            if (animal.getIdentificador() == identificador) {
                animal.reservar();
                System.out.println("Animal reservado");
            }
        }
    }

    private static void anularReserva() {
        System.out.println("Indique su numero de identificación:");
        int identificador = Util.leerInt();
        Iterator<Animal> it = animales.iterator();
        while (it.hasNext()) {
            Animal animal = it.next();
            if (animal.getIdentificador() == identificador) {
                animal.cancelarReserva();
                System.out.println("Reserva anulada");
            }
        }
    }

    private static void adoptar() {
        System.out.println("Indique su numero de identificación:");
        int identificador = Util.leerInt();
        Iterator<Animal> it = animales.iterator();
        boolean encontrado = false;
        while (it.hasNext() && !encontrado) {
            Animal animal = it.next();
            if (animal.getIdentificador() == identificador) {
                if (animal.isReservado()) {
                    animales.remove(animal);
                    System.out.println("Animal adoptado");
                } else {
                    System.out.println("El animal no estaba reservado");
                }
                encontrado = true;
            }
        }
        if (!encontrado) {
            System.out.println("El animal no existe");
        }
    }

    private static void salir() {
        ObjectOutputStream escribirFichero = null;

        try {
            escribirFichero = new ObjectOutputStream(new FileOutputStream(NOMBRE_FICHERO));
            escribirFichero.writeObject(animales);
        } catch (FileNotFoundException e) {
            System.out.println("No se ha encontrado el fichero de animales");
        } catch (IOException e) {
            System.out.println("Error escribiendo el fichero de animales");
        } finally {
            try {
                if (escribirFichero != null) {
                    escribirFichero.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero de animales");
            }
        }
    }

    private static void iniciar() {
        ObjectInputStream leerFichero = null;
        boolean existe = false;
        try {
            leerFichero = new ObjectInputStream(new FileInputStream(NOMBRE_FICHERO));
            animales = (ArrayList<Animal>) leerFichero.readObject();
            existe = true;
        } catch (ClassNotFoundException e) {
            System.out.println("El contenido del fichero de animales no es válido");
        } catch (FileNotFoundException e) {
            System.out.println("El fichero de animales no existe");
        } catch (IOException e) {
            System.out.println("Error leyendo el fichero de animales");
        } catch (Exception e) {
            System.out.println("Error transformando el objeto en el fichero de animales");
        } finally {
            try {
                if (leerFichero != null) {
                    leerFichero.close();
                }

            } catch (IOException e) {
                System.out.println("Error cerrando el fichero de animales");
            }
        }
        if (!existe) {
            animales = new ArrayList<Animal>();
        }

    }

    public static void main(String[] args) {
        iniciar();
        menu();
    }

}
