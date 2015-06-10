


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DAO;



import cao.sena.edu.booking.util.Conexion;
import co.sena.edu.booking.DTO.ciudadesDTO;
import co.sena.edu.booking.DTO.conductoresDTO;
import co.sena.edu.booking.DTO.empresatransportesDTO;
import co.sena.edu.booking.DTO.listarConductoresDTO;
import co.sena.edu.booking.DTO.listarPerDTO;
import co.sena.edu.booking.DTO.listarPersonasDTO;
import co.sena.edu.booking.DTO.nacionalidadesDTO;
import co.sena.edu.booking.DTO.personasDTO;
import co.sena.edu.booking.DTO.reserDTO;
import co.sena.edu.booking.DTO.rolesDTO;
import co.sena.edu.booking.DTO.rolusuarioDTO;
import co.sena.edu.booking.DTO.serviciosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

/**
 *
 * @author fabian
 */
public class personasDAO {

    //private Connection cnn = null;
    private PreparedStatement pstmt;
    ResultSet rs = null;
    String msgSalida;
    int per;
    String sqlTemp = "";


   
        //cnn = Conexion.getConnection();
       //cnn = reserConex.getInstance();

    

    public String actualizarRegistro(personasDTO personas, Connection cnn) {
        try {

            pstmt = cnn.prepareStatement("UPDATE personas SET correoElectronico=?,idCiudad=?,"
                    + "idNacionalidad=?,nombres=?,apellidos=?,fechaNto=?,telefono=?,observaciones=? WHERE idPersona=?");

            pstmt.setString(1, personas.getCorreoElectronico());
            pstmt.setInt(2, personas.getIdCiudad());
            pstmt.setInt(3, personas.getIdNacionalidad());
            pstmt.setString(4, personas.getNombres());
            pstmt.setString(5, personas.getApellidos());
            pstmt.setString(6, personas.getFechaNto());
            pstmt.setInt(7, personas.getTelefono());
//          pstmt.setString(8, personas.getContraseña());
//          pstmt.setInt(9, personas.getIdestadousuarios());
            pstmt.setString(8, personas.getObservaciones());
            pstmt.setLong(9, personas.getIdPersona());
            
            per = pstmt.executeUpdate();
            if (per > 0) {
                msgSalida = "Sus datos se modificaron";
            } else {
                msgSalida = "NO se pudo actualizar el registro";
            }
        } catch (SQLException ex) {
            msgSalida = "Error al ejecutar la operación : " + ex.getSQLState() + " " + ex.getMessage();

        }
        return msgSalida;

    }
public String actualizarRol(rolusuarioDTO rol, Connection cnn) {
        try {

            pstmt = cnn.prepareStatement("UPDATE rolusuario SET rolesIdRol=? WHERE ususarioIdUsuario=?");

            pstmt.setInt(1, rol.getRolesIdRol());
            pstmt.setInt(2, rol.getUsuarioIdUsuario());
            
            
            per = pstmt.executeUpdate();
            if (per > 0) {
                msgSalida = "Sus datos se modificaron";
            } else {
                msgSalida = "NO se pudo actualizar el registro";
            }
        } catch (SQLException ex) {
            msgSalida = "Error al ejecutar la operación : " + ex.getSQLState() + " " + ex.getMessage();

        }
        return msgSalida;

    }
    public String crearPersona(personasDTO newPersona, Connection cnn) throws SQLException {
        //String salida = "";
        try {

            int resultado = 0;
            pstmt = cnn.prepareStatement("INSERT INTO personas VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setLong(1, newPersona.getIdPersona());
            pstmt.setString(2, newPersona.getCorreoElectronico());
            pstmt.setInt(3, newPersona.getIdCiudad());
            pstmt.setInt(4, newPersona.getIdNacionalidad());
            pstmt.setString(5, newPersona.getNombres());
            pstmt.setString(6, newPersona.getApellidos());
            pstmt.setString(7, newPersona.getFechaNto());          
            pstmt.setString(8, newPersona.getContrasena());
            pstmt.setInt(9, newPersona.getIdestadousuarios());
            pstmt.setString(10, newPersona.getObservaciones());
            pstmt.setString(11, newPersona.getSexo());
            pstmt.setInt(12, newPersona.getTelefono());
                      
            
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
               msgSalida = "El usuario a sido registrado exitosamente. ";
            } else {
                // salida = "Ha ocurrido un problema al crear el profesor. Contacte al administrador";

            }
        } catch (SQLException sqle) {
            msgSalida = "Ocurrió la siguiente exception  : " + sqle.getMessage();
        } finally {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(personasDAO.class.getName()).log(Level.SEVERE, null, ex); // se deja por defecto en este caso
            }
        }

