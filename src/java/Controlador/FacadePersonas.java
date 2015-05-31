/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import cao.sena.edu.booking.util.reserConex;
import co.sena.edu.booking.DAO.ciudadesDAO;
import co.sena.edu.booking.DAO.conductoresDAO;
import co.sena.edu.booking.DAO.nacionalidadesDAO;
import co.sena.edu.booking.DAO.personareservaDAO;
import co.sena.edu.booking.DAO.personasDAO;
import co.sena.edu.booking.DAO.reserDAO;
import co.sena.edu.booking.DAO.rutasDAO;
import co.sena.edu.booking.DAO.tipovehiculosDAO;
import co.sena.edu.booking.DTO.ciudadesDTO;
import co.sena.edu.booking.DTO.conductoresDTO;
import co.sena.edu.booking.DTO.personareservaDTO;
import co.sena.edu.booking.DTO.personasDTO;
import co.sena.edu.booking.DTO.reserDTO;
import co.sena.edu.booking.DTO.rolusuarioDTO;
import co.sena.edu.booking.DTO.rutasDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author fabian
 */
public class FacadePersonas {
     private Connection cnn = null;
    ciudadesDAO ciu;
    conductoresDAO con;
    nacionalidadesDAO nac;
    personasDAO pers;
    reserDAO reser;
    rutasDAO ru;
    tipovehiculosDAO tipov;
    personareservaDAO pereser;
   

    public FacadePersonas() {
         ciu = new ciudadesDAO();
        con = new conductoresDAO();
        nac = new nacionalidadesDAO();
        pers = new personasDAO();
        reser = new reserDAO();
        ru = new rutasDAO();
        tipov = new tipovehiculosDAO();
        pereser = new personareservaDAO();
        //cnn = Conexion.getConnection();
        cnn = reserConex.getInstance();

    }
    public String eliminarPersonaReserva(int idReserva){
        return pereser.eliminarPersonaReserva(idReserva, cnn);
    }
   public  String actualizarRol(rolusuarioDTO rol){
     return  pers.actualizarRol(rol, cnn);
   }
    public conductoresDTO correoConductores(int idConductor)throws SQLException{
        return pers.correoConductores(idConductor, cnn);
    }
    public synchronized int getRol(personasDTO idPersona) throws SQLException{
        return pers.getRol(idPersona, cnn);
    }
    public long login(String contraseña, long idPersona) throws SQLException{
        return pers.login(contraseña, idPersona, cnn);
    }
    public personareservaDTO ListarUnaReservaAcompanante(int idreservaPorPersona) throws SQLException{
        return pereser.ListarUnaReservaAcompanante(idreservaPorPersona, cnn);
    }
    
    public String actualizarReservaAcompañante(personareservaDTO resert){
        return pereser.actualizarReservaAcompañante(resert, cnn);
    }
    public List listarAcompañantes(int idReserva) throws SQLException{
       return pereser.listarAcompañantes(idReserva, cnn);
    }
    public int contarCupos(int idReserva) throws SQLException{
       return pereser.contarCupos(idReserva, cnn);
    }
    public int contarRegistrosReservas(int idReserva) throws SQLException{
       return pereser.contarRegistrosReservas(idReserva, cnn);
}
    public List listarReservasPersonas(long p, int idReserva) throws SQLException {
        return pereser.listarReservasPersonas(p, idReserva, cnn);
    }

    public String creaReser(personareservaDTO reseper) throws SQLException {
        return pereser.creaReser(reseper, cnn);
    }

    public String reservaPorRuta(String Id) throws SQLException {
        return reser.reservaPorRuta(Id, cnn);
    }

    public String conductores(String Id) throws SQLException {
        return con.conductores(Id, cnn);
    }

    public String seleccionTipoV(String Id) throws SQLException {
        return tipov.selecionTipoV(Id, cnn);
    }

    public List Paginacion(int pg, int limited) throws SQLException {
        return pers.Paginacion(pg, limited, cnn);
    }

    public List listarTodasPersonas(long cedula) throws SQLException {
        return pers.listarTodasPersonas(cedula, cnn);
    }

    public int contarRegistros() {
        return pers.contarRegistros(cnn);
    }
    public int contarReservas(){
    return pers.contarReservas(cnn);
    }

    public LinkedList ListarCiudades(int Nacionalidad) {
        return nac.listarCiudades(Nacionalidad, cnn);
    }

