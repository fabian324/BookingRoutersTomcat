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
        return "personasDTO{" + "idPersona=" + idPersona + ", correoElectronico=" + correoElectronico + ", idCiudad=" + idCiudad + ", idNacionalidad=" + idNacionalidad + ", nombres=" + nombres + ", apellidos=" + apellidos + ", fechaNto=" + fechaNto + ", telefono=" + telefono + ", contrasena=" + contrasena + ", idestadousuarios=" + idestadousuarios + ", observaciones=" + observaciones + ", Sexo=" + Sexo + ", ciu=" + ciu + ", nac=" + nac + ", roles=" + roles + ", rolus=" + rolus + '}';
    }

    public long getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(long idPersona) {
        this.idPersona = idPersona;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    public int getIdNacionalidad() {
        return idNacionalidad;
    }

    public void setIdNacionalidad(int idNacionalidad) {
        this.idNacionalidad = idNacionalidad;
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

    public String getFechaNto() {
        return fechaNto;
    }

    public void setFechaNto(String fechaNto) {
        this.fechaNto = fechaNto;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getIdestadousuarios() {
        return idestadousuarios;
    }

    public void setIdestadousuarios(int idestadousuarios) {
        this.idestadousuarios = idestadousuarios;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getSexo() {
        return Sexo;
    }

    public void setSexo(String Sexo) {
        this.Sexo = Sexo;
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

    private long idPersona;
    private String correoElectronico;
    private int idCiudad;
    private int idNacionalidad;
    private String nombres;
    private String apellidos;
    private String fechaNto;
    private int telefono;
    private String contrasena;
    private int idestadousuarios;
    private String observaciones;
    private String Sexo;
    private ciudadesDTO ciu ;
    private nacionalidadesDTO nac; 
    private rolesDTO roles;
    private rolusuarioDTO rolus;

    
   }