
package carniceriamanolo;

import java.io.Serializable;


public abstract class Usuario implements Serializable{
    
    protected String nombre;
    protected String password;

    public Usuario(String nombre, String password) {
        this.nombre = nombre;
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public String getPassword() {
        return password;
    }
    
    
   public String toString(){
       return "Nombre: "+nombre+"\nPassword: "+password;
   }
}