    public rutasDTO ListarUnaRuta(int idRuta) throws SQLException {
        return ru.ListarUnaRuta(idRuta, cnn);
    }

    public String actualizarRegistro(rutasDTO rutas) {
        return ru.actualizarRegistro(rutas, cnn);
    }

    public String crearRuta(rutasDTO newRuta) throws SQLException {
        return ru.crearRuta(newRuta, cnn);
    }

    public int validarruta(int idtipovehiculo) {
        return ru.validarruta(idtipovehiculo, cnn);
    }

    public String getHTMLTableAll(String idioma) throws SQLException {
        return ru.getHTMLTableAll(idioma, cnn);
    }

    public List Paginacio2(int pg, int limited) throws SQLException {
        return pers.Paginacion2(pg, limited, cnn);
    }

    public int contarNumerosdeRegistros(personasDTO p) {
        return pers.contarNumerosdeRegistros(cnn);
    }

    public List listarPersonas(personasDTO p) throws SQLException {
        return pers.listarPersonas(p, cnn);
    }

    public String getHTMLAll(String Id) throws SQLException {
        return pers.getHTMLAll(Id, cnn);
    }

    public reserDTO ListarUnaReserva(int idReserva) throws SQLException {
        return reser.ListarUnaReserva(idReserva, cnn);
    }

    public String actualizarContraseña(personasDTO personas) {
        return pers.actualizarContraseña(personas, cnn);
    }

    public List contarPersonas(String nacionalidad, String nombres) {
        return pers.contarPersonas(nacionalidad, nombres, cnn);
    }
    public List filtroConductores(String responsable,String direccionDestino,String fechaReserva) throws SQLException {
        return pers.filtroConductores(responsable, direccionDestino,fechaReserva, cnn);
    }
    

    public List filtroPersonas(String nacionalidad, String nombres, String ciudad) throws SQLException {
        return pers.filtroPersonas(nacionalidad, nombres, ciudad, cnn);
    }

    public String insertar(reserDTO r) throws SQLException {
        return reser.insertar(r, cnn);
    }

    public int obtenerUltimaReserva(long idPersona) throws SQLException {
        return pereser.obtenerUltimaReserva(idPersona, cnn);
    }

    public long validarReservas(long idPersona) throws SQLException {
        return reser.validarReservas(idPersona, cnn);
    }

    public String actualizarReserva(reserDTO r) {
        return reser.actualizarReserva(r, cnn);
    }

    public List obtenerCorreoPorId() throws SQLException {
        return pers.obtenerCorreoPorId(cnn);
    }

    public String EnviarCorreo(String correo) {
        return pers.EnviarCorreo(correo, cnn);
    }

    public List listarReservaPer(Long id) throws SQLException {
        return reser.listarReservaPer(id, cnn);
    }
 public List  listarreservaru () throws SQLException {
     return reser.listarreservaru(cnn);
    }
    public String actualizarRegistro(personasDTO perss) {
        return pers.actualizarRegistro(perss, cnn);
    }

    public String ActualizarContraseña(personasDTO perss) {
        return pers.actualizarContraseña(perss, cnn);
    }

    public long isAcountExists(String contraseña, long idPersona) throws SQLException {
        return pers.isAcountExists(contraseña, idPersona, cnn);
    }

    public String crearPersona(personasDTO perss) throws SQLException {
        return pers.crearPersona(perss, cnn);
    }

    public personasDTO ListarUnaPersona(long cedula) throws SQLException {
        return pers.ListarUnaPersona(cedula, cnn);
    }

    public String eliminar(long personasDTO) {
        return pers.eliminar(personasDTO, cnn);
    }

    public String ActualizarCiudades(ciudadesDTO ciud) {
        return ciu.actualizarRegistro(ciud, cnn);
    }

    public List listarNacionalidades() throws SQLException {
        return nac.listarNacionalidades(cnn);
    }

    public String ActualizarConductores(conductoresDTO cond) {
        return con.actualizarRegistro(cond, cnn);
    }

    public String InsertarConductores(conductoresDTO cond) throws SQLException {
        return con.crearConductor(cond, cnn);
    }

    public String ElminarConductores(conductoresDTO cond) {
        return con.eliminar(cond, cnn);

    }

    public String EliminarReseva(int idReserva) {
        return reser.eliminarReserva(idReserva, cnn);
    }

}
