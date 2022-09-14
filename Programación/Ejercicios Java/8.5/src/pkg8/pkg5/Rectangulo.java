/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg8.pkg5;


public class Rectangulo extends FiguraGeometrica {

    protected double base;
    protected double altura;

    public Rectangulo() {

    }

    public Rectangulo(int x, int y, double base, double altura) {
        super(x, y);
        this.base = base;
        this.altura = altura;

    }

    @Override
    public double area() {
        return base * altura;
    }

    @Override
    public double perimetro() {

        return 2 * altura + 2 * base;
    }
}
