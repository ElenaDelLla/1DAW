package tallermecanico;

public class Revision extends Trabajo {

    public Revision(String descripcion) {
        super(descripcion);
    }

    public String toString() {

        return super.toString()+"\nPrecio final: "+calcularPrecio();
    }

    @Override
    public double calcularPrecio() {

        double precio = (numeroHoras * 30) +  20;
        return precio;
    }
}
