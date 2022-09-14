package hundirlaflota;

import java.io.Serializable;

/**
 * Representa a un jugador, identificado por su nombre
 *
 * @author Elena
 */
public class Jugador implements Serializable {

    /**
     * Nombre del jugador
     */
    private String nombre;

    /**
     * Constructor con parámetro nombre, crea el jugador con dicho nombre
     *
     * @param nombre del jugador
     */
    public Jugador(String nombre) {
        this.nombre = nombre.toUpperCase();
    }

    /**
     * Método que devuelve el nombre del jugador
     *
     * @return nombre del jugador
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Método para comparar dos jugadores, utilizando como clave el campo nombre
     *
     * @param jugador para ser comparado
     * @return devuelve true si el nombre de ambos jugadores es el mismo y false
     * en caso contrario
     */
    public boolean equals(Jugador jugador) {
        return this.nombre.equals(jugador.nombre);
    }

}
