package inmobiiliaria;

import java.util.Scanner;

public class Inmobiliaria {

    public static final int TAMANIO = 20;
    public static Propiedad[] lista = new Propiedad[TAMANIO];
    public static int numeroPropiedades = 0;

    public static int menu() {
        Scanner sc = new Scanner(System.in);
        int opcion = 0;

        while (opcion < 1 && opcion > 5) {

            System.out.println("¿Qué quieres hacer?");
            System.out.println("1. Añadir propiedad");
            System.out.println("2. Eliminar propiedad");
            System.out.println("3. Listar todas");
            System.out.println("4. Listar alquileres");
            System.out.println("5. Salir");
            opcion = sc.nextInt();
        }
        return opcion;
    }

    public static int menuPropiedad() {
        Scanner sc = new Scanner(System.in);

        int opcion = 0;

        while (opcion < 1 && opcion > 4) {

            System.out.println("Indica la propiedad");
            System.out.println("1. Local comercial");
            System.out.println("2. Piso");
            System.out.println("3. Adosado");
            System.out.println("4. Independiente");
            opcion = sc.nextInt();
        }
        return opcion;
    }

    public static void añadirPropiedad() {
        Scanner sc = new Scanner(System.in);
        if (TAMANIO == numeroPropiedades) {
            System.out.println("Se ha alcanzado el maximo de propiedades");
        } else {
            int opcion = menuPropiedad();
            Propiedad p = null;
            System.out.println("Direccion: ");
            String direccion = sc.nextLine();

            System.out.println("Código postal: ");
            String cp = sc.nextLine();

            sc.nextLine();

            System.out.println("Precio Base: ");
            double precioBase = sc.nextDouble();

            System.out.println("Tamaño: ");
            double tamanio = sc.nextDouble();

            // creamos objeto que corresponda
            switch (opcion) {
                case 1:
                    p = new Local(direccion, cp, precioBase, tamanio);
                    break;
                case 2:
                    System.out.println("Letra: ");
                    char letra = sc.nextLine().charAt(0);
                    sc.nextLine();
                    System.out.println("Altura: ");
                    int altura = sc.nextInt();
                    p = new Piso(altura, letra, direccion, cp, precioBase, tamanio);
                    break;
                case 3:
                    System.out.println("Numero planta:");
                    int numeroPlanta = sc.nextInt();

                    System.out.println("Metros cuadrados: ");
                    double metrosCuadrados = sc.nextDouble();
                    p = new Adosado(numeroPlanta, metrosCuadrados, direccion, cp, precioBase, tamanio);
                    break;
                case 4:
                    System.out.println("Numero planta:");
                    int numeroPlanta2 = sc.nextInt();

                    System.out.println("Metros cuadrados: ");
                    double metrosCuadrados2 = sc.nextDouble();
                    p = new Independiente(numeroPlanta2, metrosCuadrados2, direccion, cp, precioBase, tamanio);

            }
            boolean insertado = false;
            for (int i = 0; i < lista.length && !insertado; i++) {

                if (lista[i] == null) {
                    lista[i] = p;
                    numeroPropiedades++;
                    insertado = true;
                }
            }
        }

    }

    public static void eliminarPropiedad() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica el codigo de la propiedad que quieres eliminar");
        String eliminar = sc.nextLine();

        for (int i = 0; i < lista.length; i++) {

            if (lista[i].getIdentificador().getCodigo().equals(eliminar)) {

                lista[i] = null;
                numeroPropiedades--;
            }
        }

    }

    public static void listarTodas() {

        for (int i = 0; i < lista.length; i++) {

            if (lista[i] != null) {

                System.out.println(lista[i].toString());
            }
        }
    }

    public static void listarAlquileres() {

        for (int i = 0; i < lista.length; i++) {

            if (lista[i] != null && lista[i] instanceof Local) {

                System.out.println(lista[i].toString());
            }
        }
    }

    public static void main(String[] args) {

        int opcion = menu();

        while (opcion != 5) {
            switch (opcion) {
                case 1:
                    añadirPropiedad();
                    break;
                case 2:
                    eliminarPropiedad();
                    break;
                case 3:
                    listarTodas();
                    break;
                case 4:
                    listarAlquileres();
                    break;

            }
            opcion = menu();

        }

    }

}
