package pendientes2022;

public class ConSeguimiento extends Envio implements ISeguimiento{

    private String codigoSeguimiento;

    public ConSeguimiento(String nombreRemitente, String direccionRemitente, String cpRemitente, String nombreDstinatario, String direccionDestinatario, String cpDestinatario) {
        super(nombreRemitente, direccionRemitente, cpRemitente, nombreDstinatario, direccionDestinatario, cpDestinatario);
        codigoSeguimiento = "PK" + generarCodigo();
    }

    public String generarCodigo() {
        String sufijo = ""+numeroEnvio;
        while (sufijo.length() != 5) {
            sufijo="0"+sufijo;
        }
        return sufijo+cpDestinatario;
    }

    @Override
    public void mostarSeguimiento() {
        System.out.println("Mostrando seguimiento del envío "+codigoSeguimiento);
    }
    
    public String getCodigoSeguimiento(){
        return codigoSeguimiento;
    }
    
    @Override
    public String toString(){
        return super.toString()+" Num seguimiento: "+codigoSeguimiento;
    }
    
}
