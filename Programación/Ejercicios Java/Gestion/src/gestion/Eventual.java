
package gestion;


public class Eventual extends Camarero implements ILlamable{
    
    
    private int telefono;

    public Eventual(int telefono, String nombre, int aniosExperiencia, int anioIngreso) {
        super(nombre, aniosExperiencia, anioIngreso);
        this.telefono = telefono;
        codigoEmpleado= generarCodigoEmpleado();
        contador++;
    }

    @Override
    public void llamar() {
          System.out.println("Llamando al número de telefono del empleado...");
    } 
}
