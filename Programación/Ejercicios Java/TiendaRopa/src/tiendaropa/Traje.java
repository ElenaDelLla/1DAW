
package tiendaropa;


public abstract class Traje {
    
    protected String descripcion;
    protected double precioTotal;
    protected String numeroPedido;
    protected Fecha fecha;
    
    private static int contador=0;

    public Traje(String descripcion, double precioTotal) {
        this.descripcion = descripcion;
        this.precioTotal = precioTotal;
        fecha = new Fecha();
        numeroPedido="TR"+generarPedido();
        contador++;
    }

    public Fecha getFecha() {
        return fecha;
    }
    
    public String generarPedido(){
        
        String sufijo = contador+"";
        
        while (sufijo.length() < 5) {            
            
            sufijo = "0"+sufijo;
        }
    
        return sufijo;
    }

 
    public String getNumeroPedido(){
        return numeroPedido;
    }
    
    public String toString(){
    
        return "Numero de pedido: "+numeroPedido+"\n"+fecha.toString()+"\nDescripcion: "+descripcion+"\nPrecio total: "+precioTotal;
    
    }
}
