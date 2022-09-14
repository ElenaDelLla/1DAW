package hundirlaflota;

/**
 * La clase Barco representa cada una de las piezas que participan en el juego,
 * tienen una longitud y un array con sus secciones
 *
 * @author Elena
 */
public abstract class Barco {

    /**
     * Longitud del barco
     */
    private int longitud;

    /**
     * Array con cada sección que forma el barco
     */
    private SeccionBarco[] secciones;

    /**
     * Constructor con un parámetro que representa la longitud del barco,
     * inicializa su array de secciones
     *
     * @param longitud del barco
     */
    public Barco(int longitud) {
        this.longitud = longitud;
        this.secciones = new SeccionBarco[longitud];
    }

    /**
     * Devuelve la longitud del barco
     *
     * @return longitud del barco
     */
    public int getLongitud() {
        return longitud;
    }

    /**
     * Devuelve las secciones que conforman el barco
     *
     * @return Array con las SeccionBarco que representa cada trozo del barco
     */
    public SeccionBarco[] getSecciones() {
        return secciones;
    }

    /**
     * Calcula si el barco ya ha sido hundido o no, mirando el estado de todas
     * sus secciones.
     *
     * @return estado del barco, si está hundido(true) o no (false)
     */
    public boolean hundido() {
        boolean hundido = true;

        for (int i = 0; i < secciones.length && hundido; i++) {

            if (!secciones[i].isImpactado()) {
                hundido = false;
            }
        }
        return hundido;
    }

    /**
     * Método que recibe unas coordenadas y en caso de que el barco tenga alguna
     * sección en dicha posición, la marca como impactada
     *
     * @param posX coordenada en el eje X del tablero
     * @param posY cooddemada en el eje Y del tablero
     * @return si la coordenada ha sido impactada correctamente o no
     */
    public boolean impactar(int posX, int posY) {

        boolean impactado = false;
        for (int i = 0; i < secciones.length && !impactado; i++) {

            if (secciones[i].getPosX() == posX && secciones[i].getPosY() == posY) {
                secciones[i].impactar();
                impactado = true;
            }
        }
        return impactado;
    }

    /**
     * Método que recibe unas coordenadas, y si el barco va en horizontal o
     * vertical y crea las secciones que ocupará dicho barco
     *
     * @param posX coordenada en el eje X del tablero en la que comienza el
     * barco
     * @param posY coordenada en el eje Y del tablero en la que comienza el
     * barco
     * @param horizontal posición del barco en el tablero true si está en
     * horizontal o false si está en vertical
     */
    public void crearSecciones(int posX, int posY, boolean horizontal) {

        for (int i = 0; i < longitud; i++) {
            if (horizontal) {
                secciones[i] = new SeccionBarco(posX + i, posY);
            } else {
                secciones[i] = new SeccionBarco(posX, posY + i);
            }
        }
    }

    /**
     * Devuelve la longitud del barco
     *
     * @return longitud del barco
     */
    @Override
    public String toString() {
        return "(Longitud: " + longitud + ")";
    }
}
