package p576;

import java.util.Scanner;

public class P576 {

    public static void main(String[] args) {

        final Scanner sc = new Scanner(System.in);

        // tomamos el tiempo de leer cada definicion del primer caso de prueba
        int tiempoPorPalabra = sc.nextInt();
        // creamos un String para ir concatenando los tiempos de cada caso de prueba.
        String resultado = "";
        // Mientras que no se introduzca un tiempo por palabra de 0, seguimos pidiendo casos de prueba
        while (tiempoPorPalabra != 0) {
            // inicializamos el tiempo total del caso de prueba actual.
            int tiempoTotal = 0;
            // pedimos el numero de definiciones de la primera pagina del caso de prueba actual
            int definicionesPorPagina = sc.nextInt();
            // mientras que no se meta un 0, seguimos pidiendo cuantas definiciones tiene cada pagina
            while (definicionesPorPagina != 0) {
                // al tiempo total le sumamos el tiempo de leer las definiciones de cada pagina
                tiempoTotal += definicionesPorPagina * tiempoPorPalabra;
                // pedimos el numero de definiciones de la siguiente pagina, si se mete 0 parará
                definicionesPorPagina = sc.nextInt();
            }
            // para ver cuantas horas hay, hacemos la division entre 3600 (60min*60segundos) ya que tiempoTotal son los segundos totales
            int horas = tiempoTotal / 3600;
            // actualizamos tiempototal haciendo el resto entre 3600, de forma que tendremos cuantos segundos sobran (asi quitamos las horas)
            tiempoTotal %= 3600;
            // para ver cuantos minutos hay, hacemos la division entre 60 segundos que tiene cada minuto
            int min = tiempoTotal / 60;
            // actualizamos tiempototal haciendo el resto entre 60, de forma que tendremos cuantos segundos sobran (asi quitamos los minutos)
            tiempoTotal %= 60;
            // si resultado tiene ya algo de informacion, metemos un salto de linea para separar
            if (!resultado.equals("")) {
                resultado = resultado + "\n";
            }
            // concatenamos en resultado las horas, min y segundos del caso de prueba actual
            resultado = resultado + String.format("%02d", horas) + ":" + String.format("%02d", min) + ":" + String.format("%02d", tiempoTotal);

            // pedimos el tiempo que se tarda en leer cada palabra del siguiente caso de prueba, si se mete 0 parará
            tiempoPorPalabra = sc.nextInt();
        }
        // pintamos el resultado del programa
        System.out.println(resultado);
    }

}