        return msgSalida;

    }
     public String crearConductor(personasDTO newPersona, Connection cnn) throws SQLException {
        //String salida = "";
        try {

            int resultado = 0;
            pstmt = cnn.prepareStatement("INSERT INTO personas VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setLong(1, newPersona.getIdPersona());
            pstmt.setString(2, newPersona.getCorreoElectronico());
            pstmt.setInt(3, newPersona.getIdCiudad());
            pstmt.setInt(4, newPersona.getIdNacionalidad());
            pstmt.setString(5, newPersona.getNombres());
            pstmt.setString(6, newPersona.getApellidos());
            pstmt.setString(7, newPersona.getFechaNto());          
            pstmt.setInt(8, newPersona.getIdestadousuarios());
            pstmt.setString(9, newPersona.getObservaciones());
            pstmt.setString(10, newPersona.getSexo());
            pstmt.setInt(11, newPersona.getTelefono());
                      
            
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
               msgSalida = "El usuario a sido registrado exitosamente. ";
            } else {
                // salida = "Ha ocurrido un problema al crear el profesor. Contacte al administrador";

            }
        } catch (SQLException sqle) {
            msgSalida = "Ocurrió la siguiente exception  : " + sqle.getMessage();
        } finally {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(personasDAO.class.getName()).log(Level.SEVERE, null, ex); // se deja por defecto en este caso
            }
        }

        return msgSalida;

    }

   

   
    public List<personasDTO> getAll(Connection cnn) throws SQLException {
        LinkedList<personasDTO> listaPersonas = new LinkedList<personasDTO>();
        try {

            String query = "SELECT  idPersona, correoElectronico, idCiudad, idNacionalidad, nombres, apellidos, fechaNto, telefono, contrasena, idestadousuarios, observaciones "
                    + " FROM personas ";
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                personasDTO newPersona = new personasDTO();
                newPersona.setIdPersona(rs.getLong("idPersona"));
                newPersona.setCorreoElectronico(rs.getString("correoElectronico"));
                newPersona.setIdCiudad(rs.getInt("idCiudad"));
                newPersona.setIdNacionalidad(rs.getInt("idNacionalidad"));
                newPersona.setNombres(rs.getString("nombres"));
                newPersona.setApellidos(rs.getString("apellidos"));
                newPersona.setFechaNto(rs.getString("fechaNto"));
                newPersona.setTelefono(rs.getInt("telefono"));
                newPersona.setContrasena(rs.getString("contrasena"));
                newPersona.setIdestadousuarios(rs.getInt("idestadousuarios"));
                newPersona.setObservaciones(rs.getString("observaciones"));
                listaPersonas.add(newPersona);
            }
        } catch (SQLException ex) {
            msgSalida = "a ocurrido un error" + ex.getMessage();
        } finally {
            pstmt.close();
        }

        return listaPersonas;
    }

    public personasDTO ListarUnaPersona(Long cedula, Connection cnn) throws SQLException {
        personasDTO Rdao = null;
        try {
            pstmt = cnn.prepareStatement("select p.idPersona, p.correoElectronico, p.idCiudad, p.idNacionalidad, \n" +
" p.nombres, p.apellidos, p.fechaNto, p.telefono, p.contrasena, p.idestadousuarios, p.observaciones, r.rolesIdRol\n" +
"from personas p\n" +
"inner join rolusuario r\n" +
"on p.idpersona=r.ususarioIdUsuario\n" +
"where idPersona=?;");
            pstmt.setLong(1, cedula);
            pstmt.executeQuery();

            rs = pstmt.executeQuery();

            while (rs.next()) {
                rolusuarioDTO r= new rolusuarioDTO();
                Rdao = new personasDTO();
                Rdao.setIdPersona(rs.getLong("idPersona"));
                Rdao.setCorreoElectronico(rs.getString("correoElectronico"));
                Rdao.setIdCiudad(rs.getInt("idCiudad"));
                Rdao.setIdNacionalidad(rs.getInt("idNacionalidad"));
                Rdao.setNombres(rs.getString("nombres"));
                Rdao.setApellidos(rs.getString("apellidos"));
                Rdao.setFechaNto(rs.getString("fechaNto"));
                Rdao.setTelefono(rs.getInt("telefono"));
                Rdao.setContrasena(rs.getString("contrasena"));
                Rdao.setIdestadousuarios(rs.getInt("idestadousuarios"));
                Rdao.setObservaciones(rs.getString("observaciones"));
                r.setRolesIdRol(rs.getInt("rolesIdRol"));
                Rdao.setRolus(r);
            }
        } catch (SQLException ex) {
            msgSalida = "Error " + ex.getMessage() + "Codigo de error" + ex.getErrorCode();
        }
        return Rdao;
    }

    public List<personasDTO> listarPersonas(personasDTO p, Connection cnn) throws SQLException {
        ArrayList<personasDTO> listarPersonas = new ArrayList();

        try {
            String query = "select idPersona, correoElectronico, idCiudad, idNacionalidad, "
                    + " nombres, apellidos, fechaNto, telefono, contrasena, idestadousuarios, observaciones from personas";
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                personasDTO Rdao = new personasDTO();
                Rdao.setIdPersona(rs.getLong("idPersona"));
                Rdao.setCorreoElectronico(rs.getString("correoElectronico"));
                Rdao.setIdCiudad(rs.getInt("idCiudad"));
                Rdao.setIdNacionalidad(rs.getInt("idNacionalidad"));
                Rdao.setNombres(rs.getString("nombres"));
                Rdao.setApellidos(rs.getString("apellidos"));
                Rdao.setFechaNto(rs.getString("fechaNto"));
                Rdao.setTelefono(rs.getInt("telefono"));
                Rdao.setContrasena(rs.getString("contrasena"));
                Rdao.setIdestadousuarios(rs.getInt("idestadousuarios"));
                Rdao.setObservaciones(rs.getString("observaciones"));
                listarPersonas.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarPersonas;
    }
    
      public List<personasDTO> Paginacion(int pg , int limited, Connection cnn) throws SQLException {
        ArrayList<personasDTO> Paginacion = new ArrayList();

        try {
            
            pstmt = cnn.prepareStatement("select p.idPersona,p.nombres,p.apellidos,c.ciudad,n.nacionalidad,p.telefono,p.correoElectronico from personas p \n" +
"inner join ciudades c on p.idCiudad = c.idCiudad\n" +
"inner join nacionalidades n on p.idNacionalidad= n.idNacionalidad where p.idestadousuarios='1' order by Nombres asc limit "+(pg-1)*limited+","+limited+";");
            rs = pstmt.executeQuery();

            while (rs.next()) {
               personasDTO Rdao = new personasDTO(); 
               nacionalidadesDTO nac = new nacionalidadesDTO();
               ciudadesDTO ciudad = new ciudadesDTO();
               Rdao.setIdPersona(rs.getLong("idPersona"));
               Rdao.setNombres(rs.getString("nombres"));
               Rdao.setApellidos(rs.getString("apellidos"));              
               ciudad.setCiudad(rs.getString("ciudad"));             
               nac.setNacionalidad(rs.getString("nacionalidad"));              
               Rdao.setTelefono(rs.getInt("telefono"));
               Rdao.setCorreoElectronico(rs.getString("correoElectronico")); 
               Rdao.setCiu(ciudad);
               Rdao.setNac(nac);               
               Paginacion.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return Paginacion;
    }

    public String eliminar(Long idPersona, Connection cnn) {
        try {
            /*
             * Para el ejemplo ilustativo se ha utilizado unicamente actualizar el nombre
             * Sin embargo, en las lineas comentadas se ilustra el codigo completo para actualizar todos los campos
             *
             */
            pstmt = cnn.prepareStatement("DELETE FROM personas WHERE idPersona = ?; ");
            pstmt.setLong(1, idPersona);

            per = pstmt.executeUpdate();
            if (per > 0) {
                msgSalida = "El usuario ha sido eliminado";
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
 public String actualizarContrasena(personasDTO personas, Connection cnn) {
        try {

            pstmt = cnn.prepareStatement("UPDATE personas SET contrasena=? WHERE idPersona=?");
            pstmt.setString(1, personas.getContrasena());
            pstmt.setLong(2, personas.getIdPersona());

            per = pstmt.executeUpdate();
            if (per > 0) {
                msgSalida = "Se modifico su clave";
            } else {
                msgSalida = "NO se pudo actualizar el registro";
            }
        } catch (SQLException ex) {
            msgSalida = "Error al ejecutar la operación : " + ex.getSQLState() + " " + ex.getMessage();

        }
        return msgSalida;

    }
public long isAcountExists(String contrasena, Long idPersona, Connection cnn) throws SQLException {
       
       long y = 1;
       
       try {

           personasDTO pde = new personasDTO();
           
        
           
           String sql = "select idPersona,contrasena from personas where idPersona = ? and contrasena = ?";        
           pstmt = cnn.prepareStatement(sql);           
           pstmt.setLong(1, idPersona);
           pstmt.setString(2, contrasena);
           rs = pstmt.executeQuery();
           
          
           if (rs != null) {
               
               while (rs.next()) {

                   pde.setIdPersona(rs.getLong("idPersona"));
                   pde.setContrasena(rs.getString("contrasena"));
                 }
               y = pde.getIdPersona();
           }
           else {
               y = 0;
           }
       
       
       } catch (SQLException ex) {

          
           
           
       }
return y;
   }
public String getHTMLAll(String Id, Connection cnn) throws SQLException {
     String HTMLTipos = "<option value='0' "+ (Id.equals("0") ? "selected":"") +" > Seleccione Cliente </option>";   
     try {

            String query = "select idPersona as Id, concat(nombres ,'  ', apellidos )  as cliente " +" from personas idusuarios where idestadousuarios = 1" ;
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                String idRes = rs.getString("id");
                HTMLTipos =HTMLTipos + " <option value='"+rs.getString("id")+"' "+ (Id.equals(idRes) ? "selected":"") +" >"+ rs.getString("cliente") +"</option>";
            }
        } catch (SQLException ex) {
           msgSalida="a ocurrido un error" +ex.getMessage();
        }finally{
            pstmt.close();
        }
        return   HTMLTipos;
}
public int contarRegistros(Connection cnn){
        int registros = 0;
        try{
            pstmt=cnn.prepareStatement("SELECT * FROM personas where idestadousuarios='1';");
            
            rs = pstmt.executeQuery();
            
            if (rs!=null) {
                while(rs.next()){
                registros++;
            }
            return registros;
            }
              
            
        }catch(SQLException sqle){
            msgSalida = sqle.getMessage();
        }
        return registros;
    }
public int contarReservas(Connection cnn){
        int registros = 0;
        try{
            pstmt=cnn.prepareStatement("SELECT * FROM reservas where idReserva= ?");
            
            rs = pstmt.executeQuery();
            
            if (rs!=null) {
                while(rs.next()){
                registros++;
            }
            return registros;
            }
              
            
        }catch(SQLException sqle){
            msgSalida = sqle.getMessage();
        }
        return registros;
    }
public String EnviarCorreo(String correo, Connection cnn) {
        String clave = "";
        try {

            pstmt = cnn.prepareStatement("select contrasena as clave from personas where correoElectronico = ?");
            
            pstmt.setString(1, correo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                clave = rs.getString("clave");
            }
        } catch (SQLException sqle) {
           sqle.printStackTrace();
        }
       
        return  clave;
}
public List<listarPersonasDTO> contarPersonas(String  nacionalidad, String nombres, Connection cnn) {
        ArrayList<listarPersonasDTO> productos = new ArrayList();
        try {
            StringBuilder sb = new StringBuilder("select p.nombres, p.apellidos, c.nacionalidad "
                    + "from personas p inner join nacionalidades c on p.idNacionalidad = c.idNacionalidad ");

            if (nacionalidad != null) {
                sb.append("AND c.nacionalidad LIKE '").append(nacionalidad).append("%'");
            }
            if (nombres!= null) {
                sb.append("AND p.nombres LIKE '").append(nombres).append("%'");
            }

            sb.append("order by nacionalidad desc limit 0,10");
            pstmt = cnn.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    listarPersonasDTO producto = new listarPersonasDTO();
                    producto.setNombres(rs.getString("nombres"));
                    producto.setApellidos(rs.getString("apellidos"));
                    producto.setNacionalidad(rs.getString("nacionalidad"));
                    productos.add(producto);
                }
            }
        } catch (SQLException ex) {

        }
        return productos;
    }
public List<listarPerDTO> filtroPersonas(String nacionalidad, String nombres, String ciudad, Connection cnn ) throws SQLException{
        ArrayList<listarPerDTO> filtroPersonas = new ArrayList();

        try {
         StringBuilder sb = new StringBuilder("select p.nombres, p.apellidos, p.correoElectronico, a.Ciudad, c.nacionalidad,c.idioma "
                    + "from personas p inner join "
                    + "nacionalidades c on p.idNacionalidad = c.idNacionalidad "
                    + "inner join ciudades a on p.idCiudad = a.idCiudad where 1=1 ");

            if (nacionalidad != null) {
                sb.append("AND c.nacionalidad LIKE '").append(nacionalidad).append("%'");
            }
            if (nombres!= null) {
                sb.append("AND p.nombres LIKE '").append(nombres).append("%'");
            }
            
            if (ciudad != null) {
                sb.append("AND a.Ciudad LIKE '").append(ciudad).append("%'");
            }
         
         
         
         pstmt = cnn.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                listarPerDTO Rdao = new listarPerDTO();
                
                
                Rdao.setNombres(rs.getString("nombres"));
                Rdao.setApellidos(rs.getString("apellidos")); 
                Rdao.setCorreoElectronico(rs.getString("correoElectronico"));
                Rdao.setCiudad(rs.getString("Ciudad"));
                Rdao.setNacionalidad(rs.getString("nacionalidad"));
                Rdao.setIdioma(rs.getString("idioma"));
                filtroPersonas.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return filtroPersonas;
    }
public int contarNumerosdeRegistros(Connection cnn){
        int registros = 0;
        try{
            pstmt=cnn.prepareStatement("select p.nombres, p.apellidos, p.correoElectronico, "
                    + "a.Ciudad, c.nacionalidad,c.idioma from personas p inner join nacionalidades c on "
                    + "p.idNacionalidad = c.idNacionalidad inner join ciudades a on p.idCiudad = a.idCiudad;");
            rs = pstmt.executeQuery();
            
            if (rs!=null) {
                while(rs.next()){
                registros++;
            }
            return registros;
            }
              
            
        }catch(SQLException sqle){
            msgSalida = sqle.getMessage();
        }
        return registros;
    }

public List<listarPerDTO> Paginacion2(int pg , int limited, Connection cnn) throws SQLException {
        ArrayList<listarPerDTO> Paginacion2 = new ArrayList();

        try {
            
            pstmt = cnn.prepareStatement("select p.nombres, p.apellidos, p.correoElectronico, "
                    + "a.Ciudad, c.nacionalidad,c.idioma from personas p inner join "
                    + "nacionalidades c on p.idNacionalidad = c.idNacionalidad "
                    + "inner join ciudades a on p.idCiudad = a.idCiudad limit "+(pg-1)*limited+","+limited+";");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                listarPerDTO Rdao = new listarPerDTO();
                Rdao.setNombres(rs.getString("idPersona"));
                Rdao.setApellidos(rs.getString("correoElectronico"));
                Rdao.setCorreoElectronico(rs.getString("idCiudad"));
                Rdao.setNacionalidad(rs.getString("idNacionalidad"));
                Rdao.setIdioma(rs.getString("nombres"));
                Paginacion2.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return Paginacion2;
    }
    public List<String> obtenerCorreoPorId(Connection cnn) throws SQLException{
         ArrayList<String> listarcorreos = new ArrayList();        
        try {
            String query = "SELECT correoElectronico FROM personas;";
            pstmt = cnn.prepareStatement(query);          
            rs = pstmt.executeQuery();

               while (rs.next()) {              
               String correo= new String(rs.getString("correoElectronico")); 
               listarcorreos.add(correo);
               }
        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarcorreos;    
    
    }
  public List<personasDTO> listarTodasPersonas(long cedula, Connection cnn) throws SQLException {
        ArrayList<personasDTO> listarPersonas = new ArrayList();

        try {
            String query = "select p.idPersona,p.nombres,p.apellidos,c.ciudad,n.nacionalidad,p.telefono,p.correoElectronico from personas p \n" +
"inner join ciudades c on p.idCiudad = c.idCiudad\n" +
"inner join nacionalidades n on p.idNacionalidad= n.idNacionalidad where p.idestadousuarios='1';";
            pstmt = cnn.prepareStatement(query);
            pstmt.setLong(1, cedula);
            rs = pstmt.executeQuery();

               while (rs.next()) {
               personasDTO Rdao = new personasDTO(); 
               nacionalidadesDTO nac = new nacionalidadesDTO();
               ciudadesDTO ciudad = new ciudadesDTO();
               Rdao.setIdPersona(rs.getLong("idPersona"));
               Rdao.setNombres(rs.getString("nombres"));
               Rdao.setApellidos(rs.getString("apellidos"));              
               ciudad.setCiudad(rs.getString("ciudad"));             
               nac.setNacionalidad(rs.getString("nacionalidad"));              
               Rdao.setTelefono(rs.getInt("telefono"));
               Rdao.setCorreoElectronico(rs.getString("correoElectronico")); 
               Rdao.setCiu(ciudad);
               Rdao.setNac(nac);
               listarPersonas.add(Rdao);
            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarPersonas;
    }

  public List<listarConductoresDTO> filtroConductores(String responsable, String direccionDestino, String fechaReserva, Connection cnn ) throws SQLException{
        ArrayList<listarConductoresDTO> filtroConductores = new ArrayList();

        try {
         StringBuilder sb = new StringBuilder("select p.nombres,p.apellidos, r.responsable, r.fechaReserva, r.direccionDestino, "
                 + "s.servicio from servicios s inner join reservas r on s.idServicio = r.idServicio "
                 + "inner join personas p on r.idpersona = p.idpersona ");

            if (responsable != null) {
                sb.append("AND r.responsable LIKE'").append(responsable).append("%'");
            }
            if (direccionDestino!= null) {
                sb.append("AND r.direccionDestino LIKE'").append(direccionDestino).append("%'");
            }
            
            if (fechaReserva != null) {
                sb.append("AND r.fechaReserva LIKE'").append(fechaReserva).append("%'");
            }
         
         
         
         pstmt = cnn.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                listarConductoresDTO Rdao = new listarConductoresDTO();
                
                
                Rdao.setNombres(rs.getString("nombres"));
                Rdao.setApellidos(rs.getString("apellidos"));
                Rdao.setResponsable(rs.getString("responsable")); 
                Rdao.setFechaReserva(rs.getString("fechaReserva"));
                Rdao.setDireccionDestino(rs.getString("direccionDestino"));
                Rdao.setServicio(rs.getString("servicio"));
                filtroConductores.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return filtroConductores;
    }
  public conductoresDTO correoConductores(int idConductor ,Connection cnn){
     conductoresDTO cond = new conductoresDTO();
     try {
            String query = "select nombres,apellidos,telefono from personas  p\n" +
" inner join conductores c on p.idpersona= c.idPersona where c.idConductor=?;";
            pstmt = cnn.prepareStatement(query);  
            pstmt.setInt(1,idConductor);
            rs = pstmt.executeQuery();

               while (rs.next()) {              
              personasDTO per = new personasDTO();
              per.setNombres(rs.getString("nombres"));
              per.setApellidos(rs.getString("apellidos"));
              cond.setTelContacto(rs.getInt("telefono"));
              cond.setConductores(per);
               }
        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error aqui" + slqE.getMessage());
        } finally {

        }
        return cond;
}

public synchronized long login(String contrasena, long idPersona, Connection conexion) throws SQLException  {
        long cc = 0;
        try{
            pstmt = conexion.prepareStatement("SELECT idPersona "
                    + "from personas where idPersona= ? and contrasena=?");
            
           pstmt.setLong(1, idPersona);
           pstmt.setString(2, contrasena);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    cc = rs.getLong("idPersona");
                }
            }
         } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        }
        return cc;    
    
    }
public synchronized int getRol(personasDTO idPersona,Connection conexion) throws SQLException {
        int rol = 0;
        try {
            //preparamos la consulta 
            pstmt = conexion.prepareStatement("SELECT ususarioIdUsuario," +
                   " rolesIdRol FROM rolusuario " +
                    " WHERE ususarioIdUsuario =?;");
            pstmt.setLong(1, idPersona.getIdPersona());
            rs = pstmt.executeQuery();
            //mientras halla registros
            while (rs.next()) {
                rol = rs.getInt("rolesIdRol");
            }

        } catch (SQLException ex) {
            throw new SQLException("Error obteniendo rol", ex);
        }
//        finally{
//            try{
//                statement.close();
//            }catch (SQLException ex) {
//            throw new MiExcepcion("Error obteniendo rol", ex);
//        }
//        }
        //devolvemos el usuario que se encontro
        return rol;
    }

}