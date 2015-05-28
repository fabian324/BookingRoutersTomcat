/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DTO;



/**
 *
 * @author Aprendiz
 */
public class reserDTO {

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getIdEstadoReserva() {
        return idEstadoReserva;
    }

    public void setIdEstadoReserva(int idEstadoReserva) {
        this.idEstadoReserva = idEstadoReserva;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public int getIdTransporteLlegada() {
        return idTransporteLlegada;
    }

    public void setIdTransporteLlegada(int idTransporteLlegada) {
        this.idTransporteLlegada = idTransporteLlegada;
    }

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public String getFechaReserva() {
        return fechaReserva;
    }

    public void setFechaReserva(String fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    public String getHoraReserva() {
        return horaReserva;
    }

    public void setHoraReserva(String horaReserva) {
        this.horaReserva = horaReserva;
    }

    public String getDireccionDestino() {
        return direccionDestino;
    }

    public void setDireccionDestino(String direccionDestino) {
        this.direccionDestino = direccionDestino;
    }

    public long getIdpersona() {
        return idpersona;
    }

    public void setIdpersona(long idpersona) {
        this.idpersona = idpersona;
    }

    public serviciosDTO getSer() {
        return ser;
    }

    public void setSer(serviciosDTO ser) {
        this.ser = ser;
    }

    public empresatransportesDTO getEmpre() {
        return empre;
    }

    public void setEmpre(empresatransportesDTO empre) {
        this.empre = empre;
    }
     public int getCupo() {
        return cupo;
    }

    public void setCupo(int cupo) {
        this.cupo = cupo;
    }

    @Override
    public String toString() {
        return "reserDTO{" + "idReserva=" + idReserva + ", idEstadoReserva=" + idEstadoReserva + ", idServicio=" + idServicio + ", idTransporteLlegada=" + idTransporteLlegada + ", responsable=" + responsable + ", fechaReserva=" + fechaReserva + ", horaReserva=" + horaReserva + ", direccionDestino=" + direccionDestino + ", idpersona=" + idpersona + ", ser=" + ser + ", empre=" + empre + ", cupo=" + cupo + '}';
    }

    private int idReserva;
    private int idEstadoReserva;
    private int idServicio;
    private int idTransporteLlegada;
    private String responsable;    
    private String fechaReserva;
    private String horaReserva;
    private String direccionDestino;
    private long idpersona;
    private serviciosDTO ser;
    private empresatransportesDTO empre;
    private int cupo;

   
   

}
