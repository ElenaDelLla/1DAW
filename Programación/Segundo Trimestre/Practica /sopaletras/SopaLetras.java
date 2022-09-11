package sopaletras;

import java.util.Scanner;

public class SopaLetras {

    private String[] palabrasBuscar;
    private char[][] sopa;
    private int[] coordenadas = new int[]{-1, -1, -1};

    public SopaLetras(int ancho, int alto, int numpalabras) {
        this.sopa = new char[alto][ancho];
        this.palabrasBuscar = new String[numpalabras];
    }

    public void cargar() {
        Scanner sc = new Scanner(System.in);

        for (int i = 0; i < palabrasBuscar.length; i++) {
            System.out.println("Palabra número " + (i) + " para buscar");
            palabrasBuscar[i] = sc.next().toUpperCase();
        }
        
        for (int i = 0; i < sopa.length; i++) {
            for (int j = 0; j < sopa[i].length; j++) {
                System.out.println("Caracter para posición " + i + " - " + j);
                sopa[i][j] = sc.next().toUpperCase().charAt(0);
            }
        }

    }

    public void cargar(char[][] sopa, String[] palabras) {
        this.sopa = sopa;
        this.palabrasBuscar = palabras;
    }

    public int[] buscar(String palabra) {

        for (int fila = 0; fila < sopa.length; fila++) {
            for (int columna = 0; columna < sopa[fila].length; columna++) {

                // busca derecha
                if (columna + (palabra.length() - 1) < sopa[fila].length) {
                    boolean encontrada = true;

                    for (int letras = 0; letras < palabra.length(); letras++) {
                        if (palabra.charAt(letras) != sopa[fila][columna + letras]) {
                            encontrada = false;
                            break;
                        }
                    }
                    if (encontrada) {
                        coordenadas[0] = fila;
                        coordenadas[1] = columna;
                        coordenadas[2] = 2;
                    }
                }

                // busca izquierda
                if (columna - (palabra.length() - 1) >= 0) {
                    boolean encontrada = true;

                    for (int letras = 0; letras < palabra.length(); letras++) {
                        if (palabra.charAt(letras) != sopa[fila][columna - letras]) {
                            encontrada = false;
                            break;
                        }
                    }
                    if (encontrada) {
                        coordenadas[0] = fila;
                        coordenadas[1] = columna;
                        coordenadas[2] = 6;
                    }
                }

                // busca abajo
                if (fila + (palabra.length() - 1) < sopa.length) {
                    boolean encontrada = true;

                    for (int letras = 0; letras < palabra.length(); letras++) {
                        if (palabra.charAt(letras) != sopa[fila + letras][columna]) {
                            encontrada = false;
                            break;
                        }
                    }
                    if (encontrada) {
                        coordenadas[0] = fila;
                        coordenadas[1] = columna;
                        coordenadas[2] = 4;
                    }
                }

                // busca arriba
                if (fila - (palabra.length() - 1) >= 0) {
                    boolean encontrada = true;

                    for (int letras = 0; letras < palabra.length(); letras++) {
                        if (palabra.charAt(letras) != sopa[fila - letras][columna]) {
                            encontrada = false;
                            break;
                        }
                    }
                    if (encontrada) {
                        coordenadas[0] = fila;
                        coordenadas[1] = columna;
                        coordenadas[2] = 0;
                    }
                }

                // diagonal arriba derecha
                if ((fila - (palabra.length() - 1) >= 0) && (columna + (palabra.length() - 1) < sopa[fila].length)) {
                    boolean encontrada = true;

                    for (int letras = 0; letras < palabra.length(); letras++) {
                        if (palabra.charAt(letras) != sopa[fila - letras][columna + letras]) {
                            encontrada = false;
                            break;
                        }
                    }
                    if (encontrada) {
                        coordenadas[0] = fila;
                        coordenadas[1] = columna;
                        coordenadas[2] = 1;
                    }
                }
                //

                // diagonal arriba izquierda
                if ((fila - (palabra.length() - 1) >= 0) && (columna - (palabra.length() - 1) >= 0)) {
                    boolean encontrada = true;

                    for (int letras = 0; letras < palabra.length(); letras++) {
                        if (palabra.charAt(letras) != sopa[fila - letras][columna - letras]) {
                            encontrada = false;
                            break;
                        }
                    }
                    if (encontrada) {
                        coordenadas[0] = fila;
                        coordenadas[1] = columna;
                        coordenadas[2] = 7;
                    }
                }

                // diagonal abajo derecha
                if ((fila + (palabra.length() - 1) < sopa.length) && (columna + (palabra.length() - 1) <= sopa[fila].length)) {
                    boolean encontrada = true;

                    for (int letras = 0; letras < palabra.length(); letras++) {
                        if (palabra.charAt(letras) != sopa[fila + letras][columna + letras]) {
                            encontrada = false;
                            break;
                        }
                    }
                    if (encontrada) {
                        coordenadas[0] = fila;
                        coordenadas[1] = columna;
                        coordenadas[2] = 3;
                    }
                }

                // diagonal abajo izquierda
                if ((fila + (palabra.length() - 1) < sopa.length) && (columna - (palabra.length() - 1) >= 0)) {
                    boolean encontrada = true;

                    for (int letras = 0; letras < palabra.length(); letras++) {
                        if (palabra.charAt(letras) != sopa[fila + letras][columna - letras]) {
                            encontrada = false;
                            break;
                        }
                    }
                    if (encontrada) {
                        coordenadas[0] = fila;
                        coordenadas[1] = columna;
                        coordenadas[2] = 5;
                    }
                }

            }
        }

        return coordenadas;
    }

