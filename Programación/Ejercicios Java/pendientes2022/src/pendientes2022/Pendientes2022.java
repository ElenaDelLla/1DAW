
package pendientes2022;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;


public class Pendientes2022 {
public static ArrayList<Envio> listaEnvios = new ArrayList<Envio>();
public static final String FICHERO_ENVIOS = "envios.bin";
public static void iniciarAplicacion(){
    ObjectInputStream leerFichero = null;
    try {
        leerFichero = new ObjectInputStream(new FileInputStream(FICHERO_ENVIOS));
        listaEnvios = (ArrayList<Envio>) leerFichero.readObject();
        
    } catch (ClassNotFoundException e) {
        System.out.println("El contenido del ficheor no es válido");
    }
    catch(FileNotFoundException e){
        System.out.println("No se encuentra el fichero");
    }
    catch(IOException e){
        System.out.println("Error leyendo el fichero");
    }
    catch(Exception e){
        System.out.println("Error transformando el objeto");
    }
    finally{
        try {
            if (leerFichero != null) {
                leerFichero.close();
            }
        } catch (IOException e) {
            System.out.println("Error cerrando el fichero");
        }
    }
    

}
public static void menu(){

    String[] opciones ={"Nuevo envio","Envío entregado","Listado de envíos","Mostar seguimiento","Salir"};
    
    int opcion = Util.menu(opciones);
    
    while (opcion != 5) {        
        switch(opcion){
            case 1: nuevoEnvio();
                break;
            case 2: envioEntregado();
                break;
            case 3: listadoEnvio();
                break;
            case 4: mostarSeguimiento();
                break;
        
        }
        
        opcion= Util.menu(opciones);
    }
    
    if (opcion== 5) {
        salir();
    }
}
public static void nuevoEnvio(){
    
    Scanner sc = new Scanner (System.in);
    System.out.println("Nombre del remitente: ");
    String nombreRemitente = sc.nextLine();
    System.out.println("Direccion del remitente: ");
    String direccionRemitente = sc.nextLine();
    System.out.println("Código postal del remitente: ");
    String cpRemitente = sc.nextLine();
    
     System.out.println("Nombre del destinatario: ");
    String nombreDstinatario = sc.nextLine();
    System.out.println("Direccion del destinatario: ");
    String direccionDestinatario = sc.nextLine();
    System.out.println("Código postal del destinatario: ");
    String cpDestinatario = sc.nextLine();
    
    System.out.println("¿qué tipo de envío quieres hacer?(Ordinario o con seguimento)");
    String tipoEnvio = sc.nextLine();
    
    if (tipoEnvio.equalsIgnoreCase("ordinario")) {
        Envio e = new Ordinario(nombreRemitente, direccionRemitente, cpRemitente, nombreDstinatario, direccionDestinatario,cpDestinatario);
        listaEnvios.add(e);
    }else if(tipoEnvio.equalsIgnoreCase("con seguimiento")){
        Envio e = new ConSeguimiento (nombreRemitente, direccionRemitente, cpRemitente, nombreDstinatario, direccionDestinatario,cpDestinatario);
        listaEnvios.add(e);
    }
    
     
}
public static void envioEntregado(){
    Scanner sc = new Scanner(System.in);
    
    System.out.println("Indica el código de envio que has recibido");
    String codigoEnvio = sc.nextLine();
    
    Iterator<Envio> it = listaEnvios.iterator();
    while (it.hasNext()) {
        Envio envio = it.next();
        if (codigoEnvio.equals(envio.getNumeroEnvio() )) {
            listaEnvios.remove(envio);
        }
    }
}
public static void listadoEnvio(){
    
    Iterator<Envio> it = listaEnvios.iterator();
    while (it.hasNext()) {
        Envio envio = it.next();
        System.out.println(envio);
    }
}
public static void mostarSeguimiento(){
    
    Scanner sc = new Scanner(System.in);
    
    System.out.println("Indica el código de seguimiento");
    String codigoSeguimiento = sc.nextLine();
    
    Iterator<Envio> it = listaEnvios.iterator();
    while (it.hasNext()) {
        Envio envio = it.next();
        if (envio instanceof ConSeguimiento && codigoSeguimiento.equals(((ConSeguimiento)envio).getCodigoSeguimiento())) {
            if (envio instanceof ConSeguimiento) {
                ((ConSeguimiento) envio).mostarSeguimiento();
            }
 
        }
    }
    
}
public static void salir(){
    
    ObjectOutputStream escribirFichero = null;
    
    try {
        escribirFichero = new ObjectOutputStream(new FileOutputStream(FICHERO_ENVIOS));
        escribirFichero.writeObject(listaEnvios);
    } catch (FileNotFoundException e) {
        System.out.println("No se ha encontrado el fichero");
    }
    catch(IOException e){
         System.out.println("Error escribiendo el fichero");
    }
    finally{
        try {
            if (escribirFichero != null) {
                escribirFichero.close();
            }
        } catch (IOException e) {
            System.out.println("Error cerrando el fichero");
        }
    }
}
    public static void main(String[] args) {
       iniciarAplicacion();
       menu();
    }
    
}
