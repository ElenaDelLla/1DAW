package pkg8.pkg5;

public class Circulo extends FiguraGeometrica {

    protected double radio;
    private final double PI = 3.1416;

    public Circulo() {
    }

    public Circulo(int x, int y, double radio) {
        super(x, y);
        this.radio = radio;

    }

    @Override
    public double area() {
        return PI * radio * radio;
    }

    @Override
    public double perimetro() {
        return 2 * PI * radio;
    }

}
