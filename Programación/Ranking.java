package hundirlaflota;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Método que representa el ranking general de jugadores, contiene la
 * funcionalidad necesaria para persistir a fichero la información y ser
 * recuperada al crear el Ranking
 *
 * @author Elena
 */
public class Ranking {

    /**
     * Constante con el nombre del fichero en el que se persiste el ranking para
     * poder ser recuperado cada vez que se inicia la aplicación
     */
    private static final String NOMBRE_FICHERO = "Ranking.bin";

    /**
     * Lista de todas las puntuaciones
     */
    private static ArrayList<Puntuacion> listaPuntuacion;

    /**
     * Constructor, intenta leer de fichero, si no puede crea una lista vacía de
     * puntuaciones
     */
    public Ranking() {
        leerFicheroPuntuaciones();
        if (listaPuntuacion == null) {
            listaPuntuacion = new ArrayList<Puntuacion>();
        }
    }

    /**
     * Devuelve la lista de Puntuaciones del ranking
     *
     * @return lista de Puntuaciones
     */
    public ArrayList<Puntuacion> getListaPuntuacion() {
        return listaPuntuacion;
    }

    /**
     * Método que crea una puntuación de victoria (para cuando no existe aun
     * puntuacion de dicho jugador)
     *
     * @param jugador jugador al que se le va a crear una puntuacion de victoria
     */
    private static void crearPuntuacionVictoria(Jugador jugador) {
        listaPuntuacion.add(new Puntuacion(jugador, 1, 0));
    }

    /**
     * Método que crea una puntuacion de derrota (para cuando no existe aun
     * puntuacion de dicho jugador)
     *
     * @param jugador jugador al que se le va a crear una puntuacion de derrota
     */
    private static void crearPuntuacionDerrota(Jugador jugador) {
        listaPuntuacion.add(new Puntuacion(jugador, 0, 1));
    }

    /**
     * Añade una victoria al ganador y una derrota al perdedor
     *
     * @param vencedor jugador al que se le va a añadir una victoria
     * @param perdedor jugador al que se le va a añadir una derrota
     */
    public void anyadirPuntuacion(Jugador vencedor, Jugador perdedor) {

        Iterator<Puntuacion> iterator = listaPuntuacion.iterator();
        boolean vencedorEncontrado = false;
        boolean perdedorEncontrado = false;

        while (iterator.hasNext() && (!vencedorEncontrado || !perdedorEncontrado)) {
            Puntuacion elemento = iterator.next();
            if (elemento.getJugador().equals(vencedor)) {
                elemento.sumarVictoria();
                vencedorEncontrado = true;
            }
            if (elemento.getJugador().equals(perdedor)) {
                elemento.sumarDerrota();
                perdedorEncontrado = true;
            }
        }
        if (!vencedorEncontrado) {
            crearPuntuacionVictoria(vencedor);
        }
        if (!perdedorEncontrado) {
            crearPuntuacionDerrota(perdedor);
        }
        guardarFicheroPuntuaciones();
    }

    /**
     * Método para recuperar desde fichero la lista de puntuaciones y asignarla
     * al ranking
     */
    private static void leerFicheroPuntuaciones() {
        ObjectInputStream ois = null;
        try {
            ois = new ObjectInputStream(new FileInputStream(NOMBRE_FICHERO));
            listaPuntuacion = (ArrayList<Puntuacion>) ois.readObject();
        } catch (ClassNotFoundException e) {
            System.out.println("El contenido del fichero no es válido");
        } catch (FileNotFoundException e) {
            System.out.println("El fichero " + NOMBRE_FICHERO + " no existe");
        } catch (Exception e) {
            System.out.println("Error convirtiendo el objeto");
            System.out.println(e);
        } finally {
            try {
                if (ois != null) {
                    ois.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero");
            }
        }
    }

    /**
     * Método para guardar en fichero el ranking de puntuaciones y poder
     * recuperarlo posteriormente
     */
    private void guardarFicheroPuntuaciones() {

        ObjectOutputStream oos = null;
        try {
            oos = new ObjectOutputStream(new FileOutputStream(NOMBRE_FICHERO));
            oos.writeObject(listaPuntuacion);
        } catch (IOException e) {
            System.out.println("Error escribiendo en el fichero");
        } finally {
            try {
                if (oos != null) {
                    oos.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero");
            }
        }

    }
}
