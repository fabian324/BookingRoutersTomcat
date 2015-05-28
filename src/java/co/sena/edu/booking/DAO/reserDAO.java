/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DAO;

import cao.sena.edu.booking.util.Conexion;
import cao.sena.edu.booking.util.reserConex;
import co.sena.edu.booking.DTO.ciudadesDTO;
import co.sena.edu.booking.DTO.empresatransportesDTO;
import co.sena.edu.booking.DTO.nacionalidadesDTO;
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

/**
 *
 * @author Aprendiz
 */
public class reserDAO {

    //definimos variables globales
   // private Connection cnn = null;
    private PreparedStatement pstmt;
    ResultSet rs = null;
    
    String msgSalida; // almacena el msg de salida al usuario
    int rtdo; // almacena el resultado de la ejecución en la BD

    //public reserDAO() {
       //cnn = Conexion.getConnection();
       //cnn = reserConex.getInstance();
   // }


    public String actualizarReserva(reserDTO resert, Connection cnn) {

        try {

            pstmt = cnn.prepareStatement("UPDATE reservas SET idServicio=?, idTransporteLlegada=?, Responsable=?"
                    + ", horaReserva=?, fechaReserva=?"
                    + ",direccionDestino=?, cupo=?  WHERE IdReserva = ?; ");

            pstmt.setInt(1, resert.getIdServicio());
            pstmt.setInt(2, resert.getIdTransporteLlegada());
            pstmt.setString(3, resert.getResponsable());
            pstmt.setString(4, resert.getHoraReserva());
            pstmt.setString(5, resert.getFechaReserva());
            pstmt.setString(6, resert.getDireccionDestino());
            pstmt.setInt(7, resert.getCupo());
            pstmt.setInt(8, resert.getIdReserva());
         

            rtdo = pstmt.executeUpdate();
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

    public String eliminarReserva(int idReserva, Connection cnn) {
        try {
            /*
             * Para el ejemplo ilustativo se ha utilizado unicamente actualizar el nombre
             * Sin embargo, en las lineas comentadas se ilustra el codigo completo para actualizar todos los campos
             *
             */
            pstmt = cnn.prepareStatement("DELETE FROM reservas WHERE idReserva = ?; ");
            //pstmt= cnn.prepareStatement("UPDATE usuarios SET id_perfil=?, nombres=?, apellidos=?, usuario=? clave = MD5(?) WHERE id_usuario = ?; ");           
            pstmt.setInt(1, idReserva);

            rtdo = pstmt.executeUpdate();
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

    public String insertar(reserDTO rdto, Connection cnn) throws SQLException {
        String salida = "";
        try {
            /*
             * Para el ejemplo ilustativo se ha utilizado unicamente actualizar el nombre
             * Sin embargo, en las lineas comentadas se ilustra el codigo completo para actualizar todos los campos
             *
             */
            int resultado = 0;
            pstmt = cnn.prepareStatement("INSERT INTO reservas VALUES (?,?,?,?,?,?,?,?,?,?,?,?);");
            pstmt.setInt(1, rdto.getIdReserva());
            pstmt.setInt(2, rdto.getIdEstadoReserva());
            pstmt.setInt(3, rdto.getIdServicio());
            pstmt.setInt(4, rdto.getIdTransporteLlegada());
            pstmt.setString(5, rdto.getResponsable());
            pstmt.setString(6, rdto.getFechaReserva());
            pstmt.setString(7, rdto.getHoraReserva());
            pstmt.setString(8, rdto.getDireccionDestino());
            pstmt.setLong(9, rdto.getIdpersona());
            pstmt.setInt(10, rdto.getCupo());
            pstmt.setInt(11, rdto.getNromaletas());
            pstmt.setString(12, rdto.getNrovuelo());
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "La reserva a sido registrada exitosamente. ";
            } else {
                // salida = "Ha ocurrido un problema al crear el profesor. Contacte al administrador";

            }
        } catch (SQLException sqle) {
            salida = "Ocurrió la siguiente exception : " + sqle.getMessage();
        } finally {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(reserDAO.class.getName()).log(Level.SEVERE, null, ex); // se deja por defecto en este caso
            }
        }

        return salida;

    }

    public List<reserDTO> listarReservas(Connection cnn) throws SQLException {
        ArrayList<reserDTO> listarReservas = new ArrayList();

        try {
            String query = " select idReserva, idEstadoReserva, idServicio, idTransporteLlegada, responsable,"
                    + " fechaReserva, horaReserva, direccionDestino from reservas ";
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                reserDTO Rdao = new reserDTO();
                Rdao.setIdReserva(rs.getInt("idReserva"));
                Rdao.setIdEstadoReserva(rs.getInt("idEstadoReserva"));
                Rdao.setIdServicio(rs.getInt("idServicio"));
                Rdao.setIdTransporteLlegada(rs.getInt("idTransporteLlegada"));
                Rdao.setResponsable(rs.getString("responsable"));
                Rdao.setFechaReserva(rs.getString("fechaReserva"));
                Rdao.setHoraReserva(rs.getString("horaReserva"));
                Rdao.setDireccionDestino(rs.getString("direccionDestino"));
                listarReservas.add(Rdao);
            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarReservas;
    }
    public List<reserDTO> listarReservaPer(long id, Connection cnn) throws SQLException {
        ArrayList<reserDTO> listarReservas = new ArrayList();

        try {
            String query = " select r.idreserva, s.servicio, t.nombreEmpresaTransporte, r.responsable, r.cupo, r.fechaReserva,\n" +
           "r.horaReserva,r.direccionDestino from reservas r inner join servicios s on r.idServicio=s.idServicio\n" +
            "inner join transportellegadas em on em.idTransporteLlegada=r.idTransporteLlegada\n" +
            "inner join empresatransportes t on t.idEmpresaTransporte=em.idEmpresaTransporte where idpersona=? ";
            pstmt = cnn.prepareStatement(query);
            pstmt.setLong(1, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                reserDTO Rdao = new reserDTO();
                empresatransportesDTO t = new empresatransportesDTO();
                serviciosDTO se =new serviciosDTO();
                Rdao.setIdReserva(rs.getInt("idreserva"));                
                se.setServicio(rs.getString("servicio"));               
                t.setNombreEmpresaTransporte(rs.getString("nombreEmpresaTransporte"));                
                Rdao.setResponsable(rs.getString("responsable"));
                Rdao.setCupo(rs.getInt("cupo"));
                Rdao.setFechaReserva(rs.getString("fechaReserva"));
                Rdao.setHoraReserva(rs.getString("horaReserva"));
                Rdao.setDireccionDestino(rs.getString("direccionDestino"));
                Rdao.setSer(se);
                Rdao.setEmpre(t);                
                listarReservas.add(Rdao);
            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarReservas;
    }

    public List<reserDTO> Paginacion(int pg, int limited, Connection cnn) throws SQLException {
        ArrayList<reserDTO> Paginacion = new ArrayList();

        try {
            String query = " select idReserva, idEstadoReserva, idServicio, idTransporteLlegada, responsable,"
                    + " fechaReserva, horaReserva, direccionDestino from reservas limit" + (pg - 1) * limited + "," + limited + ";";
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                reserDTO Rdao = new reserDTO();
                Rdao.setIdReserva(rs.getInt("idReserva"));
                Rdao.setIdEstadoReserva(rs.getInt("idEstadoReserva"));
                Rdao.setIdServicio(rs.getInt("idServicio"));
                Rdao.setIdTransporteLlegada(rs.getInt("idTransporteLlegada"));
                Rdao.setResponsable(rs.getString("responsable"));
                Rdao.setFechaReserva(rs.getString("fechaReserva"));
                Rdao.setHoraReserva(rs.getString("horaReserva"));
                Rdao.setDireccionDestino(rs.getString("direccionDestino"));
                Paginacion.add(Rdao);
            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return Paginacion;
    }

    public reserDTO ListarUnaReserva(int idReserva, Connection cnn) throws SQLException {
        reserDTO Rdao = new reserDTO();
        try {
            pstmt = cnn.prepareStatement("select idReserva, idEstadoReserva, idServicio, idTransporteLlegada, responsable, fechaReserva, horaReserva, direccionDestino, cupo from reservas where idReserva=?;");
            pstmt.setInt(1, idReserva);
            pstmt.executeQuery();

            rs = pstmt.executeQuery();

            while (rs.next()) {

                Rdao.setIdReserva(rs.getInt("idReserva"));
                Rdao.setIdEstadoReserva(rs.getInt("idEstadoReserva"));
                Rdao.setIdServicio(rs.getInt("idServicio"));
                Rdao.setIdTransporteLlegada(rs.getInt("idTransporteLlegada"));
                Rdao.setResponsable(rs.getString("responsable"));
                Rdao.setFechaReserva(rs.getString("fechaReserva"));
                Rdao.setHoraReserva(rs.getString("horaReserva"));
                Rdao.setDireccionDestino(rs.getString("direccionDestino"));
                Rdao.setCupo(rs.getInt("cupo"));

            }
        } catch (SQLException ex) {
            msgSalida = "Error " + ex.getMessage() + "Codigo de error" + ex.getErrorCode();
        }
        return Rdao;
    }

    public String reservaPorRuta(String Id, Connection cnn) throws SQLException {
        String HTMLTipos = "<option value='0' " + (Id == "0" ? "selected" : "") + " > Seleccione reserva </option>";
        try {

            String query = "select idreserva, concat(fechaReserva, ' - ',servicio) as reserva "
                    + "from reservas a inner join servicios b on a.idServicio = b.idServicio ";
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String idRes = Integer.toString(rs.getInt("idReserva"));
                HTMLTipos = HTMLTipos + " <option value='" + idRes + "' " + (Id.equals(idRes) ? "selected" : "") + " > " + rs.getString("reserva") + "</option>";
            }
        } catch (SQLException ex) {
            msgSalida = "a ocurrido un error" + ex.getMessage();
        } finally {
            pstmt.close();
        }

        return HTMLTipos;

    }

    public int contarRegistros(Connection cnn) {
        int registros = 0;
        try {
            pstmt = cnn.prepareStatement("SELECT * FROM reservas;");
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    registros++;
                }
                return registros;
            }

        } catch (SQLException sqle) {
            msgSalida = sqle.getMessage();
        }
        return registros;
    }
    public long validarReservas(long idpersona, Connection cnn) throws SQLException {
       int clave=0;
       try {         
           
           String sql = " select count(idpersona) as clave from reservas where idpersona = ?";    
           pstmt=cnn.prepareStatement(sql);
           pstmt.setLong(1, idpersona);
                          
               rs = pstmt.executeQuery();
             
               while(rs.next()){                
               clave=rs.getInt("clave");
               }
           }catch (SQLException ex){
               msgSalida = "Error " + ex.getMessage() + "Codigo de error" + ex.getErrorCode();
           }
       return clave;
       } 
}
                          
