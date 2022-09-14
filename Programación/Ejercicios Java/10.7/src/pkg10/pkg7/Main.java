package pkg10.pkg7;

import java.util.Scanner;

public class Main {

    private static int menu() {
        Scanner sc = new Scanner(System.in);
        int opcion = 0;

        while (opcion < 1 && opcion > 4) {
            try {
                System.out.println("¿Qué quieres hacer?");
                System.out.println("1. Vender coche");
                System.out.println("2. Nuevo coche");
                System.out.println("3. Mostrar coche");
                System.out.println("4. Salir");
                opcion = sc.nextInt();
            } catch (Exception e) {
                System.out.println("Opción inválida");
                sc.nextLine();
            }

        }
        return opcion;
    }

    public static int menuMostrado() {
        Scanner sc = new Scanner(System.in);

        int opcion = 0;

        while (opcion < 1 && opcion > 5) {
            try {
                System.out.println("Indica qué tipo de mostrado quieres realizar");
                System.out.println("1. Mostrar todo");
                System.out.println("2. Mostrar por marca");
                System.out.println("3. Mostrar por marca y modelo");
                System.out.println("4. Mostrar por kilometraje");
                System.out.println("5. Mostrar por precio");
                opcion = sc.nextInt();
            } catch (Exception e) {
                System.out.println("Opción inválida");
                sc.nextLine();
            }
        }
        return opcion;
    }

    public static void venta(Concesionario conce) {
        Scanner sc = new Scanner(System.in);
        try {
            System.out.println("Introduce la matricula del coche que desea vender");
            String matricula = sc.nextLine();
            conce.venderCoche(matricula);
        } catch (Exception e) {
            System.out.println("Dato de matricula introducida no válida");
            sc.nextLine();
        }
    }

    public static void nuevo(Concesionario conce) {
        Scanner sc = new Scanner(System.in);
        try {
            System.out.println("Datos del nuevo vehiculo:");
            System.out.println("Introduce la matricula");
            String matricula = sc.nextLine();
            System.out.println("Introduce la marca");
            String marca = sc.nextLine();
            System.out.println("Introduce el modelo");
            String modelo = sc.nextLine();
            System.out.println("Introduce el kilometraje");
            double km = sc.nextDouble();
            System.out.println("Introduce el precio");
            double precio = sc.nextDouble();
            conce.nuevoCoche(matricula, marca, modelo, km, precio);
        } catch (Exception e) {
            System.out.println("Datos introducidos no válidos");
            sc.nextLine();
        }
    }

    public static void mostrar(Concesionario conce) {
        int opcion = menuMostrado();
        Scanner sc = new Scanner(System.in);

        try {
            switch (opcion) {
                case 1:
                    conce.mostrar();
                    break;
                case 2: {
                    System.out.println("Introduce la marca a mostrar");
                    String marca = sc.nextLine();
                    conce.mostrar(marca);
                    break;
                }
                case 3: {
                    System.out.println("Introduce la marca a mostrar");
                    String marca = sc.nextLine();
                    System.out.println("Introduce el modelo a mostrar");
                    String modelo = sc.nextLine();
                    conce.mostrar(marca, modelo);
                    break;
                }
                case 4: {
                    System.out.println("Introduce el kilometraje minimo");
                    Double km = sc.nextDouble();
                    conce.mostrar(km);
                    break;
                }
                case 5: {
                    System.out.println("Introduce el precio minimo");
                    Double minimo = sc.nextDouble();
                    System.out.println("Introduce el precio maximo");
                    Double maximo = sc.nextDouble();
                    conce.mostrar(minimo, maximo);
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("Datos introducidos no válidos");
            sc.nextLine();
        }

    }

    public static void main(String[] args) {
        Concesionario multimarca = new Concesionario();

        multimarca.cargarCoches();

        int opcion = menu();

        while (opcion != 4) {
            switch (opcion) {
                case 1:
                    venta(multimarca);
                    break;
                case 2:
                    nuevo(multimarca);
                    break;
                case 3:
                    mostrar(multimarca);
                    break;
            }
            System.out.println("pene negro");
            opcion = menu();

        }
    }

}
