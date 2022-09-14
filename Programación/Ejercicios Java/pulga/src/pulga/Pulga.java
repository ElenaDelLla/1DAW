package pulga;

import java.util.Scanner;

public class Pulga {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int numCasos = sc.nextInt();

        for (int i = 0; i < numCasos; i++) {
            int n = sc.nextInt();
            int f = sc.nextInt();
            int t = sc.nextInt();

            int potencia = 0;
            if (t <= n) {
                potencia = n * f;
            } else {
                potencia = ((t - (t / (n + 1))) % n) * f;
            }
            System.out.println(potencia);
            
        }
    }

}
