
package gestion;


public class Encargado extends Empleado{

    public Encargado(String nombre, int aniosExperiencia, int anioIngreso) {
        super(nombre, aniosExperiencia, anioIngreso);
        codigoEmpleado= generarCodigoEmpleado();
        contador++;
    }

    @Override
    public String generarCodigoEmpleado() {
        
           String sufijo = contador+"";
        
        while (sufijo.length() < 4) {            
            
            sufijo = "0"+contador;
        }
        return "01"+sufijo;
    }
        
        public String toString(){
            return "Enacargado: \n"+super.toString();
        }
    }
    
    
    

