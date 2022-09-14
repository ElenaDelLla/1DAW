package inmobiiliaria;

public class Piso extends Vivienda {

    private double altura;
    private char letra;

    public Piso(double altura, char letra, String direccion, String cp, double precioBase, double tamanio) {
        super(direccion, cp, precioBase, tamanio);
        this.altura = altura;
        this.letra = letra;
    }

    @Override
    public String toString() {

        return super.toString() + "\nAltura: " + altura + "\nLetra: " + letra + "Precio de venta: " + calcularPrecio();
    }

    public double getAltura() {
        return altura;
    }

    public char getLetra() {
        return letra;
    }

    @Override
    public double calcularPrecio() {
        double comision = (precioBase * 2 / 100);

        return precioBase + comision;
    }

}
