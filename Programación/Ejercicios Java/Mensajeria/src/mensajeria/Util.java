/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mensajeria;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 *
 * @author Elena
 */
public class Util {
  
    public static int leerInt(){
        Scanner sc = new Scanner(System.in);
        while (true) {            
            try {
                return sc.nextInt();
            } catch (InputMismatchException e) {
                System.out.println("El valor introducido no es válido, vuelve a intentarlo");
            }
        }
    
    }
    public static int menu(String[] lista){
    
        int opcion = 0;
        while (opcion < 1 || opcion > lista.length) {            
            for (int i = 0; i < lista.length; i++) {
                
                System.out.println((i+1)+". "+lista[i]);
            }
            opcion = Util.leerInt();
        }
    return opcion;
    }
}
