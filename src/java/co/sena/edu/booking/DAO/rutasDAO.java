/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DAO;

import cao.sena.edu.booking.util.Conexion;
import cao.sena.edu.booking.util.reserConex;
import co.sena.edu.booking.DTO.reserDTO;
import co.sena.edu.booking.DTO.rutasDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tomoko
 */
public class rutasDAO {
   // private Connection cnn = null;
    private PreparedStatement pstmt;
    ResultSet rs = null;
    String msgSalida; 
    int rut; 
//public rutasDAO(){
    //cnn = reserConex.getInstance();
     //cnn = Conexion.getConnection();
//}
public String actualizarRegistro( rutasDTO rutas, Connection cnn) {
try {

    pstmt = cnn.prepareStatement("UPDATE rutas SET placaVehiculo=?,"
            + "idtipovehiculo=?, idestadoruta=?, "
            + "idpersona=?,idconductor=?,idreserva=? WHERE idRuta=? ");
    pstmt.setString(1,rutas.getPlacaVehiculo());
    pstmt.setInt(2,rutas.getIdtipoVehiculo());
    pstmt.setInt(3,rutas.getIdEstadoRuta());
    pstmt.setString(4,rutas.getIdPersona());
    pstmt.setString(5,rutas.getIdConductor());
    pstmt.setInt(6,rutas.getidReserva());
    pstmt.setInt(7,rutas.getIdRuta());
    
    rut = pstmt.executeUpdate();
            if (rut > 0) {
                msgSalida = "La ruta ha sido modificada exitosamente";
            } else {
                msgSalida = "NO se pudo actualizar el registro";
            }
        } catch (SQLException ex) {
            msgSalida = "Error al ejecutar la operación : " + ex.getSQLState() + " " + ex.getMessage();

        }
        return msgSalida;

 }
public String crearRuta(rutasDTO newRuta, Connection cnn)throws SQLException{
        String salida = "";
        try {
            int idNewRuta = 0;
            pstmt = cnn.prepareStatement(" Select Max(idRuta) + 1 as IdNewRuta From Rutas");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                idNewRuta = rs.getInt("IdNewRuta");
            }
                        
            int resultado = 0;
            pstmt = cnn.prepareStatement("INSERT INTO rutas VALUES ( ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, idNewRuta);
            pstmt.setString(2, newRuta.getPlacaVehiculo());
            pstmt.setInt(3, newRuta.getIdtipoVehiculo());
            pstmt.setInt(4, newRuta.getIdEstadoRuta());
            pstmt.setString(5, newRuta.getIdPersona());
            pstmt.setString(6, newRuta.getIdConductor());
            pstmt.setInt(7, newRuta.getidReserva());
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "La ruta a sido creada exitosamente"  ;
            } else {
               salida = "Ha ocurrido un problema al crear la ruta. Contacte al administrador";
                
            }
        } catch (SQLException sqle) {
            salida = "Ocurrió la siguiente exception : " + sqle.getMessage();
        } finally {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(rutasDAO.class.getName()).log(Level.SEVERE, null, ex); // se deja por defecto en este caso
            }
        }

        return salida;

    }

    /**
     * Este método permite listar los profesores disponibles en la tabla
     *
     */
    public List<rutasDTO> getAll(Connection cnn) throws SQLException {
        LinkedList<rutasDTO> listaRutas = new LinkedList<rutasDTO>();
        try {


            String query = "SELECT  IdRuta, placaVehiculo,idtipovehiculo, idestadoruta, idpersona, idpersona, idreserva"
                    + " FROM rutas ";
            pstmt= cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                rutasDTO newRuta = new rutasDTO();
                newRuta.setIdRuta(rs.getInt("id"));
                newRuta.setPlacaVehiculo(rs.getString("placa"));
                newRuta.setIdtipoVehiculo(rs.getInt("vehiculo"));
                newRuta.setIdEstadoRuta(rs.getInt("ruta"));
                newRuta.setIdPersona(rs.getString("id persona"));          
                newRuta.setIdConductor(rs.getString("id conductor"));
                newRuta.setidReserva(rs.getInt("id reserva"));
                listaRutas.add(newRuta);
            }
        } catch (SQLException ex) {
           msgSalida="a ocurrido un error" +ex.getMessage();
        }finally{
            pstmt.close();
        }

        return listaRutas;
}
    public rutasDTO ListarUnaRuta (int idRuta, Connection cnn) throws SQLException{
          rutasDTO RDto = new rutasDTO();   
        try  {
             
               pstmt = cnn.prepareStatement("select idRuta, placaVehiculo, idtipoVehiculo, idEstadoRuta, idPersona, idConductor,"
                       + " idreserva from rutas where idRuta=?; ");
               pstmt.setInt(1,idRuta);
               pstmt.executeQuery();

               rs = pstmt.executeQuery();
               
               while(rs.next()){
                   RDto.setIdRuta(rs.getInt("idRuta"));
                   RDto.setPlacaVehiculo(rs.getString("placaVehiculo"));
                   RDto.setIdtipoVehiculo(rs.getInt("idtipoVehiculo"));
                   RDto.setIdEstadoRuta(rs.getInt("idEstadoRuta"));
                   RDto.setIdPersona(rs.getString("idPersona"));
                   RDto.setIdConductor(rs.getString("idConductor"));
                   RDto.setidReserva(rs.getInt("idreserva"));
                 
               }
           }catch (SQLException ex){
               msgSalida = "Error " + ex.getMessage() + "Codigo de error" + ex.getErrorCode();
           }
       return RDto;
       }


       public List <rutasDTO> listarRutas (Connection cnn) throws SQLException{
    ArrayList <rutasDTO> listarRutas = new ArrayList ();
    
    try {
        String query = "select idRuta, placaVehiculo, idtipoVehiculo, idEstadoRuta, idPersona, idConductor,"
                       + " idreserva from rutas";
       pstmt = cnn.prepareStatement(query);
       rs = pstmt.executeQuery();
       
       while (rs.next()){
           rutasDTO Rdao = new rutasDTO();
                   Rdao.setIdRuta(rs.getInt("idReserva"));
                   Rdao.setIdRuta(rs.getInt("idRuta"));
                   Rdao.setPlacaVehiculo(rs.getString("placaVehiculo"));
                   Rdao.setIdtipoVehiculo(rs.getInt("idtipoVehiculo"));
                   Rdao.setIdEstadoRuta(rs.getInt("idEstadoRuta"));
                   Rdao.setIdPersona(rs.getString("idPersona"));
                   Rdao.setIdConductor(rs.getString("idConductor"));
                   Rdao.setidReserva(rs.getInt("idreserva"));
                   listarRutas.add(Rdao);
       }
       
    }catch (SQLException slqE){
        System.out.println("Ocurrio un error" + slqE.getMessage());
    }finally {
        
    }return listarRutas;
} 
       public String eliminar(rutasDTO rutass, Connection cnn) {
        try {
            /*
             * Para el ejemplo ilustativo se ha utilizado unicamente actualizar el nombre
             * Sin embargo, en las lineas comentadas se ilustra el codigo completo para actualizar todos los campos
             *
             */
            pstmt = cnn.prepareStatement("DELETE FROM rutas WHERE idRuta = ?; ");           
            pstmt.setInt(1, rutass.getIdRuta());
           

            rut = pstmt.executeUpdate();
            if (rut> 0) {
                msgSalida = "se eliminaron (" + rut + ") registros";
            } else {
                msgSalida = "NO se pudo eliminar  el registro";
            }
        } catch (SQLException ex) {
            msgSalida = "Error al ejecutar la operación : " + ex.getSQLState() + " " + ex.getMessage();
//        } finally {
//            try {
//                if (pstmt != null) {
//                    pstmt.close();
//                }
//                if (cnn != null) {
//                    cnn.close();
//                }
//            } catch (SQLException ex) {
//                msgSalida = "error al cerrar la conexion " + ex.getMessage();
//            }
        }

        return msgSalida;
    }
       public String getHTMLAll(Connection cnn) throws SQLException {
     String HTMLTipos = "<option value='0' selected > Seleccione una ruta </option>";   
     try {

            String query = "select idRuta ,concat(placaVehiculo,'-',nombres,'-',apellidos)  as Conductor "
            +"from rutas r inner join Conductores c on r.idConductor= c.idConductor inner join personas p on p.idPersona= c.idPersona";
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                HTMLTipos =HTMLTipos + " <option value='"+rs.getInt("idRuta")+"' >"+ rs.getString("conductor") +"</option>";
            }
        } catch (SQLException ex) {
           msgSalida="a ocurrido un error" +ex.getMessage();
        }finally{
            pstmt.close();
        }

        return   HTMLTipos;

}
     public String getHTMLTableAll(String idioma, Connection cnn) throws SQLException {
     String HTMLTipos = "";
     String HTMLButton = "";
     if(idioma=="es"){
         
     HTMLTipos =      "<table  class=\"table table-hover\"> <tr>" +
"        <th>PLACA VEHICULO</th>" +
"        <th>TIPO VEHICULO</th>" +
"        <th>CLIENTE</th>" +
"        <th>CONDUCTOR</th>" +
"        <th>RESERVA</th>" +
"    </tr>"; 
     HTMLButton = "Editar ruta";
     }else {
         
         HTMLTipos =      "<table  class=\"table table-hover\"> <tr>" +
"        <th>VEHICLE PLATE</th>" +
"        <th>VEHICLE TYPE</th>" +
"        <th>CUSTOMER</th>" +
"        <th>DRIVER</th>" +
"        <th>BOOKING</th>" +
"    </tr>";  
         HTMLButton = "Edit route";
     }
     
     try {

            String query = "select placaVehiculo,idRuta, concat(tipoVehiculo,'-',modelo,'-',marca) as TipoVehiculo,concat(p.nombres,' ',p.apellidos) as cliente,concat(c.idConductor,' ',pc.nombres,' ',pc.apellidos) as conductor,direccionDestino as reserva " 
                    + "from  rutas r inner join tipovehiculos tv on r.idtipoVehiculo = tv.idtipoVehiculo inner join  personas p on r.idPersona = p.idPersona inner join conductores c on r.idConductor = c.idConductor inner join reservas rr on r.idreserva = rr.idReserva inner join personas pc on c.idPersona = pc.idPersona"; 
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                HTMLTipos = HTMLTipos + "<tr>";
                HTMLTipos =HTMLTipos + "<td>"+rs.getString("placaVehiculo")+"'</td> <td>"+ rs.getString("TipoVehiculo") +"</td>";
                HTMLTipos =HTMLTipos + "<td>"+rs.getString("cliente")+"'</td> <td>"+ rs.getString("conductor") +"</td>";
                HTMLTipos =HTMLTipos + "<td>"+rs.getString("reserva")+"'</td>";
               HTMLTipos = HTMLTipos + "<td>&nbsp;\n" +
"                <input class=\"btn btn-success\" name=\"btneditar\" type=\"button\" value=\""+HTMLButton+"\" onclick=\"getRuta('"+String.valueOf( rs.getInt("idRuta"))+"');\" />   \n" +
"            </td>";
                HTMLTipos = HTMLTipos + "</tr>";
                
            }
        } catch (SQLException ex) {
           msgSalida="a ocurrido un error" +ex.getMessage();
        }finally{
            pstmt.close();
        }
        HTMLTipos = HTMLTipos + "</table>";
        return   HTMLTipos;

}
     public int validarruta(int idtipovehiculo, Connection cnn){
         
     int y=1;
     try {

           rutasDTO rudto = new rutasDTO();  
        
           
           String sql = "SELECT count(idtipovehiculo)as tipo from rutas where idtipoVehiculo=?";        
           pstmt = cnn.prepareStatement(sql);           
           pstmt.setInt(1, idtipovehiculo);           
           rs = pstmt.executeQuery();
           
          
           if (rs != null) {
               
               while (rs.next()) {

                   rudto.setIdtipoVehiculo(rs.getInt("tipo"));
                  
                 }
               y = rudto.getIdtipoVehiculo();
           }
           else {
               y = 0;
           }
       
       
       } catch (SQLException ex) {

            msgSalida = "Error " + ex.getMessage() + "Codigo de error" + ex.getErrorCode();
           
           
       }
return y;
   }

}
     

    
    

