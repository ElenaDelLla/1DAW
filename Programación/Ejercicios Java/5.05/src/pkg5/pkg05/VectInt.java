package pkg5.pkg05;

import java.util.Scanner;

public class VectInt {

    private int[] lista;

    public VectInt(int a) {
        lista = new int[a];
    }

    public void cargar() {

        Scanner sc = new Scanner(System.in);

        for (int i = 0; i < lista.length; i++) {
            System.out.println("Introduce el valor de la posición " + i);
            lista[i] = sc.nextInt();
        }
    }

    public void cargar(int a, int b) {
        for (int i = 0; i < lista.length; i++) {
            lista[i] = (int) (Math.random() * (b - a + 1) + a);
        }
    }

    public double promedio() {
        double suma = 0;
        double media = 0;

        for (int i = 0; i < lista.length; i++) {
            suma += lista[i];
        }
        media = suma / lista.length;
        return media;
    }

    public int moda() {
        int ocurrenciasDeNumeroModa = 0;
        int numeroModa = lista[0];
        for (int primerRecorrido = 0; primerRecorrido < lista.length; primerRecorrido++) {
            // numero veces que ocurre lista[i]
            int ocurrenciasNumeroActual = 0;
            // Recorremos otra vez el array para ver cuantas veces encontramos el valor lista[i] dentro del array
            for (int segundoRecorrido = 0; segundoRecorrido < lista.length; segundoRecorrido++) {
                if (lista[segundoRecorrido] == lista[primerRecorrido]) {
                    ocurrenciasNumeroActual++;
                }
            }
            // Si el numero actual ocurre mas veces que el que teniamos hasta ahora, actualizo los valores de moda y 
            if (ocurrenciasNumeroActual > ocurrenciasDeNumeroModa) {
                numeroModa = lista[primerRecorrido];
                ocurrenciasDeNumeroModa=ocurrenciasNumeroActual;
            }
        }
        return numeroModa;
    }

   public int suma(){
       int suma=0;
       
       for(int i=0;i<lista.length;i++){
           suma+=lista[i];
       }
       return suma;
   } 

    @Override
    public String toString() {
        String vector="(";
        
        for(int i=0;i<lista.length;i++){
            vector+=lista[i];
            if(i!=lista.length-1){
                vector+=",";
            }
        vector +=")";
        return vector;
        
            
        }
    
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
