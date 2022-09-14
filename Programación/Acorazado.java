package hundirlaflota;

/**
 * La clase Acorazado es una especificación de la clase Barco, teniendo una
 * longitud fija de 4
 *
 * @author Elena
 */
public class Acorazado extends Barco {

    private static final int LONGITUD = 4;

    /**
     * Constructor sin parámetros, crea un barco de longitud 4
     */
    public Acorazado() {
        super(LONGITUD);
    }

    /**
     * Devuelve el nombre de esta clase y su longitud
     *
     * @return String con el nombre de esta clase y su longitud
     */
    @Override
    public String toString() {
        return "Acorazado " + super.toString();
    }
}
