
package gestion;


public abstract class Camarero extends Empleado{
    
    public Camarero(String nombre, int aniosExperiencia, int anioIngreso) {
        super(nombre, aniosExperiencia, anioIngreso);
        
    }
    
    public String generarCodigoEmpleado(){
        
     String sufijo = contador+"";
        
        while (sufijo.length() < 4) {            
            
            sufijo = "0"+contador;
        }
        
     return "03"+sufijo;
}
    public String toString(){
        
        return "\nCamarero"+super.toString();
    }
}
