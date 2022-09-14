package hundirlaflota;

/**
 * Representa cada casilla del tablero, contiene la información de si ya ha sido
 * impactada y si hay alguna sección de barco en ella
 *
 * @author Elena
 */
public class Casilla {

    /**
     * Boolean que representa si esta casilla ha sido impactada
     */
    private boolean impactado;

    /**
     * Boolean que representa si en esta casilla hay un barco o no
     */
    private boolean hayBarco;

    /**
     * Devuelve si ha sido impactada esta casilla
     *
     * @return si ha sido impactada esta casilla (true) o no (false)
     */
    public boolean isImpactado() {
        return impactado;
    }

    /**
     * Método que marca esta casilla como impactada
     */
    public void impactar() {
        this.impactado = true;
    }

    /**
     * Método que devuelve si en esta casilla se encuentra algun barco
     *
     * @return si hay barco en esta casilla (true) o no (false)
     */
    public boolean isHayBarco() {
        return hayBarco;
    }

    /**
     * Marca que en esta casilla hay un barco
     */
    public void setHayBarco() {
        this.hayBarco = true;
    }

}
