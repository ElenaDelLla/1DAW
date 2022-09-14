package pkg5.pkg04;

import java.util.Scanner;

public class Alturas {

    private float alturas[] = new float[5];

    public Alturas() {
    }

    public Alturas(float a, float b, float c, float d, float e) {
        alturas[0] = a;
        alturas[1] = b;
        alturas[2] = c;
        alturas[3] = d;
        alturas[4] = e;

    }

    public void cargar() {
        Scanner sc = new Scanner(System.in);

        for (int i = 0; i < alturas.length; i++) {
            System.out.println("Introduce la altura para la posicion " + i);
            alturas[i] = sc.nextFloat();
        }
    }

    public float calcularPromedio() {
        float suma = 0;
        float media = 0;
        for (int i = 0; i < alturas.length; i++) {
            suma += alturas[i];

        }
        media = suma / alturas.length;
        return media;
    }

    public int mayoresPromedio() {
        int contador = 0;
        float media = calcularPromedio();
        for (int i = 0; i < alturas.length; i++) {
            if (alturas[i] > media) {
                contador++;
            }
        }
        return contador;
    }
    
    public int menoresPromedio(){
        int contador=0;
        float media=calcularPromedio();
        
            for(int i=0; i<alturas.length;i++){
                if(alturas[i]<media){
                    contador++;
                }
            }
        return contador;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
