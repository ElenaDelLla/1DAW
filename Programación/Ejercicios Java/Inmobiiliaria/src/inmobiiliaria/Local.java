package inmobiiliaria;

public class Local extends Propiedad implements Alquilable{

    public Local(String direccion, String cp, double precioBase, double tamanio) {
        super(direccion, cp, precioBase, tamanio);
    }

    @Override
    public String toString() {
        return super.toString()+"\nPrecio de venta: "+calcularPrecio()+"\nPrecio alquiler: "+precioAlquiler();

    }

    @Override
    public double calcularPrecio() {
        double comision = (precioBase * 5 / 100) + 2000;

        return precioBase + comision;
    }
    @Override
    public double precioAlquiler(){
    
        double precioAlquiler= precioBase/400;
        
    return precioAlquiler;
    }

}
