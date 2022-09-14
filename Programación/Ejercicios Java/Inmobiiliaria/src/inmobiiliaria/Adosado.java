package inmobiiliaria;

public class Adosado extends Casa {

    public Adosado(int numeroPlanta, double metrosCuadrados, String direccion, String cp, double precioBase, double tamanio) {
        super(numeroPlanta, metrosCuadrados, direccion, cp, precioBase, tamanio);
    }

    @Override
    public String toString() {
        return super.toString() + "Precio de venta: " + calcularPrecio();
    }

    @Override
    public double calcularPrecio() {
        double comision = (precioBase * 3 / 100);

        return precioBase + comision;
    }

}
