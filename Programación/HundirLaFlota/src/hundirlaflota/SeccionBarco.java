package hundirlaflota;

/**
 * Representa cada seccion que conforma un Barco
 *
 * @author Elena
 */
public class SeccionBarco {

    /**
     * Coordenada en el eje X de dicha seccion
     */
    private int posX;

    /**
     * Coordenada en el eje Y de dicha seccion
     */
    private int posY;

    /**
     * Si la sección ha sido ya impactada (true) o no (false)
     */
    private boolean impactado;

    /**
     * Constructor para crear la sección
     *
     * @param posX Coordenada en el eje X de dicha seccion
     * @param posY Coordenada en el eje Y de dicha seccion
     */
    public SeccionBarco(int posX, int posY) {
        this.posX = posX;
        this.posY = posY;
    }

    /**
     * Método que devuelve la coordenada en el eje X de la seccion
     *
     * @return coordenada en el eje X de la seccion
     */
    public int getPosX() {
        return posX;
    }

    /**
     * Método que devuelve la coordenada en el eje Y de la seccion
     *
     * @return coordenada en el eje Y de la seccion
     */
    public int getPosY() {
        return posY;
    }

    /**
     * Método que devuelve el estado la seccion
     *
     * @return devuelve si la seccion ha sido impactada (true) o no (false)
     */
    public boolean isImpactado() {
        return impactado;
    }

    /**
     * Método para marcar como impactada esta seccion
     */
    public void impactar() {
        this.impactado = true;
    }

}
