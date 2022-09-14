/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg10;

/**
 *
 * @author G08
 */
public class Producto {

    private String nombre;
    private int cantidad;
    private double precio;
    private static int contador;

    public Producto() {
        nombre = "Producto" + contador;
        contador++;
        cantidad = (int) (Math.random() * (10 - 1 + 1) + 1);
        precio = Math.random() * (100 - 0.01 + 1) + 0.01;
    }

    public String getNombre() {
        return nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public double getPrecio() {
        return precio;
    }

}
