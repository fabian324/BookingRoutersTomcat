/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DAO;
// private Connection cnn = null;

import co.sena.edu.booking.DTO.empresatransportesDTO;
import co.sena.edu.booking.DTO.personareservaDTO;
import co.sena.edu.booking.DTO.personasDTO;
import co.sena.edu.booking.DTO.reserDTO;
import co.sena.edu.booking.DTO.serviciosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class personareservaDAO {

    private PreparedStatement pstm;
    ResultSet rs = null;

    String msgSalida; // almacena el msg de salida al usuario
    int ciu; // almacena el resultado de la ejecución en la BD
     int rtdo;
    // public ciudadesDAO() {
    //cnn = Conexion.getConnection();
    //cnn = Conexion.getConnection();
    //}
    public String creaReser(personareservaDTO reseper, Connection cnn) throws SQLException {
        String salida = "";
        try {

            int resultado = 0;
            pstm = cnn.prepareStatement("INSERT INTO reservaporpersona VALUES ( ?, ?, ?, ?, ?, ?, ?, ?);");
            pstm.setInt(1, reseper.getIdreservaPorPersona());
            pstm.setString(2, reseper.getNombres());
            pstm.setString(3, reseper.getApellidos());
            pstm.setString(4, reseper.getTelefono());
            pstm.setLong(5, reseper.getIdPersona());
            pstm.setInt(6, reseper.getIdReserva());
            pstm.setString(7, reseper.getNacionalidad());
            pstm.setString(8, reseper.getFechaNaci());

            resultado = pstm.executeUpdate();

            if (resultado != 0) {
                msgSalida = "La reserva ha sido registrada exitosamente.";
            } else {
                // salida = "Ha ocurrido un problema al crear el profesor. Contacte al administrador";

            }
        } catch (SQLException sqle) {
            msgSalida = "Ocurrió la siguiente exception : " + sqle.getMessage();
        } finally {
            try {
                pstm.close();
            } catch (SQLException ex) {
                Logger.getLogger(personareservaDAO.class.getName()).log(Level.SEVERE, null, ex); // se deja por defecto en este caso
            }
        }

        return msgSalida;

    }

    public List<personareservaDTO> listarReservasPersonas(long p,int idReserva, Connection cnn) throws SQLException {
        ArrayList<personareservaDTO> listarReservas = new ArrayList();

        try {
            String query = "select p.idPersona, r.idReserva from reservas r\n"
                    + "inner join personas p\n"
                    + "on r.idpersona=p.idpersona where p.idPersona=? and r.idReserva = ?";
            pstm = cnn.prepareStatement(query);
            pstm.setLong(1, p);
            pstm.setInt(2, idReserva);
            rs = pstm.executeQuery();

            while (rs.next()) {
                personareservaDTO Rdao = new personareservaDTO();
                reserDTO r = new reserDTO();
                personasDTO pe = new personasDTO();
                r.setIdReserva(rs.getInt("idReserva"));
                pe.setIdPersona(rs.getLong("idPersona"));
                Rdao.setPer(pe);
                Rdao.setRe(r);
                listarReservas.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarReservas;
    }

    public int obtenerUltimaReserva(long p, Connection cnn) throws SQLException {        
        int idReserva = 0;
        try {
            String query = "select p.idPersona, r.idReserva from reservas r \n"
                    + "inner join personas p\n"
                    + "on r.idpersona=p.idpersona where p.idPersona= ? order by r.idReserva desc limit 1;";
            pstm = cnn.prepareStatement(query);
            pstm.setLong(1, p);
            rs = pstm.executeQuery();

            while (rs.next()) {
                personareservaDTO Rdao = new personareservaDTO();
                idReserva = rs.getInt("idReserva");

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return idReserva;
    }
    public int contarRegistrosReservas(int idReserva, Connection cnn) throws SQLException {
       int total=0;
       try {         
           
           String sql = "select count(idReserva) as total from reservaporpersona where idReserva =?;";    
           pstm=cnn.prepareStatement(sql);
           pstm.setInt(1, idReserva);
                          
               rs = pstm.executeQuery();
             
               while(rs.next()){                
               total=rs.getInt("total");
               }
           }catch (SQLException ex){
               msgSalida = "Error " + ex.getMessage() + "Codigo de error" + ex.getErrorCode();
           }
       return total;
       }
    
    public int contarCupos(int idReserva, Connection cnn) throws SQLException {
       int cupo=0;
       try {         
           
           String sql = "select cupo from reservas where idReserva=?;";    
           pstm=cnn.prepareStatement(sql);
           pstm.setInt(1, idReserva);
                          
               rs = pstm.executeQuery();
             
               while(rs.next()){                
               cupo=rs.getInt("cupo");
               }
           }catch (SQLException ex){
               msgSalida = "Error " + ex.getMessage() + "Codigo de error" + ex.getErrorCode();
           }
       return cupo;
       } 
    public List<personareservaDTO> listarAcompañantes(int idReserva, Connection cnn) throws SQLException {
        ArrayList<personareservaDTO> listarReservas = new ArrayList();

        try {
            String query = "select idreservaPorPersona, nombres, apellidos, telefono, idReserva, fechaNaci from reservaporpersona where idReserva=?;";
            pstm = cnn.prepareStatement(query);
            pstm.setInt(1, idReserva);
            rs = pstm.executeQuery();

            while (rs.next()) {
               personareservaDTO Rdao = new personareservaDTO();
               Rdao.setIdreservaPorPersona(rs.getInt("idreservaPorPersona"));
               Rdao.setNombres(rs.getString("nombres"));                
               Rdao.setApellidos(rs.getString("apellidos"));               
               Rdao.setTelefono(rs.getString("telefono"));  
               Rdao.setIdReserva(rs.getInt("idReserva"));
               Rdao.setFechaNaci(rs.getString("fechaNaci"));                               
               listarReservas.add(Rdao);
            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarReservas;
    }
     public String actualizarReservaAcompañante(personareservaDTO resert, Connection cnn) {

        try {

            pstm = cnn.prepareStatement("UPDATE reservaporpersona SET nombres=?, apellidos=?, telefono=?, fechaNaci=? where idreservaPorPersona=?; ");

            pstm.setString(1, resert.getNombres());
            pstm.setString(2, resert.getApellidos());
            pstm.setString(3, resert.getTelefono());
            pstm.setString(4, resert.getFechaNaci());
            pstm.setInt(5, resert.getIdreservaPorPersona());
           rtdo = pstm.executeUpdate();
            if (rtdo > 0) {
                msgSalida = "Su reserva se a modificado";
            } else {
                msgSalida = "NO se pudo actualizar el registro";
            }
        } catch (SQLException ex) {
            msgSalida = "Error al ejecutar la operación : " + ex.getSQLState() + " " + ex.getMessage();
        }
        return msgSalida;
}
      public personareservaDTO ListarUnaReservaAcompanante(int idreservaPorPersona, Connection cnn) throws SQLException {
      personareservaDTO Rdao = new personareservaDTO();
        try {
            pstm = cnn.prepareStatement("select idreservaPorPersona, nombres, apellidos, telefono, fechaNaci, idReserva from reservaporpersona where idreservaPorPersona=?;");
            pstm.setInt(1, idreservaPorPersona);
            pstm.executeQuery();

            rs = pstm.executeQuery();

            while (rs.next()) {

               Rdao.setIdreservaPorPersona(rs.getInt("idreservaPorPersona")); 
               Rdao.setNombres(rs.getString("nombres"));                
               Rdao.setApellidos(rs.getString("apellidos"));               
               Rdao.setTelefono(rs.getString("telefono"));             
               Rdao.setFechaNaci(rs.getString("fechaNaci")); 
               Rdao.setIdReserva(rs.getInt("idReserva")); 
            }
        } catch (SQLException ex) {
            msgSalida = "Error " + ex.getMessage() + "Codigo de error" + ex.getErrorCode();
        }
        return Rdao;
    }
      public String eliminarPersonaReserva(int idReserva, Connection cnn) {
        try {
            /*
             * Para el ejemplo ilustativo se ha utilizado unicamente actualizar el nombre
             * Sin embargo, en las lineas comentadas se ilustra el codigo completo para actualizar todos los campos
             *
             */
            pstm = cnn.prepareStatement("DELETE FROM reservaporpersona WHERE idreservaPorPersona = ?; ");
            //pstmt= cnn.prepareStatement("UPDATE usuarios SET id_perfil=?, nombres=?, apellidos=?, usuario=? clave = MD5(?) WHERE id_usuario = ?; ");           
            pstm.setInt(1, idReserva);

            rtdo = pstm.executeUpdate();
            if (rtdo > 0) {
                msgSalida = "reserva eliminada";
            } else {
                msgSalida = "NO se pudo eliminar  el registro";
            }
        } catch (SQLException ex) {
            msgSalida = "Error al ejecutar la operación : " + ex.getSQLState() + " " + ex.getMessage();

        }

        return msgSalida;
    }
}