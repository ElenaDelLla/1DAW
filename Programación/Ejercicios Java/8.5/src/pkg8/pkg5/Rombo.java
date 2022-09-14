package pkg8.pkg5;

public class Rombo extends FiguraGeometrica {

    protected double diagonalMayor;
    protected double diagonalMenor;

    public Rombo() {
    }

    public Rombo(int x, int y, double diagonalMayor, double diagonaMenor) {
        super(x, y);
        this.diagonalMayor = diagonalMayor;
        this.diagonalMenor = diagonalMenor;

    }

    @Override
     public double area() {
        return diagonalMayor * diagonalMenor / 2;
    }

    @Override
    public double perimetro() {
        return 2 * Math.sqrt(diagonalMayor * diagonalMayor + diagonalMenor * diagonalMenor);
    }
}
