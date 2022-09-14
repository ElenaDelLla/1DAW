package abadia;

import java.util.Scanner;

public class Abadia {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println("Introduce el numero de montañas de la siguiente cordillera:");
        int numMontanas = sc.nextInt();

        // mientras no introduzca una cordillera con 0 montañas, sigo pidiendo cordilleras
        while (numMontanas > 0) {

            // una codillera maximo puede tener 100.000 montañas, si tiene mas, pido otra cordillera
            if (numMontanas <= 100000) {
                //inicializamos un array para guardar las alturas de las montañas de la cordillera con tamaño el numero de montañas que nos han pasado
                int[] cordillera = new int[numMontanas];
                // pedimos la altura de todas las montañas de la cordillera
                for (int i = 0; i < numMontanas; i++) {
                    System.out.println("Introduce la altura de la montaña número " + (i + 1));
                    cordillera[i] = sc.nextInt();
                }
                // creamos un atributo numAbadias que representa el numero de abadias que podrá haber en esta cordillera,
                // cada vez que una montaña cumpla la condición necesaria de poder tener una abadia, sumaremos uno a este atributo
                int numAbadias = 0;

                // primer for, recorremos todo el array de montañas (toda la cordillera)
                for (int i = 0; i < numMontanas; i++) {
                    // inicialmente asumimos que esta montaña podrá tener una abadía, en caso de que encontremos una montaña mas adelante del array que no sea más pequeña, marcamos este atributo a false
                    boolean abadiaPosible = true;
                    // segundo for, recorreremos de nuevo el array de montañas, pero empezando por la montaña siguiente a la que estamos en el for superior, 
                    // y con la condicion de que en cuanto abadiaPosible sea false parará este bucle (ya no se cumpliría la condición y por tanto no es necesario seguir)
                    for (int j = i + 1; (j < numMontanas) && abadiaPosible; j++) {
                        // Si encuentro una cordillera más adelante del array que sea igual o más alta que la del for superior, ya no sirve para una abadia, marcamos el atributo a false
                        if (cordillera[j] >= cordillera[i]) {
                            abadiaPosible = false;
                        }

                    }
                    // Si llegado a este punto abadiaPosible es true, significa que todas las montañas mas adelante de la que estamos en el primer for son mas pequeñas,
                    // por lo que es valida para poner abadia, sumamos uno al contador
                    if (abadiaPosible) {
                        numAbadias++;
                    }
                }

                System.out.println("Esta cordillera permite: " + numAbadias + " abadías");
            }

            System.out.println("Introduce el numero de montañas de la siguiente cordillera:");
            numMontanas = sc.nextInt();
        }

    }

}
