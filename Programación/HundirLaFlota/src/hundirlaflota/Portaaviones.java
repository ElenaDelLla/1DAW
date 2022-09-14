package hundirlaflota;

/**
 * La clase Portaaviones es una especificación de la clase Barco, teniendo una
 * longitud fija de 5
 *
 * @author Elena
 */
public class Portaaviones extends Barco {

    private static final int LONGITUD = 5;

    /**
     * Constructor sin parámetros, crea un barco de longitud 5
     */
    public Portaaviones() {
        super(LONGITUD);
    }

    /**
     * Método toString, devuelve el nombre de esta clase y su longitud
     *
     * @return String con el nombre de esta clase y su longitud
     */
    @Override
    public String toString() {
        return "Portaaviones " + super.toString();
    }
}
