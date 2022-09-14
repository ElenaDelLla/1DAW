package inmobiiliaria;

public class Identificador {

    private String codigo;
    private static int contador = 0;

    public Identificador(String cp) {
        codigo = cp;
        if (contador < 10) {
            codigo += "00" + contador;
        } else if (contador > 10 && contador < 100) {
            codigo += "0" + contador;
        } else {
            codigo += contador;
        }
        contador++;
    }

    public String getCodigo() {
        return codigo;
    }

}
