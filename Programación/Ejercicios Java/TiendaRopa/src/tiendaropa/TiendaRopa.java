
package tiendaropa;

import java.util.Scanner;

public class TiendaRopa {
    public static int TAMAÑO=30;
    public static Traje lista[]= new Traje[TAMAÑO];
    public static int numeroTrajes=0;
    
    public static int menu(){
        Scanner sc = new Scanner(System.in);
        int opcion=0;
        
        while (opcion < 1 || opcion > 6) {            
            System.out.println("Indica la opcion que quieres elegir");
            System.out.println("1. Nuevo pedido");
            System.out.println("2. Listar pedidos a medida");
            System.out.println("3. Listar todos los pedidos");
            System.out.println("4. Buscar pedido");
            System.out.println("5. Eliminar pedido");
            System.out.println("6. Salir");
            
            opcion = sc.nextInt();
        }
        
        return opcion;
    }
    public static int menuTrajes(){
        Scanner sc = new Scanner(System.in);
        int opcion=0;
        
        while (opcion < 1 || opcion > 2) {            
            
            System.out.println("Elije el tipo de traje que quieres introducir en la lista");
            System.out.println("1. Taje a media");
            System.out.println("2. Traje prefabricado");
            
            opcion = sc.nextInt();
      
    }
      return opcion;
    
    }
    public static void añadirPedido(){
        Scanner sc = new Scanner(System.in);
        
        int opcion = menuTrajes();
        if (numeroTrajes == TAMAÑO) {
            
            System.out.println("La lista de pedido esta llena");
        }else{
        
        System.out.println("Descripcion: ");
        String descripcion = sc.nextLine();
        
        sc.nextLine();
        
        System.out.println("Precio total: ");
        double precioTotal = sc.nextDouble();
        
        Traje t = null;
        
        switch(opcion){
            case 1: System.out.println("Plazo de entrega: ");
                    int plazoEntrega = sc.nextInt();
                    t = new AMedida(plazoEntrega, descripcion, precioTotal);
                    break;
                    
            case 2: System.out.println("Talla: ");
                    String talla = sc.nextLine();
                    t= new Prefabricado(talla, descripcion, precioTotal);
                    break;
        }
        
        boolean encontrado =false;
        
            for (int i = 0; i < lista.length && !encontrado; i++) {
                
                if (lista[i]== null) {
                    
                    lista[i]= t;
                    numeroTrajes++;
                    encontrado= true;
                }
                
            }
        
        }
    }
    public static void listarAmedida(){
        
        for (int i = 0; i < lista.length; i++) {
            
            if (lista[i]!= null && lista[i] instanceof AMedida) {
                
                System.out.println(lista[i]);
            }
        }
    
    }
    public static void listarTodos(){
        
        for (int i = 0; i < lista.length; i++) {
            
            if (lista[i]!= null) {
                System.out.println(lista[i]);
            }
        }
    
    }
    public static void buscarPedido(){
         Scanner sc = new Scanner(System.in);
         
         boolean encontrado = false;
         
         System.out.println("Indica el codigo del pedido que quieres buscar");
         String codigo = sc.nextLine();
         
        for (int i = 0; i < lista.length && !encontrado; i++) {
            
            if (lista[i] != null && lista[i].getNumeroPedido().equals(codigo)) {
                
                System.out.println(lista[i]);
                encontrado=true;
            }
           
        }if (!encontrado) {
            System.out.println("El pedido con el cçodigo "+codigo+" no se encuentra en la lista");
        }
        
    }
    public static void  eliminarPedido(){
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Indica el código de pedido que quieres eliminar");
        String codigo = sc.nextLine();
        
        for (int i = 0; i < lista.length; i++) {
            
            if (lista[i]!= null && lista[i].getNumeroPedido().equals(codigo)) {
                
                lista[i] = null;
                 numeroTrajes--;
            }
        }
        
    
    }
   
    public static void main(String[] args) {
        
        int opcion = menu();
        
        while (opcion != 6) {            
            
               switch(opcion){
                   
                   case 1: añadirPedido();
                           break;
                   case 2: listarAmedida();
                            break;
                   case 3: listarTodos();
                            break;
                   case 4: buscarPedido();
                            break;
                   case 5: eliminarPedido();
                            break;
                   
            }
               opcion= menu();
        }
        
    }
    
}
