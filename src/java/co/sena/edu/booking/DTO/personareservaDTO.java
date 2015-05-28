/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.sena.edu.booking.DTO;

import java.sql.Date;

/**
 *
 * @author fabian
 */
public class personareservaDTO {

    @Override
    public String toString() {
        return "personareservaDTO{" + "idreservaPorPersona=" + idreservaPorPersona + ", nombres=" + nombres + ", apellidos=" + apellidos + ", telefono=" + telefono + ", idpersona=" + idPersona + ", idReserva=" + idReserva + ", nacionalidad=" + nacionalidad + ", fechaNaci=" + fechaNaci + ", re=" + re + ", per=" + per + '}';
    }

    private int idreservaPorPersona;
    private String nombres;
    private String apellidos;
    private String telefono;
    private long idPersona;
    private int idReserva;
    private String nacionalidad;
    private String fechaNaci;
    private reserDTO re;

    public personasDTO getPer() {
        return per;
    }

    public void setPer(personasDTO per) {
        this.per = per;
    }
    private personasDTO per;
    
    public int getIdreservaPorPersona() {
        return idreservaPorPersona;
    }

    public void setIdreservaPorPersona(int idreservaPorPersona) {
        this.idreservaPorPersona = idreservaPorPersona;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public long getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(long idPersona) {
        this.idPersona = idPersona;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }
     /**
     * @return the fechaNaci
     */
    public String getFechaNaci() {
        return fechaNaci;
    }

    /**
     * @param fechaNaci the fechaNaci to set
     */
    public void setFechaNaci(String fechaNaci) {
        this.fechaNaci = fechaNaci;
    }

    /**
     * @return the re
     */
    public reserDTO getRe() {
        return re;
    }

    /**
     * @param re the re to set
     */
    public void setRe(reserDTO re) {
        this.re = re;
    }

}
