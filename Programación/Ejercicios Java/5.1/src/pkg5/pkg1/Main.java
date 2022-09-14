/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg5.pkg1;

/**
 *
 * @author G08
 */
public class Main {

    boolean esCorrecto(String email) {
        // empezamos considerando el email como NO valido, solo si cumple las condiciones será valido
        boolean emailValido = false;
        // Comprobamos si contiene el caracter @
        if (email.contains("@")) {
            // Dividimos el email en trozos, utilizando de caracter "de corte" la @
            String[] partes = email.split("@");
            // Comprobamos si tiene dos trozos, si tiene más de 2 es que tiene varias arrobas, y si solo tiene uno es que el email acaba con una @ (no seria valido)
            if (partes.length == 2) {
                // Comprobamos que en la parte derecha de la @ haya al menos un punto
                String segundaParte = partes[1];
                if (segundaParte.contains(".")) {
                    // comprobamos que el ultimo caracter de la parte tras la arroba no sea un punto (miramos la ultima posicion del string)
                    if (!segundaParte.endsWith(".")) {
                        emailValido = true;
                    }
                }
            }
        }
        return emailValido;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        System.out.println(esCorrecto("migue@migue.es"));

    }

}
