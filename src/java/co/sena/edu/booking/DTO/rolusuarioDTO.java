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
public class rolusuarioDTO {

    public int getUsuarioIdUsuario() {
        return usuarioIdUsuario;
    }

    public void setUsuarioIdUsuario(int usuarioIdUsuario) {
        this.usuarioIdUsuario = usuarioIdUsuario;
    }

    public int getRolesIdRol() {
        return rolesIdRol;
    }

    public void setRolesIdRol(int rolesIdRol) {
        this.rolesIdRol = rolesIdRol;
    }

    @Override
    public String toString() {
        return "rolusuarioDTO{" + "usuarioIdUsuario=" + usuarioIdUsuario + ", rolesIdRol=" + rolesIdRol + '}';
    }
    private int usuarioIdUsuario;
    private int rolesIdRol;
    
}
