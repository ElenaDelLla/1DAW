
package mensajeria;


public class Encriptado extends Mensaje implements IEncriptable{

    public Encriptado(int codigo, String texto) {
        super(codigo, texto);
        this.texto=encriptar(texto);
    }

    @Override
    public String encriptar(String texto) {
        
        String encriptao = "";
        
        for (int i = 0; i < texto.length(); i++) {
            encriptao+=(char)(texto.charAt(i)+1);
        }
        return encriptao;
    }

    @Override
    public String desencriptar() {
       String desencriptado = "";
        for (int i = 0; i < texto.length(); i++) {
            desencriptado+= (char)(texto.charAt(i)-1);
        }
        return desencriptado;
    }
    
}
