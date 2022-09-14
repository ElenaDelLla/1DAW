package examen;

public class Perro extends Animal {

    public Perro(String nombre, int edad) {
        super(nombre, edad);
    }

    @Override
    public String toString() {
        return "Perro " + super.toString();
    }
}
