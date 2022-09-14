package hundirlaflota;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * La clase Tablero representa el mapa de juego de una partida, contiene los
 * jugadores que participan asi como el estado de colocacion de sus barcos como
 * de quién es el turno o qué movimientos ha realizado cada jugador
 *
 * @author Elena
 */
public class Tablero {

    /**
     * Constante con el tamaño del tablero, en principio es 10
     */
    private static final int TAMANYO = 10;
    /**
     * Matriz con todas las casillas del jugador 1
     */
    private Casilla[][] matrizOceanoJug1 = new Casilla[TAMANYO][TAMANYO];
    /**
     * Matriz con todas las casillas del jugador 2
     */
    private Casilla[][] matrizOceanoJug2 = new Casilla[TAMANYO][TAMANYO];
    /**
     * Representa si el turno es del jugador 1 (true) o del jugador 2 (false)
     */
    private boolean turnoJugador1;
    /**
     * Jugador 1
     */
    private Jugador jugador1;
    /**
     * Jugador 2
     */
    private Jugador jugador2;
    /**
     * Lista de barcos del Jugador 1
     */
    private ArrayList<Barco> barcosJugador1 = new ArrayList<Barco>();
    /**
     * Lista de barcos del Jugador 2
     */
    private ArrayList<Barco> barcosJugador2 = new ArrayList<Barco>();

    /**
     * Constructor sin parámetros, inicializa la matriz de cada jugador que
     * representa su tablero
     */
    public Tablero() {
        for (int i = 0; i < TAMANYO; i++) {
            for (int j = 0; j < TAMANYO; j++) {
                matrizOceanoJug1[i][j] = new Casilla();
                matrizOceanoJug2[i][j] = new Casilla();
            }
        }
        turnoJugador1 = true;
    }

    /**
     * Método para obtener el tamaño del tablero
     *
     * @return tamaño del tablero
     */
    public int getTamanyo() {
        return TAMANYO;
    }

    /**
     * Método que recibe el nombre de cada usuario y los crea
     *
     * @param nombreJug1 nombre del Jugador 1
     * @param nombreJug2 nombre del Jugador 2
     */
    public void crearJugadores(String nombreJug1, String nombreJug2) {
        jugador1 = new Jugador(nombreJug1);
        jugador2 = new Jugador(nombreJug2);
    }

    /**
     * Método que devuelve el jugador cuyo turno es ahora
     *
     * @return Jugador que tiene su turno ahora
     */
    public Jugador obtieneJugadorTurnoActual() {
        Jugador jugador;
        if (turnoJugador1) {
            jugador = jugador1;
        } else {
            jugador = jugador2;
        }
        return jugador;
    }

    /**
     * Método que recibe un barco y comprueba si el jugador del turno actual
     * tiene ya colocado ese tipo de barco o no
     *
     * @param barco que se desea revisar si ha sido ya colocado
     * @return boolean si ya ha sido colocado dicho barco o no
     */
    public boolean tipoBarcoYaColocado(Barco barco) {
        Iterator<Barco> it;
        if (turnoJugador1) {
            it = barcosJugador1.iterator();
        } else {
            it = barcosJugador2.iterator();
        }
        while (it.hasNext()) {
            Barco b = it.next();
            if (b.getClass().equals(barco.getClass())) {
                return true;
            }
        }
        return false;
    }

    /**
     * Metodo para comprobar si unas coordenadas pertenecen o no al tablero
     * actual
     *
     * @param posX Coordenada en el eje X
     * @param posY Coordenada en el eje Y
     * @return boolean si la coordenada representada por dichos parámetros
     * pertenece al tablero actual o no
     */
    public boolean coordenadaPerteneceATablero(int posX, int posY) {

        if (posX >= TAMANYO || posY >= TAMANYO) {
            return false;
        }
        return true;
    }

