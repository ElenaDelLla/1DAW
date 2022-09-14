package tallermecanico;

import java.util.Scanner;

public class TallerMecanico {

    public static int TAMAÑO = 10;
    public static Trabajo[] lista = new Trabajo[TAMAÑO];
    public static int numeroTrabajos = 0;

    public static int menuPrincipal() {
        Scanner sc = new Scanner(System.in);
        int opcion = 0;

        while (opcion < 1 || opcion > 7) {

            System.out.println("Indica la opcion que quieras: ");
            System.out.println("1. Añadir nuevo trabajo");
            System.out.println("2. Añadir horas");
            System.out.println("3. Añadir material");
            System.out.println("4. Finalizar trabajo");
            System.out.println("5. Eliminar trabajo");
            System.out.println("6. Listar trabajos");
            System.out.println("7. Salir");
            opcion = sc.nextInt();
        }

        return opcion;
    }

    public static int menuTrabajo() {
        Scanner sc = new Scanner(System.in);

        int opcion = 0;

        while (opcion < 1 || opcion > 3) {

            System.out.println("Indica que quieres añadir");
            System.out.println("1. Revision");
            System.out.println("2. Reparacion mecánica");
            System.out.println("3. Reparacion de chapa y pintura");

        }
        return opcion;
    }

    public static void añadirTrabajo() {
        Scanner sc = new Scanner(System.in);
        int opcion = menuTrabajo();

        if (numeroTrabajos == TAMAÑO) {

            System.out.println("La lista de trabajos esta llena");

        } else {

            System.out.println("Descipcion: ");
            String descripcion = sc.nextLine();

            sc.nextLine();

            Trabajo t = null;

            switch (opcion) {

                case 1:
                    t = new Revision(descripcion);
                    break;

                case 2:
                    t = new RMecanica(descripcion);
                    break;
                case 3:
                    t = new RChapaYPintura(descripcion);
                    break;
            }
            boolean insetado = false;

            for (int i = 0; i < lista.length && !insetado; i++) {

                if (lista[i] == null) {

                    lista[i] = t;
                    numeroTrabajos++;
                    insetado = true;
                }
            }

        }

    }

    public static void añadirMaterial() {
        Scanner sc = new Scanner(System.in);

        System.out.println("Indica el id del trabajo  al que le quieres añadir el coste del material");
        String id = sc.nextLine();

        sc.nextLine();

        System.out.println("Indica el importe del materia");
        double precioMaterial = sc.nextDouble();

        for (int i = 0; i < lista.length; i++) {

            if (lista[i] != null && !(lista[i].finalizado) && lista[i] instanceof Reparacion && lista[i].getId().equals(id)) {

                ((Reparacion) lista[i]).usarMaterial(precioMaterial);
            }

        }

    }

    public static void añadirHoras() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica el id del trabajo al que le quieres añadir horas");
        String codigo = sc.nextLine();

        sc.nextLine();

        System.out.println("¿Cuantas horas quieres añadir?");
        int numeroHoras = sc.nextInt();

        for (int i = 0; i < lista.length; i++) {

            if (lista[i] != null && !(lista[i].finalizado) && lista[i].getId().equals(codigo)) {

                lista[i].incrementarHoras(numeroHoras);
            }
        }

    }

    public static void finalizarTrabajo() {
        Scanner sc = new Scanner(System.in);

        System.out.println("Introduce el id del trabajo que quieres finalizar");
        String id = sc.nextLine();

        for (int i = 0; i < lista.length; i++) {

            if (lista[i] != null && lista[i].getId().equals(id)) {

                lista[i].finalizarTrabajo();
            }
        }

    }

    public static void eliminarTrabajo() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica el id del trabajo que quieres eliminar");
        String id = sc.nextLine();

        for (int i = 0; i < lista.length; i++) {

            if (lista[i] != null && lista[i].getId().equals(id)) {

                lista[i] = null;
                numeroTrabajos--;

            }
        }

    }

    public static void listarTrabajos() {

        for (int i = 0; i < lista.length; i++) {

            if (lista[i] != null) {
                System.out.println(lista[i]);
            }
        }

    }

    public static void main(String[] args) {

        int opcion = menuPrincipal();

        while (opcion != 7) {

            switch (opcion) {
                case 1:
                    añadirTrabajo();
                    break;
                case 2:
                    añadirHoras();
                    break;
                case 3:
                    añadirMaterial();
                    break;
                case 4:
                    finalizarTrabajo();
                    break;
                case 5:
                    eliminarTrabajo();
                    break;
                case 6:
                    listarTrabajos();
                    break;

            }
            opcion = menuPrincipal();

        }
    }

}
