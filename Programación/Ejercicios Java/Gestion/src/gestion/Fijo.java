
package gestion;


public class Fijo extends Camarero{
    
    public Fijo(String nombre, int aniosExperiencia, int anioIngreso) {
        super(nombre, aniosExperiencia, anioIngreso);
        codigoEmpleado= generarCodigoEmpleado();
        contador++;
    }
  
    
    
}
