package hundirlaflota;

import java.io.Serializable;

/**
 * Método que representa qué puntuacion tiene cada jugador respecto a victorias
 * y derrotas
 *
 * @author Elena
 */
class Puntuacion implements Serializable {

    /**
     * Jugador al que está asociada esta puntuacion
     */
    private Jugador jugador;

    /**
     * Numero de victorias
     */
    private int victorias;

    /**
     * Numero de derrotas
     */
    private int derrotas;

    /**
     * Crea una puntuación para dicho jugador con las victorias y derrotas
     * especificadas
     *
     * @param jugador al que pertenece dicha puntuación
     * @param victorias número de victorias
     * @param derrotas número de derrotas
     */
    public Puntuacion(Jugador jugador, int victorias, int derrotas) {
        this.jugador = jugador;
        this.victorias = victorias;
        this.derrotas = derrotas;
    }

    /**
     * Devuelve el jugador al que pertenece dicha puntuación
     *
     * @return
     */
    public Jugador getJugador() {
        return jugador;
    }

    /**
     * Devuelve el numero de victorias
     *
     * @return
     */
    public int getVictorias() {
        return victorias;
    }

    /**
     * Devuelve el numero de derrotas
     *
     * @return
     */
    public int getDerrotas() {
        return derrotas;
    }

    /**
     * Método para sumar una victoria
     */
    public void sumarVictoria() {
        victorias++;
    }

    /**
     * Método para sumar una derrota
     */
    public void sumarDerrota() {
        derrotas++;
    }

}
