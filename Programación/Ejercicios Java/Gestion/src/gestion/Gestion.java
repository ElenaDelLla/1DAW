package gestion;

import java.util.Scanner;

public class Gestion {

    public static int CUPO = 20;
    public static Empleado[] lista = new Empleado[CUPO];
    public static int numeroEmpleados = 0;

    public static int menu() {
        Scanner sc = new Scanner(System.in);

        int opcion = 0;
        while (opcion < 1 || opcion > 6) {

            System.out.println("Indica que quieres hacer");
            System.out.println("1. Contratar");
            System.out.println("2. Despedir");
            System.out.println("3. Listar");
            System.out.println("4. Llamar");
            System.out.println("5. Estadísticas");
            System.out.println("6. Salir");
            opcion = sc.nextInt();
        }
        return opcion;
    }

    public static int menuEmpleado() {
        Scanner sc = new Scanner(System.in);

        int opcion = 0;

        while (opcion < 1 || opcion > 4) {
            System.out.println("Indica a quien quieres contratar");
            System.out.println("1. Cocinero");
            System.out.println("2. Encargado");
            System.out.println("3. Camarero Fijo");
            System.out.println("Camarero Eventual");
            opcion = sc.nextInt();

        }
        return opcion;
    }

    public static void contratar() {
        Scanner sc = new Scanner(System.in);
        int opcion = menuEmpleado();

        if (numeroEmpleados == CUPO) {
            System.out.println("La lista de empleados esta llena");

        } else {

            System.out.println("Nombre: ");
            String nombre = sc.nextLine();
            sc.nextLine();
            System.out.println("Años de experiencia: ");
            int aniosExperiencia = sc.nextInt();

            System.out.println("Año de ingreso en la empresa");
            int anioIngreso = sc.nextInt();

            Empleado e = null;

            switch (opcion) {

                case 1:
                    e = new Cocinero(nombre, aniosExperiencia, anioIngreso);
                    break;
                case 2:
                    e = new Encargado(nombre, aniosExperiencia, anioIngreso);
                    break;
                case 3:
                    e = new Fijo(nombre, aniosExperiencia, anioIngreso);
                case 4:
                    System.out.println("Teléfono: ");
                    int telefono = sc.nextInt();
                    e = new Eventual(telefono, nombre, aniosExperiencia, anioIngreso);
                    break;
            }
            boolean insertado = false;

            for (int i = 0; i < lista.length; i++) {

                if (lista[i] == null) {

                    lista[i] = e;
                    insertado = true;
                    numeroEmpleados++;

                }
            }
        }

    }

    public static void despedir() {
        Scanner sc = new Scanner(System.in);

        System.out.println("Indica el codigo del empleado que quieres despedir");
        String codigo = sc.nextLine();

        for (int i = 0; i < lista.length; i++) {

            if (lista[i] != null && lista[i].getCodigoEmpleado().equals(codigo)) {
                lista[i] = null;
                numeroEmpleados--;
            }
        }
    }

    public static void listar() {

        for (int i = 0; i < lista.length; i++) {

            if (lista[i] != null) {
                System.out.println(lista[i]);
            }
        }

    }

    public static void llamar() {
        Scanner sc = new Scanner(System.in);
        System.out.println("¿A quien quieres llamar? Indica su código de empleado");

        String codigo = sc.nextLine();
        boolean encontrado = false;

        for (int i = 0; i < lista.length && !encontrado; i++) {

            if (lista[i] != null && lista[i] instanceof Eventual && lista[i].getCodigoEmpleado().equals(codigo)) {

                ((Eventual) lista[i]).llamar();

            } else if (lista[i] != null && lista[i].getCodigoEmpleado().equals(codigo) && lista[i] instanceof Fijo) {

                System.out.println("El camarero no es eventual");
            }
        }
        if (!encontrado) {
            System.out.println("El camareno con el codigo de empleado " + codigo + " no existe");
        }

    }

    public static void estadisticas() {

        int numeroEncargado = 0;

        int numeroCocinero = 0;

        int numeroCFijo = 0;

        int numeroCEventual = 0;

        int contador = 0;

        for (int i = 0; i < lista.length; i++) {

            if (lista[i] != null && lista[i] instanceof Encargado) {

                contador++;
                numeroEncargado++;

            } else if (lista[i] != null && lista[i] instanceof Cocinero) {
                contador++;
                numeroCocinero++;
            } else if (lista[i] != null && lista[i] instanceof Fijo) {

                contador++;
                numeroCFijo++;
            } else if (lista[i] != null && lista[i] instanceof Eventual) {

                contador++;
                numeroCEventual++;
            }

        }
        System.out.println("El numero de empleados contratados en " + contador);
        if (contador != 0) {
            System.out.println("Encargados: " + numeroEncargado / contador);
            System.out.println("Cocinero: " + numeroCocinero / contador);
            System.out.println("Camarero Fijo: " + numeroCFijo / contador);
            System.out.println("Camarero Eventual: " + numeroCEventual / contador);
        }
    }

    public static int contarLetras(String cadena, char letra) {

        int contadorBucle = 0;
        int numLetras = 0;
        int longitud = 0;
        longitud = cadena.length();
        if (longitud > 0) {
            do {
                if (cadena.charAt(contadorBucle) == letra) {
                    numLetras++;
                }
            } while (contadorBucle < longitud);
        }
        return numLetras;
    }

}
