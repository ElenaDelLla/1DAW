
package tallermecanico;


public abstract class Reparacion extends Trabajo implements IMaterial{
    
    protected double precioMaterial;  
    

    public Reparacion(String descripcion) {
        super(descripcion);
        precioMaterial=0;        
    }

    @Override
    public void usarMaterial(double precio) {
        if (!finalizado) {
            
            precioMaterial+=precio;
        }
       
    }
    @Override
    public String toString(){
    
        return super.toString()+"\nPrecio material"+precioMaterial;
    }

   
    
    
}
