package hundirlaflota;

/**
 * La clase Submarino es una especificación de la clase Barco, teniendo una
 * longitud fija de 2
 *
 * @author Elena
 */
public class Submarino extends Barco {

    private static final int LONGITUD = 2;

    /**
     * Constructor sin parámetros, crea un barco de longitud 2
     */
    public Submarino() {
        super(LONGITUD);
    }

    /**
     * Método toString, devuelve el nombre de esta clase y su longitud
     *
     * @return String con el nombre de esta clase y su longitud
     */
    @Override
    public String toString() {
        return "Submarino " + super.toString();
    }
}
