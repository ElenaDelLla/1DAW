
package tiendaropa;


public class Prefabricado extends Traje{
    
    private String talla;

    public Prefabricado(String talla, String descripcion, double precioTotal) {
        super(descripcion, precioTotal);
        this.talla = talla;
    }
    
    public String toString(){
    
        return super.toString()+"\nTalla: "+talla;
    
    }
    
}
