package carniceriamanolo;

import java.io.Serializable;

public class Producto implements Serializable {

    private int codigo;
    private String descripcion;
    private int stock;
    private double precio;

    public Producto(int codigo, String descripcion, int stock, double precio) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.stock = stock;
        this.precio = precio;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public int getStock() {
        return stock;
    }

    public void modificarStock(int nuevoStock) {

        stock = nuevoStock;
    }

    public double getPrecio() {
        return precio;
    }

    public String toString() {

        return "Código: " + codigo + "\nDescripción: " + descripcion + "\nStock: " + stock + "\nPrecio: " + precio;
    }
}
