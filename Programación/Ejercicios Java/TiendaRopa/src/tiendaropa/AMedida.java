package tiendaropa;

public class AMedida extends Traje implements IFechaEntrega {

    private int plazoEntrega;

    public AMedida(int plazoEntrega, String descripcion, double precioTotal) {
        super(descripcion, precioTotal);
        this.plazoEntrega = plazoEntrega;
    }

    public String toString() {

        return super.toString() + "\nPlazo de entrega: " + plazoEntrega;
    }

    @Override
    public Fecha fechaEntrega() {

        return fecha.sumarDias(plazoEntrega);

    }

}
