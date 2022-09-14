/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package alumnos;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author G08
 */
public class Alumnos {

    public static ArrayList<Double> listaAlturas;

    public static int numeroAlumnos() {

        Scanner sc = new Scanner(System.in);
        System.out.println("Indica el número de alumnos de la clase");
        int numeroAlumnos = sc.nextInt();

        return numeroAlumnos;
    }

    public static void leerAlturas(int numeroAlumnos, ArrayList<Double> alturas) {

        Scanner sc = new Scanner(System.in);
        for (int i = 0; i < numeroAlumnos; i++) {

            System.out.println("Indica la altura del alumno " + (i + 1));
            alturas.add(sc.nextDouble());
        }
    }

    public static double calcularMedias(ArrayList<Double> alturas) {

        double suma = 0;

        for (int i = 0; i < alturas.size(); i++) {
            suma += alturas.get(i);
        }
        double media = 0.0;
        if (alturas.size() > 0) {
            media = suma / alturas.size();
        }

        return media;
    }

    public static void mostrarResultados(ArrayList<Double> alturas, double media) {

        int alumnosAlturaMayor = 0;
        int alumnosAlturaMenor = 0;
        for (int i = 0; i < alturas.size(); i++) {
            System.out.println(alturas.get(i));
            if (alturas.get(i) > media) {
                alumnosAlturaMayor++;
            } else {
                alumnosAlturaMenor++;
            }
        }
        System.out.println("Alumnos con altura mayor a la media: " + alumnosAlturaMayor);
        System.out.println("Alumnos con altura menor a la media: " + alumnosAlturaMenor);

    }

    public static void main(String[] args) {

        int numeroAlumno = numeroAlumnos();
        leerAlturas(numeroAlumno, listaAlturas);
        double media = calcularMedias(listaAlturas);
        System.out.println("Media: " + media);
        mostrarResultados(listaAlturas, media);

    }

}
