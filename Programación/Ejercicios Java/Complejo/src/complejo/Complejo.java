/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package complejo;

/**
 *
 * @author Elena Delgado Llamas
 */
public class Complejo {

    private double real;
    private double imag;

    public double getReal() {
        return real;
    }

    public void setReal(double real) {
        this.real = real;
    }

    public double getImag() {
        return imag;
    }

    public void setImag(double imag) {
        this.imag = imag;
    }

    public Complejo() {
        this.real = 0;
        this.imag = 0;
    }

    public Complejo(double real) {
        this.real = real;
        this.imag = 0;
    }
 
    public Complejo(double real, double imag) {
        this.real = real;
        this.imag = imag;
    }

    public Complejo sumar(Complejo num) {
        return new Complejo(this.real + num.getReal(), this.imag + num.getImag());
    }

    public Complejo restar(Complejo num) {
        return new Complejo(this.real - num.getReal(), this.imag - num.getImag());
    }

    public Complejo multiplicar(Complejo num) {
        return new Complejo((this.real * num.getReal()) - (this.imag * num.getImag()), (this.real * num.getImag()) + (this.imag * num.getReal()));
    }

    public Complejo multiplicar(double num) {
        return new Complejo(this.real * num, this.imag * num);
    }

    public Complejo dividir(Complejo num) {
        return new Complejo(
                (this.real * num.getReal() + this.imag * num.getImag()) / ((num.getReal() * num.getReal()) + (num.getImag() * num.getImag())),
                ((this.imag * num.getReal()) - (this.real * num.getImag())) / ((num.getReal() * num.getReal()) + (num.getImag() * num.getImag()))
        );
    }

    @Override
    public String toString() {
        return "(" + real + ", " + imag + ')';
    }

    public boolean equals(Complejo num) {

        if (this.real != num.getReal() || this.imag != num.getImag()) {
            return false;
        } else {
            return true;
        }
    }

    private static int factorial(int numero) {
        if (numero <= 0) {
            return 1;
        } else {
            return numero * factorial(numero - 1);
        }
    }

    private static double combinatorio(int m, int n) {
        return factorial(m) / (factorial(m - n) * factorial(n));
    }

    private static double potencia(double base, int exponente) {
        double resultado = 1.0;
        for (int i = 0; i < exponente; i++) {
            resultado *= base;
        }
        return resultado;
    }

    public static Complejo potencia(Complejo numero, int exponente) {
        double real = 0.0, imag = 0.0;
        int signo;
        for (int i = 0; i <= exponente; i++) {
            if (i % 2 == 0) {
                signo = +1;
            } else {
                signo = -1;
            }
            real += signo * combinatorio(exponente, 2 * i) * potencia(numero.getReal(), exponente - 2 * i) * potencia(numero.getImag(), 2 * i);
            if (exponente != 2 * i) {
                imag += signo * combinatorio(exponente, 2 * i + 1) * potencia(numero.getReal(), exponente - (2 * i + 1)) * potencia(numero.getImag(), 2 * i + 1);
            }
        }
        return new Complejo(real, imag);
    }

    /*public static void main(String[] args) {

        Complejo a = new Complejo(2, 5);
        Complejo b = new Complejo();
        b.setReal(4.6);
        b.setImag(3.5);
        Complejo suma = a.sumar(b);
        Complejo resta = a.restar(b);
        Complejo mult = a.multiplicar(b);
        Complejo mult2 = a.multiplicar(5.2);
        Complejo div = a.dividir(b);
        System.out.println(suma);
        System.out.println(resta);
        System.out.println(mult);
        System.out.println(mult2);
        System.out.println(div);
        if (a.equals(b)) {
            System.out.println("Los dos números son iguales");
        }
        Complejo pot = Complejo.potencia(a, 3);
        System.out.println(pot);
    }*/

}
