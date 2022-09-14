package tiendaropa;

import java.util.Calendar;

public class Fecha {

    private int dia;
    private int mes;
    private int anio;

    public Fecha() {

        Calendar cal = Calendar.getInstance();
        dia = cal.get(Calendar.DAY_OF_MONTH);
        mes = cal.get(Calendar.MONTH) + 1;
        anio = cal.get(Calendar.YEAR);

    }

    public Fecha(int dia, int mes, int anio) {
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
    }

    public int getDia() {
        return dia;
    }

    public int getMes() {
        return mes;
    }

    public int getAnio() {
        return anio;
    }

    @Override
    public String toString() {
        return "Fecha " + "dia: " + dia + " mes: " + mes + " anio: " + anio;
    }

    private static boolean esBisiesto(Fecha fecha) {
        return (fecha.anio % 4 == 0 && !(fecha.anio % 100 == 0 && fecha.anio % 400 != 0));
    }

    private static void diaSiguiente(Fecha fecha) {
        int dias[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if (esBisiesto(fecha)) {
            dias[1]++;
        }
        if (fecha.dia < dias[fecha.mes - 1]) {
            fecha.dia++;
        } else if (fecha.mes < 12) {
            fecha.dia = 1;
            fecha.mes++;
        } else {
            fecha.dia = 1;
            fecha.mes = 1;
            fecha.anio++;
        }
    }

    public Fecha sumarDias(int d) {
        Fecha f = new Fecha(dia, mes, anio);
        for (int i = 0; i < d; i++) {
            diaSiguiente(f);
        }
        return f;
    }

 
}
