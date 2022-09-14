
package tallermecanico;


public class RMecanica extends Reparacion{

    public RMecanica(String descripcion) {
        super(descripcion);
    }

    
    public String toString(){
    
        return super.toString() + "\nPrecio final: "+calcularPrecio();
    }
    
    @Override
    public double calcularPrecio() {
        
        double precio= numeroHoras*30 +precioMaterial*1.1;
        
        
        return precio;
    }
    
    
    
    
    
}
