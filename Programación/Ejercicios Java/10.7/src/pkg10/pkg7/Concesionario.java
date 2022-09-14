/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg10.pkg7;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

/**
 *
 * @author G08
 */
public class Concesionario {

    private ArrayList<Coche> listaCoches;

    public Concesionario() {
    }

    public void cargarCoches() {

        listaCoches = new ArrayList<Coche>();

        Scanner sc = new Scanner(System.in);
        System.out.println("Datos del nuevo vehiculo:");
        System.out.println("Introduce la matricula");
        String matricula = sc.nextLine();

        while (!matricula.equals("0")) {
            try {
                System.out.println("Introduce la marca");
                String marca = sc.nextLine();
                System.out.println("Introduce el modelo");
                String modelo = sc.nextLine();
                System.out.println("Introduce el kilometraje");
                double km = sc.nextDouble();
                System.out.println("Introduce el precio");
                double precio = sc.nextDouble();
                sc.nextLine();
                listaCoches.add(new Coche(matricula, marca, modelo, km, precio));
                System.out.println("Introduce la matricula");
                matricula = sc.nextLine();
            } catch (Exception e) {
                System.out.println("Datos introducidos no válidos");
                sc.nextLine();
            }
        }
        if (matricula.equals("0")) {
            System.out.println("Fin de la carga");
        }
    }

    public boolean venderCoche(String matricula) {

        boolean eliminado = false;

        Iterator recorrerLista = listaCoches.iterator();

        while (recorrerLista.hasNext()) {
            Coche coche = (Coche) recorrerLista.next();
            if (coche.getMatricula().equals(matricula)) {
                recorrerLista.remove();
                eliminado = true;
            }
        }
        return eliminado;
    }

    public void nuevoCoche(String matricula, String marca, String modelo, double km, double precio) {
        Coche nuevo = new Coche(matricula, marca, modelo, km, precio);
        listaCoches.add(nuevo);
    }

    public void mostrar() {
        Iterator recorrerLista = listaCoches.iterator();

        while (recorrerLista.hasNext()) {
            Coche coche = (Coche) recorrerLista.next();
            System.out.println(coche);
        }
    }

    public void mostrar(String marca) {

        Iterator recorrerLista = listaCoches.iterator();

        while (recorrerLista.hasNext()) {
            Coche coche = (Coche) recorrerLista.next();
            if (coche.getMatricula().equals(marca)) {
                System.out.println(coche);
            }
        }
    }

    public void mostrar(String marca, String modelo) {

        Iterator recorrerLista = listaCoches.iterator();

        while (recorrerLista.hasNext()) {
            Coche coche = (Coche) recorrerLista.next();
            if (coche.getMatricula().equals(marca) && coche.getModelo().equals(modelo)) {
                System.out.println(coche);
            }
        }
    }

    public void mostrar(double km) {

        Iterator recorrerLista = listaCoches.iterator();

        while (recorrerLista.hasNext()) {
            Coche coche = (Coche) recorrerLista.next();
            if (coche.getKm() <= km) {
                System.out.println(coche);
            }
        }
    }

    public void mostrar(double precio1, double precio2) {

        Iterator recorrerLista = listaCoches.iterator();

        while (recorrerLista.hasNext()) {
            Coche coche = (Coche) recorrerLista.next();
            if (coche.getPrecio() >= precio1 && coche.getPrecio() <= precio2) {
                System.out.println(coche);
            }
        }
    }

}
