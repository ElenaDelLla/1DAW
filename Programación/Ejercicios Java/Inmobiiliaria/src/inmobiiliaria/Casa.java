package inmobiiliaria;

public abstract class Casa extends Vivienda {

    protected int numeroPlanta;
    protected double metrosCuadrados;

    public Casa(int numeroPlanta, double metrosCuadrados, String direccion, String cp, double precioBase, double tamanio) {
        super(direccion, cp, precioBase, tamanio);
        this.numeroPlanta = numeroPlanta;
        this.metrosCuadrados = metrosCuadrados;

    }

    public int getNumeroPlanta() {
        return numeroPlanta;
    }

    public double getMetrosCuadrados() {
        return metrosCuadrados;
    }

    @Override
    public String toString() {

        return super.toString() + "\nNumero de plantas: " + numeroPlanta + "\nMetros cuadrados: " + metrosCuadrados;
    }
}
