/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.sena.edu.booking.DTO;

/**
 *
 * @author fabian
 */
public class rolesDTO {

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "rolesDTO{" + "idRol=" + idRol + ", nombre=" + nombre + '}';
    }
    private int idRol;
    private String nombre;
    
}