    /**
     * Método que recibe un barco, unas coordenadas y la orientación y comprueba
     * si es posible colocar dicho barco en el tablero en esas coordenadas y
     * orientación
     *
     * @param barco Barco para el que se desea comprobar si es posible la
     * colocación
     * @param posX Coordenada en el eje X
     * @param posY Coordenada en el eje Y
     * @param horizontal posicion en la que se desea colocar el barco,
     * horizontal (true) o vertical (false)
     * @return si la colocacion es posible o no
     */
    public boolean colocacionPosibleEnTablero(Barco barco, int posX, int posY, boolean horizontal) {
        if (horizontal) {
            if (((posX + barco.getLongitud() - 1) >= TAMANYO) || (posY - 1) > TAMANYO) {
                return false;
            }
        } else {
            if (((posY + barco.getLongitud() - 1) >= TAMANYO) || (posX - 1) > TAMANYO) {
                return false;
            }
        }
        return true;
    }

    /**
     * Método que dado un barco, lee sus secciones para marcarlas en el tablero
     * del jugador contrario
     *
     * @param barco Barco que ha sido colocado
     */
    private void colocarEnOceano(Barco barco) {
        SeccionBarco[] secciones = barco.getSecciones();
        Casilla[][] matrizOceano;
        if (turnoJugador1) {
            matrizOceano = matrizOceanoJug2;
        } else {
            matrizOceano = matrizOceanoJug1;
        }
        for (int i = 0; i < secciones.length; i++) {
            SeccionBarco seccion = secciones[i];
            matrizOceano[seccion.getPosX()][seccion.getPosY()].setHayBarco();
        }
    }

