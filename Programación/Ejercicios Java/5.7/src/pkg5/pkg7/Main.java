package pkg5.pkg7;

public class Main {

    public static void main(String[] args) {

        int[] caras = new int[6];
        // [0,0,0,0,0,0]
        for (int i = 0; i < 6000; i++) {

            int cara = (int) (Math.random() * 6); // 0, 1, 2, 3, 4, 5

            caras[cara] = caras[cara] + 1;
        }

        System.out.println("Cara 1: " + caras[0]);
        System.out.println("Cara 2: " + caras[1]);
        System.out.println("Cara 3: " + caras[2]);
        System.out.println("Cara 4: " + caras[3]);
        System.out.println("Cara 5: " + caras[4]);
        System.out.println("Cara 6: " + caras[5]);

        System.out.println("Proporcion Cara 1: " + (caras[0] / 6000.0));
        System.out.println("Proporcion Cara 2: " + (caras[1] / 6000.0));
        System.out.println("Proporcion Cara 3: " + (caras[2] / 6000.0));
        System.out.println("Proporcion Cara 4: " + (caras[3] / 6000.0));
        System.out.println("Proporcion Cara 5: " + (caras[4] / 6000.0));
        System.out.println("Proporcion Cara 6: " + (caras[5] / 6000.0));
    }

}
