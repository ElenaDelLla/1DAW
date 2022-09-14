package pkg5.pkg12;

public class Main {

    public static void main(String[] args) {

        int[][] matriz = {
            {1, 2, 3, 4},
            {2, 4, 6, 8},
            {1, 3, 5, 7}
        };
        
        //nº filas -> matriz.length
        //nº columnas de una fila -> matriz[nºFila].length

        for (int i = 0; i < matriz[0].length; i++) {
            System.out.print(matriz[0][i] + " ");
        }
        System.out.println("");
        for (int i = 0; i < matriz[2].length; i++) {
            System.out.print(matriz[2][i] + " ");
        }
        System.out.println("");
        for (int i = 0; i < matriz.length; i++) {
            System.out.print(matriz[i][2] + " ");
        }
        System.out.println("");
        System.out.println(matriz[1][3]);

    }

}
