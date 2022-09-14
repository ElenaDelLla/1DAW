package pkg10;

import java.util.ArrayList;
import java.util.Iterator;

public class Main {

    //public static ArrayList<Producto> lista = new ArrayList<Producto>();
    public static ArrayList<Producto> generarLista() {
        int numElementos = (int) (Math.random() * (8 - 1 + 1) + 1);

        ArrayList<Producto> lista = new ArrayList<Producto>();

        for (int i = 0; i < numElementos; i++) {
            lista.add(new Producto());
        }
        return lista;
    }

    public static void mostrarTicket(ArrayList<Producto> lista) {

        System.out.println("***********Cantidad****Precio*****Total");

        Iterator recorreLista = lista.iterator();

        double precioFinal = 0.0;

        while (recorreLista.hasNext()) {
            Producto producto = (Producto) recorreLista.next();
            double precioTotal = producto.getCantidad() * producto.getPrecio();
            precioFinal += precioTotal;
            System.out.println(producto.getNombre() + "\t" + producto.getCantidad() + "\t" + producto.getPrecio() + "\t" + precioTotal);
        }
        System.out.println("Precio final" + "\t\t\t" + precioFinal);

    }

    public static void main(String[] args) {
        ArrayList<Producto> lista = generarLista();
        mostrarTicket(lista);
    }

}