    /**
     * Método que recibe un barco, unas coordenadas y la orientación y realiza
     * la colocación en caso de ser posible
     *
     * @param barco Barco que desea colocarse
     * @param posX Coordenada en el eje X
     * @param posY Coordenada en el eje Y
     * @param horizontal posicion en la que se desea colocar el barco,
     * horizontal (true) o vertical (false)
     * @return si el barco ha sido colocado correctamente o no
     */
    public boolean colocarBarcoEnTablero(Barco barco, int posX, int posY, boolean horizontal) {
        if (colocacionPosibleEnTablero(barco, posX, posY, horizontal)) {
            barco.crearSecciones(posX, posY, horizontal);

            if (!tipoBarcoYaColocado(barco)) {
                if (turnoJugador1) {
                    barcosJugador1.add(barco);
                } else {
                    barcosJugador2.add(barco);
                }
                colocarEnOceano(barco);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * Metodo que devuelve el siguiente barco que deberia colocar el jugador del
     * turno actual
     *
     * @return Barco que se debe colocar en siguiente lugar o null si ya los ha
     * colocado todos
     */
    public Barco colocarSiguienteBarco() {
        ArrayList<Barco> barcos;
        if (turnoJugador1) {
            barcos = barcosJugador1;
        } else {
            barcos = barcosJugador2;
        }

        switch (barcos.size()) {

            case 0:
                return new Portaaviones();
            case 1:
                return new Acorazado();
            case 2:
                return new Fragata();
            case 3:
                return new Submarino();
            default:
                return null;
        }
    }

    /**
     * Método que devuelve los barcos que ya tiene colocados el jugador del
     * turno actual
     *
     * @return lista de barcos colocadas por el juegador con turno actual
     */
    public ArrayList<Barco> obtieneBarcosYaColocados() {

        ArrayList<Barco> barcos;
        if (turnoJugador1) {
            barcos = barcosJugador1;
        } else {
            barcos = barcosJugador2;
        }
        return barcos;
    }

    /**
     * Método que valida si la fase de colocacion de un jugador ha finalizado o
     * no
     *
     * @return estado de la fase de colocacion del jugador, terminada(true) o no
     * terminada aun (false)
     */
    public boolean finFaseColocacionJugador() {
        ArrayList<Barco> barcos;
        if (turnoJugador1) {
            barcos = barcosJugador1;
        } else {
            barcos = barcosJugador2;
        }

        if (barcos.size() != 4) {
            return false;
        }
        turnoJugador1 = !turnoJugador1;
        return true;
    }

    /**
     * Método que valida si la fase de colocacion de la partida ha finalizado o
     * no
     *
     * @return estado de la fase de colocacion en la partida, terminada(true) o
     * no terminada aun (false)
     */
    public boolean finFaseColocacion() {

        if (barcosJugador1.size() == 4 && barcosJugador2.size() == 4) {
            turnoJugador1 = !turnoJugador1;
            return true;
        }
        return false;
    }

    /**
     * Método para comprobar si es posible realizar un disparo sobre unas
     * coordenadas o no, en función de si ya ha sido disparada por el jugador
     * actual o no.
     *
     * @param posX Coordenada en el eje X
     * @param posY Coordenada en el eje Y
     * @return boolean si es posible disparar dicha coordenada o no
     */
    public boolean disparoPosible(int posX, int posY) {

        Casilla[][] matrizOceano;
        if (turnoJugador1) {
            matrizOceano = matrizOceanoJug1;
        } else {
            matrizOceano = matrizOceanoJug2;
        }

        if (!matrizOceano[posX][posY].isImpactado()) {
            return true;
        }

        return false;

    }

    /**
     * Método que recibe unas coordenadas y realiza un disparo en dichas
     * coordenadas, en caso de haber un barco enemigo en dicha posicion del
     * oceano lo marcará como impactado
     *
     * @param posX Coordenada en el eje X
     * @param posY Coordenada en el eje Y
     */
    public void disparar(int posX, int posY) {
        Casilla[][] matrizOceano;
        if (turnoJugador1) {
            matrizOceano = matrizOceanoJug1;
        } else {
            matrizOceano = matrizOceanoJug2;
        }
        matrizOceano[posX][posY].impactar();
        if (matrizOceano[posX][posY].isHayBarco()) {
            impactarBarco(posX, posY);
        }

        if (!esFinJuego()) {
            turnoJugador1 = !turnoJugador1;
        }
    }

    /**
     * Método que busca si en unas coordenadas hay algun barco del jugador
     * contrario y en caso de existir lo marca como impactado
     *
     * @param posX Coordenada en el eje X
     * @param posY Coordenada en el eje Y
     */
    private void impactarBarco(int posX, int posY) {

        Iterator<Barco> it;
        if (turnoJugador1) {
            it = barcosJugador2.iterator();
        } else {
            it = barcosJugador1.iterator();
        }
        while (it.hasNext()) {
            Barco barco = it.next();
            SeccionBarco[] secciones = barco.getSecciones();
            for (int i = 0; i < secciones.length; i++) {
                SeccionBarco seccion = secciones[i];
                if (seccion.getPosX() == posX && seccion.getPosY() == posY) {
                    seccion.impactar();
                }
            }
        }
    }

    /**
     * Método que devuelve la matriz oceano del jugador actual
     *
     * @return matriz oceano del jugador con turno actual
     */
    public Casilla[][] getEstadoActual() {
        Casilla[][] matrizOceano;
        if (turnoJugador1) {
            matrizOceano = matrizOceanoJug1;
        } else {
            matrizOceano = matrizOceanoJug2;
        }
        return matrizOceano;
    }

    /**
     * Método que comprueba si el juego ha finalizado o no
     *
     * @return si el juego ha finalizado ya (true) o no (false)
     */
    public boolean esFinJuego() {
        Iterator<Barco> it;
        if (turnoJugador1) {
            it = barcosJugador2.iterator();
        } else {
            it = barcosJugador1.iterator();
        }
        boolean todosHundidos = true;
        while (it.hasNext()) {
            Barco barco = it.next();
            if (!barco.hundido()) {
                todosHundidos = false;
            }
        }
        return todosHundidos;
    }

    /**
     * Metodo utilizado para obtener el Jugador vencedor si ha finalizado la
     * partida
     *
     * @return El jugador que ha resultado vencedor en la partida
     */
    public Jugador obtieneVencedor() {
        Jugador jugadorGanador = null;
        if (esFinJuego()) {

            if (turnoJugador1) {
                jugadorGanador = jugador1;
            } else {
                jugadorGanador = jugador2;
            }
        }

        return jugadorGanador;

    }

    /**
     * Metodo utilizado para obtener el Jugador perdedor si ha finalizado la
     * partida
     *
     * @return El jugador que ha resultado perdedor en la partida
     */
    public Jugador obtienePerdedor() {

        Jugador jugadorPerdedor = null;
        if (esFinJuego()) {
            if (turnoJugador1) {
                jugadorPerdedor = jugador2;
            } else {
                jugadorPerdedor = jugador1;
            }
        }
        return jugadorPerdedor;

    }

}
