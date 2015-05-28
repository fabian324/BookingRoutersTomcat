/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DTO;

/**
 *
 * @author Tomoko
 */
public class personasDTO {

    @Override
    public String toString() {
        return "personasDTO{" + "idPersona=" + idPersona + ", correoElectronico=" + correoElectronico + ", idCiudad=" + idCiudad + ", idNacionalidad=" + idNacionalidad + ", nombres=" + nombres + ", apellidos=" + apellidos + ", fechaNto=" + fechaNto + ", telefono=" + telefono + ", contrase\u00f1a=" + contraseña + ", idestadousuarios=" + idestadousuarios + ", observaciones=" + observaciones + ", ActivarCorreo=" + ActivarCorreo + ", Sexo=" + Sexo + ", ciu=" + ciu + ", nac=" + nac + ", roles=" + roles + ", rolus=" + rolus + '}';
    }

    private long idPersona;
    private String correoElectronico;
    private int idCiudad;
    private int idNacionalidad;
    private String nombres;
    private String apellidos;
    private String fechaNto;
    private int telefono;
    private String contraseña;
    private int idestadousuarios;
    private String observaciones;
    private int ActivarCorreo = 0;
    private int Sexo = 0;
    private ciudadesDTO ciu ;
    private nacionalidadesDTO nac; 
    private rolesDTO roles;
    private rolusuarioDTO rolus;

    public rolesDTO getRoles() {
        return roles;
    }

    public void setRoles(rolesDTO roles) {
        this.roles = roles;
    }

    public rolusuarioDTO getRolus() {
        return rolus;
    }

    public void setRolus(rolusuarioDTO rolus) {
        this.rolus = rolus;
    }
   
    
    
    public ciudadesDTO getCiu() {
        return ciu;
    }

    public void setCiu(ciudadesDTO ciu) {
        this.ciu = ciu;
    }

    public nacionalidadesDTO getNac() {
        return nac;
    }

    public void setNac(nacionalidadesDTO nac) {
        this.nac = nac;
    }
  
    
    public int getSexo() {
        return Sexo;
    }

    public void setSexo(int Sexo) {
        this.Sexo = Sexo;
    }
    

    public int getActivarCorreo() {
        return ActivarCorreo;
    }

    public void setActivarCorreo(int ActivarCorreo) {
        this.ActivarCorreo = ActivarCorreo;
    }
   
    /**
     * @return the idPersona
     */
    public long getIdPersona() {
        return idPersona;
    }

    /**
     * @param idPersona the idPersona to set
     */
    public void setIdPersona(long idPersona) {
        this.idPersona = idPersona;
    }

    /**
     * @return the correoElectronico
     */
    public String getCorreoElectronico() {
        return correoElectronico;
    }

    /**
     * @param correoElectronico the correoElectronico to set
     */
    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    /**
     * @return the idCiudad
     */
    public int getIdCiudad() {
        return idCiudad;
    }

    /**
     * @param idCiudad the idCiudad to set
     */
    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    /**
     * @return the idNacionalidad
     */
    public int getIdNacionalidad() {
        return idNacionalidad;
    }

    /**
     * @param idNacionalidad the idNacionalidad to set
     */
    public void setIdNacionalidad(int idNacionalidad) {
        this.idNacionalidad = idNacionalidad;
    }

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
     * @return the fechaNto
     */
    public String getFechaNto() {
        return fechaNto;
    }

    /**
     * @param fechaNto the fechaNto to set
     */
    public void setFechaNto(String fechaNto) {
        this.fechaNto = fechaNto;
    }

    /**
     * @return the telefono
     */
    public int getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    /**
     * @return the contraseña
     */
    public String getContraseña() {
        return contraseña;
    }

    /**
     * @param contraseña the contraseña to set
     */
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    /**
     * @return the idestadousuarios
     */
    public int getIdestadousuarios() {
        return idestadousuarios;
    }

    /**
     * @param idestadousuarios the idestadousuarios to set
     */
    public void setIdestadousuarios(int idestadousuarios) {
        this.idestadousuarios = idestadousuarios;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

   
}