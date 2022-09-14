
package pendientes2022;

import java.io.Serializable;


public abstract class Envio implements Serializable{
    protected int numeroEnvio;
    protected String nombreRemitente;
    protected String direccionRemitente;
    protected String cpRemitente;
    protected String nombreDstinatario;
    protected String direccionDestinatario;
    protected String cpDestinatario;
    
    protected static int contador=1;

    public Envio(String nombreRemitente, String direccionRemitente, String cpRemitente, String nombreDstinatario, String direccionDestinatario, String cpDestinatario) {
        this.numeroEnvio = contador;
        this.nombreRemitente = nombreRemitente;
        this.direccionRemitente = direccionRemitente;
        this.cpRemitente = cpRemitente;
        this.nombreDstinatario = nombreDstinatario;
        this.direccionDestinatario = direccionDestinatario;
        this.cpDestinatario = cpDestinatario;
        contador++;
    }

    public int getNumeroEnvio() {
        return numeroEnvio;
    }
    
    public String toString(){
    
        return "Numero envio: "+numeroEnvio+"\nNombre remitente: "+nombreRemitente+"\nDireccion remitente: "+direccionRemitente+"\nCódigo postal remitente: "+cpRemitente+
                "\nNombre destinatario: "+nombreDstinatario+"\nDireccion destinatario: "+direccionDestinatario+"\nCódigo postal destinatario: "+cpDestinatario;
    }
    
           
            

}
