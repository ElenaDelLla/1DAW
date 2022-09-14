package hundirlaflota;

/**
 * La clase Fragata es una especificación de la clase Barco, teniendo una
 * longitud fija de 3
 *
 * @author Elena
 */
public class Fragata extends Barco {

    private static final int LONGITUD = 3;

    /**
     * Constructor sin parámetros, crea un barco de longitud 3
     */
    public Fragata() {
        super(LONGITUD);
    }

    /**
     * Método toString, devuelve el nombre de esta clase y su longitud
     *
     * @return String con el nombre de esta clase y su longitud
     */
    @Override
    public String toString() {
        return "Fragata " + super.toString();
    }
}
