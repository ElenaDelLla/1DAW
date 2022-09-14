package examen;

public class Gato extends Animal {

    public Gato(String nombre, int edad) {
        super(nombre, edad);
    }

    @Override
    public String toString() {
        return "Gato " + super.toString();
    }
}
