package tallermecanico;

public abstract class Trabajo {

    protected String descripcion;
    protected int numeroHoras;
    protected String id;
    protected static boolean finalizado = false;

    private static int contador = 0;

    public Trabajo(String descripcion) {
        this.descripcion = descripcion;
        this.numeroHoras = 0;
        id = "T" + generarId();
        contador++;

    }

    public String generarId() {

        String sufijo = contador + "";

        while (sufijo.length() < 7) {

            sufijo = "0" + sufijo;
        }

        return sufijo;
    }

    public String getId() {
        return id;
    }
    

    public void incrementarHoras(int horas) {
        if (!finalizado) {
            numeroHoras += horas;
        }
    }

    public void finalizarTrabajo() {
        finalizado = true;
    }
    
    public String toString(){
    
        return "Descripcio: "+descripcion+"\nNumero de horas: "+numeroHoras+"ID: "+getId();
    }
    public abstract double calcularPrecio();

}
