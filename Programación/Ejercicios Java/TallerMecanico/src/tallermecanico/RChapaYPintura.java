
package tallermecanico;


public class RChapaYPintura extends Reparacion{

    public RChapaYPintura(String descripcion) {
        super(descripcion);
    }
    
    
    public String toString(){
    
        return super.toString()+"\nPrecio final: "+calcularPrecio();
    }
    
    @Override
    public double calcularPrecio() {
        
        double precio= numeroHoras*30 +precioMaterial*1.3;
        
        
        return precio;
    }
    
}
