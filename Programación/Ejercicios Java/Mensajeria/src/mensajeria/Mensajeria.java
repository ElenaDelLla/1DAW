/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mensajeria;

import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class Mensajeria {

    public static ArrayList<Mensaje> listaMensajes = new ArrayList<Mensaje>();
    public static final String FICHERO_MENSAJES = "mensajes.dat";

    public static void iniciarAplicacion() {
        ObjectInputStream leerFichero = null;

        try {
            leerFichero = new ObjectInputStream(new FileInputStream(FICHERO_MENSAJES));
            listaMensajes = (ArrayList<Mensaje>) leerFichero.readObject();
        } catch (ClassNotFoundException e) {
            System.out.println("El contenido del fichero no es válido");
        } catch (FileNotFoundException e) {
            System.out.println("No se ha encontrado el fichero");
        } catch (IOException e) {
            System.out.println("Error leyendo el fichero");
        } catch (Exception e) {
            System.out.println("Error transformando el fichero");
        } finally {
            try {
                if (leerFichero != null) {
                    leerFichero.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero");
            }
        }

    }

    public static void menu() {

        String[] opciones = {"Listar todos los mensajes", "Mostar mensajes normales", "Mostar mensajes encriptados",
            "Buscar mensaje", "Añadir mensaje", "Desencriptar mensaje", "Eliminar mensaje", "Salir"};
        int opcion = Util.menu(opciones);
        while (opcion != 8) {
            switch (opcion) {
                case 1:
                    listarTodosMensajes();
                    break;
                case 2:
                    mostarMensajesNormales();
                    break;
                case 3:
                    mostarMensajesEncriptados();
                    break;
                case 4:
                    buscarMensaje();
                    break;
                case 5:
                    aniadirMensaje();
                    break;
                case 6:
                    desencriptarMensaje();
                    break;
                case 7:
                    eliminarMensaje();
                    break;

            }
            opcion = Util.menu(opciones);
        }
        if (opcion == 8) {
            salir();
        }
    }

    public static void escribirFicheroTexto(String texto, String nombreFichero) {

        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(new FileWriter(nombreFichero));
            bw.write(texto);
        } catch (FileNotFoundException e) {
            System.out.println("No se encuentra el fichero");

        } catch (IOException e) {
            System.out.println("Error escribiendo el fichero");
        } finally {
            try {
                if (bw != null) {
                    bw.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero de texto");
            }
        }

    }

    public static void listarTodosMensajes() {

        Scanner sc = new Scanner(System.in);
        System.out.println("¿Cómo quieres ves los mensajes? por pantalla o en fichero");
        String respuesta = sc.nextLine();

        Iterator<Mensaje> it = listaMensajes.iterator();

        while (!respuesta.equalsIgnoreCase("por pantalla") && !respuesta.equalsIgnoreCase("en fichero")) {
            System.out.println("¿Cómo quieres ves los mensajes? por pantalla o en fichero");
            respuesta = sc.nextLine();
        }

        if (respuesta.equalsIgnoreCase("por pantalla")) {
            while (it.hasNext()) {
                Mensaje mensaje = it.next();
                System.out.println(mensaje);
            }
        } else if (respuesta.equalsIgnoreCase("en fichero")) {
            System.out.println("Indica el nombre del fichero");
            String nombreFichero = sc.nextLine();
            String texto = "";
            while (it.hasNext()) {
                Mensaje mensaje = it.next();
                texto += mensaje + "\n";
            }
            escribirFicheroTexto(texto, nombreFichero);
        }

    }

    public static void mostarMensajesNormales() {

        Iterator<Mensaje> it = listaMensajes.iterator();
        while (it.hasNext()) {
            Mensaje mensaje = it.next();

            if (mensaje instanceof SinEncriptar) {
                System.out.println(mensaje);
            }
        }
    }

    public static void mostarMensajesEncriptados() {
        Iterator<Mensaje> it = listaMensajes.iterator();
        while (it.hasNext()) {
            Mensaje mensaje = it.next();
            if (mensaje instanceof Encriptado) {
                System.out.println(mensaje);
            }

        }
    }

    public static void buscarMensaje() {
        Scanner sc = new Scanner(System.in);
        boolean encontrado = false;
        System.out.println("Indica el código del mensaje que quieres buscar");
        int codigo = Util.leerInt();
        Iterator<Mensaje> it = listaMensajes.iterator();
        while (it.hasNext() && !encontrado) {
            Mensaje mensaje = it.next();
            if (mensaje.getCodigo() == codigo) {
                encontrado=true;
                System.out.println(mensaje);
            }
        }
        if (!encontrado) {
            System.out.println("El mensaje indicado no existe");
        }

    }

    public static void aniadirMensaje() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica los datos del mensaje que quieres añadir");

        System.out.println("Texto del mensaje: ");
        String texto = sc.nextLine();

        System.out.println("¿Qué tipo de mensaje quieres añadir?(encriptado o normal)");
        String tipoMensaje = sc.nextLine();

        while (!tipoMensaje.equalsIgnoreCase("encriptado") && !tipoMensaje.equalsIgnoreCase("normal")) {
            System.out.println("¿Qué tipo de mensaje quieres añadir?(encriptado o normal)");
            tipoMensaje = sc.nextLine();
        }
        if (tipoMensaje.equalsIgnoreCase("encriptado")) {
            Mensaje m = new Encriptado(listaMensajes.size(), texto);
            listaMensajes.add(m);
            System.out.println("Mensaje enncriptado añadido");
        } else if (tipoMensaje.equalsIgnoreCase("normal")) {
            Mensaje m = new SinEncriptar(listaMensajes.size(), texto);
            listaMensajes.add(m);
            System.out.println("Mensaje normal añadido");
        }

    }

    public static void desencriptarMensaje() {
        Scanner sc = new Scanner(System.in);
        boolean encontrado = false;

        System.out.println("Indica el código del mensaje que quieres desenciptar");
        int codigo = Util.leerInt();

        Iterator<Mensaje> it = listaMensajes.iterator();
        while (it.hasNext() && !encontrado) {
            Mensaje mensaje = it.next();
            if (mensaje instanceof Encriptado) {
                encontrado = true;
                System.out.println(((Encriptado) mensaje).desencriptar());
            }
        }
        if (!encontrado) {
            System.out.println("El mensaje no se ha encontrado");
        }

    }

    public static void actualizarCodigos() {
        for (int i = 0; i < listaMensajes.size(); i++) {
            Mensaje mensaje = listaMensajes.get(i);
            mensaje.setCodigo(i);
        }
    }

    public static void eliminarMensaje() {
        Scanner sc = new Scanner(System.in);
        boolean encontrado = false;
        System.out.println("Indica el código del mensaje que quieres eliminar");
        int codigo = Util.leerInt();

        Iterator<Mensaje> it = listaMensajes.iterator();
        while (it.hasNext() && !encontrado) {
            Mensaje mensaje = it.next();
            if (mensaje.getCodigo() == codigo) {
                encontrado = true;
                listaMensajes.remove(mensaje);
            }
        }
        if (!encontrado) {
            System.out.println("No se ha encontrado el mensaje que quieres eliminar");
        } else {
            actualizarCodigos();
        }
    }

    public static void salir() {

        ObjectOutputStream escribirFichero = null;
        try {
            escribirFichero = new ObjectOutputStream(new FileOutputStream(FICHERO_MENSAJES));
            escribirFichero.writeObject(listaMensajes);
        } catch (FileNotFoundException e) {
            System.out.println("No se encuentra el fichero");
        } catch (IOException e) {
            System.out.println("Error escribiebdo el fichero");
        } finally {
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
