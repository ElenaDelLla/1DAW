package inmobiiliaria;

public abstract class Propiedad {

    protected Identificador identificador;
    protected String direccion;
    protected String cp;
    protected double precioBase;
    protected double tamanio;

    public Propiedad(String direccion, String cp, double precioBase, double tamanio) {
        this.identificador = new Identificador(cp);
        this.direccion = direccion;
        this.cp = cp;
        this.precioBase = precioBase;
        this.tamanio = tamanio;
    }

    public Identificador getIdentificador() {
        return identificador;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public double getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(double precioBase) {
        this.precioBase = precioBase;
    }

    public double getTamanio() {
        return tamanio;
    }

    public void setTamanio(double tamaño) {
        this.tamanio = tamaño;
    }

    public abstract double calcularPrecio();

    @Override
    public String toString() {

        return "Identificador: " + identificador.getCodigo() + "\nDireccion: " + direccion + "\nCodigo postal: " + cp + "\nPrecio Base: " + precioBase + "\nTamaño: " + tamanio;
    }

}
