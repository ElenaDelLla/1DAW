package carniceriamanolo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class CarniceriaManolo {

    public static ArrayList<Producto> listaProductos = new ArrayList<Producto>();
    public static ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();
    public static double gananciaAcumulada;
    public static final String FICHERO_USUARIO = "usuarios.bin";
    public static final String FICHERO_PRODUCTOS = "productos.bin";
    public static final String FICHERO_GANANCIA = "ganancia.txt";
    public static Usuario usuarioActual = null;

    public static boolean leerFicheroUsuarios() {
        ObjectInputStream leerFichero = null;
        boolean existe = false;
        try {
            leerFichero = new ObjectInputStream(new FileInputStream(FICHERO_USUARIO));
            listaUsuarios = (ArrayList<Usuario>) leerFichero.readObject();
            existe = true;
        } catch (ClassNotFoundException e) {
            System.out.println("El contenido del fichero de usuarios no es válido");
        } catch (FileNotFoundException e) {
            System.out.println("El fichero de usuarios no existe");
        } catch (IOException e) {
            System.out.println("Error leyendo el fichero de usuarios");
        } catch (Exception e) {
            System.out.println("Error transformando el objeto en el fichero de usuarios");
        } finally {
            try {
                if (leerFichero != null) {
                    leerFichero.close();
                }

            } catch (IOException e) {
                System.out.println("Error cerrando el fichero de usuarios");
            }
        }

        return existe;
    }

    public static void leerFicheroProductos() {
        ObjectInputStream leerFichero = null;

        try {
            leerFichero = new ObjectInputStream(new FileInputStream(FICHERO_PRODUCTOS));
            listaProductos = (ArrayList<Producto>) leerFichero.readObject();

        } catch (ClassNotFoundException e) {
            System.out.println("El contenido del fichero de productos no es válido");
        } catch (FileNotFoundException e) {
            System.out.println("No se ha encontrado el fichero de productos");
        } catch (IOException e) {
            System.out.println("Error leyendo el fichero de productos");
        } catch (Exception e) {
            System.out.println("Error transformado el objeto del fichero de productos");
        } finally {
            try {
                if (leerFichero != null) {
                    leerFichero.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero de productos");
            }
        }
    }

    public static void leerFicheroGanancia() {

        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(FICHERO_GANANCIA));
            gananciaAcumulada = Double.valueOf(br.readLine());
        } catch (IOException e) {
            System.out.println("Error leyendo el fichero ganancias");
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero");
            }
        }
    }

    public static void escribirFicheroUsuarios() {
        ObjectOutputStream escribirFichero = null;

        try {
            escribirFichero = new ObjectOutputStream(new FileOutputStream(FICHERO_USUARIO));
            escribirFichero.writeObject(listaUsuarios);
        } catch (FileNotFoundException e) {
            System.out.println("No se ha encontrado el fichero de usuarios");
        } catch (IOException e) {
            System.out.println("Error escribiendo el fichero de usuarios");
        } finally {
            try {
                if (escribirFichero != null) {
                    escribirFichero.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero de usuarios");
            }
        }

    }

    public static void escribirFicheroProductos() {
        ObjectOutputStream escribirFichero = null;
        try {
            escribirFichero = new ObjectOutputStream(new FileOutputStream(FICHERO_PRODUCTOS));
            escribirFichero.writeObject(listaProductos);
        } catch (FileNotFoundException e) {
            System.out.println("El fichero de productos no se ha encontrado");
        } catch (IOException e) {
            System.out.println("Error escribiendo el fichero");
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

    public static void escribirFicheroGanancia() {
        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(new FileWriter(FICHERO_GANANCIA));
            bw.write(String.valueOf(gananciaAcumulada));

        } catch (IOException e) {
            System.out.println("Error escribiendo el fichero de ganacias");
        } finally {
            try {
                if (bw != null) {
                    bw.close();
                }
            } catch (IOException e) {
                System.out.println("Error cerrando el fichero de ganancias");
            }
        }
    }

    public static boolean iniciarAplicacion() {
        if (leerFicheroUsuarios()) {
            leerFicheroGanancia();
            leerFicheroProductos();
            return true;
        }
        return false;
    }

    public static void menuAdmin() {

        String[] opciones = {"Mostrar todos los productos", "Mostrar producto por código/descripcion",
            "Añadir producto/modificar stock", "Mostar ganancia", "Dar de alta a un usuario",
            "Desconectar", "Salir"};
        int opcion = Utili.menu(opciones);
        boolean desconectado = false;
        while (opcion != 7 && !desconectado) {
            switch (opcion) {
                case 1:
                    mostarProductos();
                    break;
                case 2:
                    mostarProductoPorCodigoDescripcion();
                    break;
                case 3:
                    aniadirProductoModificarStock();
                    break;
                case 4:
                    mostrarGanacia();
                    break;
                case 5:
                    altaUsuario();
                    break;
                case 6:
                    desconectar();
                    desconectado = true;
                    break;

            }
            if (!desconectado) {
                opcion = Utili.menu(opciones);
            }
        }

        if (opcion == 7) {
            salir();
        }
        if (desconectado) {
            menuInvitado();
        }
    }

    public static void menuCliente() {

        String[] opciones = {"Mostrar todos los productos", "Mostrar producto por código/descripcion",
            "Comprar", "Desconectar", "Salir"};
        int opcion = Utili.menu(opciones);
        boolean desconectado = false;
        while (opcion != 5 && !desconectado) {
            switch (opcion) {
                case 1:
                    mostarProductos();
                    break;
                case 2:
                    mostarProductoPorCodigoDescripcion();
                    break;
                case 3:
                    comprar();
                    break;
                case 4:
                    desconectar();
                    desconectado = true;
                    break;

            }
            if (!desconectado) {
                opcion = Utili.menu(opciones);
            }
        }

        if (opcion == 5) {
            salir();
        }
        if (desconectado) {
            menuInvitado();
        }
    }

    public static void menuInvitado() {

        String[] opciones = {"Mostrar todos los productos", "Mostrar producto por código/descripcion",
            "Registrar", "Login", "Salir"};

        int opcion = Utili.menu(opciones);
        boolean login = false;
        while (opcion != 5 && !login) {
            switch (opcion) {
                case 1:
                    mostarProductos();
                    break;
                case 2:
                    mostarProductoPorCodigoDescripcion();
                    break;
                case 3:
                    registar();
                    break;
                case 4:
                    login();
                    login = true;
                    break;
            }
            if (!login) {
                opcion = Utili.menu(opciones);
            }

        }
        if (opcion == 5) {
            salir();
        }
        if (login) {
            if (usuarioActual == null) {
                menuInvitado();
            } else if (usuarioActual instanceof Administrador) {
                menuAdmin();
            } else if (usuarioActual instanceof Cliente) {
                menuCliente();
            }
        }
    }

    public static void registar() {

        Scanner sc = new Scanner(System.in);
        System.out.println("Indica los datos para registarte como cliente");
        System.out.println("Nombre: ");
        String nombre = sc.nextLine();
        System.out.println("Contraseña: ");
        String pass = sc.nextLine();

        Usuario u = new Cliente(nombre, pass);
        listaUsuarios.add(u);
        usuarioActual = u;
    }

    public static void login() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nombre: ");
        String nombre = sc.nextLine();
        boolean encontrado = false;
        Iterator<Usuario> it = listaUsuarios.iterator();
        while (it.hasNext()) {
            Usuario usuario = it.next();
            if (usuario.getNombre().equals(nombre)) {
                encontrado = true;
                System.out.println("Contraseña: ");
                String pass = sc.nextLine();
                if (usuario.getPassword().equals(pass)) {
                    usuarioActual = usuario;
                    System.out.println("Usuario conectado correctamente");
                } else {
                    System.out.println("Contraseña incorrecta");
                }
            }

        }
        if (!encontrado) {
            System.out.println("No existe ningún usuario con ese nombre");
        }

    }

    public static void comprar() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica el código del producto que quieres comprar");
        int codigo = Utili.leerInt();

        Iterator<Producto> it = listaProductos.iterator();
        while (it.hasNext()) {
            Producto producto = it.next();
            if (producto.getCodigo() == codigo) {
                System.out.println("Cantidad del producto: ");
                int cantidad = Utili.leerInt();
                if (producto.getStock() >= cantidad) {
                    producto.modificarStock(producto.getStock() - cantidad);
                    gananciaAcumulada += cantidad * producto.getPrecio();
                    System.out.println("Producto comprado corectamente");
                }
            }

        }

    }

    public static void mostarProductos() {

        Iterator<Producto> it = listaProductos.iterator();
        while (it.hasNext()) {
            Producto producto = it.next();
            System.out.println(producto.toString());
        }
    }

    public static void mostarProductoPorCodigoDescripcion() {

        Scanner sc = new Scanner(System.in);
        System.out.println("¿Qué quieres buscar?");
        String busqueda = sc.nextLine();

        Iterator<Producto> it = listaProductos.iterator();
        while (it.hasNext()) {
            Producto producto = it.next();
            if (producto.getDescripcion().contains(busqueda) || String.valueOf(producto.getCodigo()).contains(busqueda)) {
                System.out.println(producto);
            }
        }
    }

    public static void aniadirProductoModificarStock() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica el código del producto que quieres buscar");
        int codigo = Utili.leerInt();
        boolean existe = false;
        Iterator<Producto> it = listaProductos.iterator();
        while (it.hasNext()) {
            Producto producto = it.next();

            if (producto.getCodigo() == codigo) {
                existe = true;
                System.out.println("Indica el stock actualizado");
                int stockActualizado = Utili.leerInt();
                producto.modificarStock(stockActualizado);
            }
        }
        if (!existe) {
            System.out.println("El rpducto no existe, tienes que añadirlo a la lista");
            System.out.println("Descripcion: ");
            String descripcion = sc.nextLine();
            System.out.println("Stock: ");
            int stock = Utili.leerInt();
            System.out.println("Precio: ");
            Double precio = Utili.leerDouble();

            Producto p = new Producto(codigo, descripcion, stock, precio);
            listaProductos.add(p);
        }
    }

    public static void mostrarGanacia() {
        System.out.println("Ganancia acumulada:" + gananciaAcumulada);
    }

    public static void altaUsuario() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica los datos del usuario que quieres crear");
        System.out.println("Nombre: ");
        String nombre = sc.nextLine();
        System.out.println("Contraseña: ");
        String pass = sc.nextLine();

        String tipoUsuario = sc.nextLine();

        while (!tipoUsuario.equalsIgnoreCase("Administrador") || !tipoUsuario.equalsIgnoreCase("cliente")) {
            System.out.println("¿Qué tipo de usuario quieres crear?(Administrador o cliente)");
            tipoUsuario = sc.nextLine();
        }
        if (tipoUsuario.equalsIgnoreCase("administrador")) {
            Usuario u = new Administrador(nombre, pass);
            listaUsuarios.add(u);
        } else {
            Usuario u = new Cliente(nombre, pass);
            listaUsuarios.add(u);
        }

    }

    public static void desconectar() {
        usuarioActual = null;
    }

    public static void salir() {
        escribirFicheroGanancia();
        escribirFicheroProductos();
        escribirFicheroUsuarios();
    }

    public static void crearAdministrador() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indica los datos del usuario que quieres crear");
        System.out.println("Nombre: ");
        String nombre = sc.nextLine();
        System.out.println("Contraseña: ");
        String pass = sc.nextLine();

        Usuario u = new Administrador(nombre, pass);
        listaUsuarios.add(u);
        usuarioActual = u;

    }

    public static void main(String[] args) {
        if (iniciarAplicacion()) {
            menuInvitado();
        } else {
            crearAdministrador();
            menuAdmin();
        }
    }

}