    public char[][] resolver() {
        char[][] sopablanca = sopa;
        char[][] sopabuena = new char[sopablanca.length][sopablanca[0].length];
        boolean[][] valido = new boolean[sopa.length][sopa[0].length];

        for (int i = 0; i < sopablanca.length; i++) {
            for (int j = 0; j < sopablanca[i].length; j++) {
                valido[i][j] = false;
            }
        }
        for (int i = 0; i < palabrasBuscar.length; i++) {
            int[] dato = buscar(palabrasBuscar[i]);
            int fila = dato[0];
            int columna = dato[1];
            int direccion = dato[2];
            switch (direccion) {
                case 0:
                    for (int j = 0; j < palabrasBuscar[i].length(); j++) {
                        valido[fila][columna] = true;
                        fila--;
                    }
                    break;
                case 1:
                    for (int j = 0; j < palabrasBuscar[i].length(); j++) {
                        valido[fila][columna] = true;
                        fila--;
                        columna++;
                    }
                    break;
                case 2:
                    for (int j = 0; j < palabrasBuscar[i].length(); j++) {
                        valido[fila][columna] = true;
                        columna++;
                    }
                    break;
                case 3:
                    for (int j = 0; j < palabrasBuscar[i].length(); j++) {
                        valido[fila][columna] = true;
                        fila++;
                        columna++;
                    }
                    break;
                case 4:
                    for (int j = 0; j < palabrasBuscar[i].length(); j++) {
                        valido[fila][columna] = true;
                        fila++;
                    }
                    break;
                case 5:
                    for (int j = 0; j < palabrasBuscar[i].length(); j++) {
                        valido[fila][columna] = true;
                        columna--;
                        fila++;
                    }
                    break;
                case 6:
                    for (int j = 0; j < palabrasBuscar[i].length(); j++) {
                        valido[fila][columna] = true;
                        columna--;
                    }
                    break;
                case 7:
                    for (int j = 0; j < palabrasBuscar[i].length(); j++) {
                        valido[fila][columna] = true;
                        fila--;
                        columna--;
                    }
                    break;
            }
        }
        for (int i = 0; i < sopablanca.length; i++) {
            for (int j = 0; j < sopablanca[i].length; j++) {
                if (valido[i][j] == true) {
                    sopabuena[i][j] = sopablanca[i][j];
                } else {
                    sopabuena[i][j] = ' ';
                }
            }
        }
        return sopabuena;
    }

    public void mostrar(char[][] sopa) {
        for (int i = 0; i < sopa.length; i++) {
            System.out.print("|");
            for (int j = 0; j < sopa[0].length; j++) {
                if (j != sopa[0].length) {
                    System.out.print("\t" + sopa[i][j]);
                }
            }
            System.out.println("|");
        }
    }
}
