
package gestion;


public class Cocinero extends Empleado{

    public Cocinero(String nombre, int aniosExperiencia, int anioIngreso) {
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
        return "02"+sufijo;
    }
    @Override
    public String toString(){
    
        return "Cocinero:\n"+super.toString();
    }
    
}
