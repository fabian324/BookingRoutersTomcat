/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DTO;

/**
 *
 * @author Sergio
 */
public class listarConductoresDTO {

    @Override
    public String toString() {
        return "listarConductoresDTO{" + 
                "nombres=" + nombres + 
                ", apellidos=" + apellidos + 
                ", responsable=" + responsable + 
                ", fechaReserva=" + fechaReserva + 
                ", direccionDestino=" + direccionDestino + 
                ", servicio=" + servicio + '}';
    }
    
private String nombres;
private String apellidos;
private String responsable;
private String fechaReserva;
private String direccionDestino;
private String servicio; 

    /**
     * @return the nombres
     */
    public String getNombres() {
        return nombres;
    }

    /**
     * @param nombres the nombres to set
     */
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the responsable
     */
    public String getResponsable() {
        return responsable;
    }

    /**
     * @param responsable the responsable to set
     */
    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    /**
     * @return the fechaReserva
     */
    public String getFechaReserva() {
        return fechaReserva;
    }

    /**
     * @param fechaReserva the fechaReserva to set
     */
    public void setFechaReserva(String fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    /**
     * @return the direccionDestino
     */
    public String getDireccionDestino() {
        return direccionDestino;
    }

    /**
     * @param direccionDestino the direccionDestino to set
     */
    public void setDireccionDestino(String direccionDestino) {
        this.direccionDestino = direccionDestino;
    }

    /**
     * @return the servicio
     */
    public String getServicio() {
        return servicio;
    }

    /**
     * @param servicio the servicio to set
     */
    public void setServicio(String servicio) {
        this.servicio = servicio;
    }
}
