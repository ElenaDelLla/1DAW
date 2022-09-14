package examen;

import java.io.Serializable;

public abstract class Animal implements Serializable {

    private static int CONTADOR = 0;
    protected int identificador;
    protected String nombre;
    protected int edad;
    protected boolean reservado;

    public Animal(String nombre, int edad) {
        this.identificador = CONTADOR;
        this.nombre = nombre;
        this.edad = edad;
        this.reservado = false;
        CONTADOR++;
    }

    public int getIdentificador() {
        return identificador;
    }

    public boolean isReservado() {
        return reservado;
    }

    @Override
    public String toString() {
        return "Identificador : " + identificador + " Nombre: " + nombre + " Edad: " + edad + " Reservado: " + reservado;
    }

    public void cancelarReserva() {
        reservado = false;
    }

    public void reservar() {
        reservado = true;
    }

}
