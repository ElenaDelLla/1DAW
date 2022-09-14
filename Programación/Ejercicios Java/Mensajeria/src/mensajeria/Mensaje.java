/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mensajeria;

import java.io.Serializable;

/**
 *
 * @author Elena
 */
public abstract class Mensaje implements Serializable {

    protected int codigo;
    protected String texto;

    public Mensaje(int codigo, String texto) {
        this.codigo = codigo;
        this.texto = texto;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    @Override
    public String toString() {
        return "Codigo: " + codigo + " Mensaje: " + texto;
    }

}
