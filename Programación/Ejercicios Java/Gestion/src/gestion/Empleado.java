

package gestion;

public abstract class Empleado {
    
    protected String nombre;
    protected int aniosExperiencia;
    protected int anioIngreso;
    protected String codigoEmpleado;
    
    protected static int contador=0;
    

    public Empleado(String nombre, int aniosExperiencia, int anioIngreso) {
        this.nombre = nombre;
        this.aniosExperiencia = aniosExperiencia;
        this.anioIngreso = anioIngreso;
        
    }
    public abstract String generarCodigoEmpleado();
    
    @Override
    
    public String toString(){
    
        return "Nombre: "+nombre+"\nAño de experiencia: "+aniosExperiencia+"\nAño de ingreso: "+anioIngreso;
    }

    public String getCodigoEmpleado() {
        return codigoEmpleado;
    }
}
