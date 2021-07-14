package DAO;

import Clases.Area;
import Clases.Estado;
import Clases.Facultad;
import Clases.Solicitud;
import Connection.ConnectionDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
public class SolicitudDAO {
    private final ConnectionDb connection;
    public SolicitudDAO(String db){
        this.connection = new ConnectionDb(db);
    }
    public LinkedList<Solicitud> solicitudes(){
        try{
            LinkedList<Solicitud> listaDeSolicitudes = new LinkedList<>();
            Connection conexion = connection.getConnection();
                PreparedStatement datos = conexion.prepareStatement("SELECT\n" +
            "    consecutivo,\n" +
            "    fecha,\n" +
        "    identificacion,\n "+ 
        " f.codigo AS codigoFacultad," +
        "    f.nombre AS Facultad,\n" +
        "    a.nombre AS Area,\n "+ 
        "a.codigo AS codigoArea, "+
        "es.codigo AS codigoEstado," +
        "    requerimiento,\n" +
        "    es.nombre AS Estado\n" +
        "FROM\n" +
        "    solicitudes AS s\n" +
        "INNER JOIN AREA AS a\n" +
        "ON\n" +
        "    s.cod_area = a.codigo\n" +
        "INNER JOIN facultad AS f\n" +
        "ON\n" +
        "    f.codigo = s.cod_facultad\n" +
        "INNER JOIN estado AS es\n" +
        "ON\n" +
        "    es.codigo = s.cod_estado");
            ResultSet resultado = datos.executeQuery();
            while(resultado.next()){
                listaDeSolicitudes.add(new Solicitud(resultado.getInt("consecutivo"), resultado.getDate("fecha").toString(),resultado.getString("identificacion"),new Facultad(resultado.getInt("codigoFacultad"),resultado.getString("Facultad")), new Area(resultado.getInt("codigoArea"),resultado.getString("Area")),resultado.getString("requerimiento"), new Estado(resultado.getInt("codigoEstado"),resultado.getString("Estado"))));
            }
            conexion.close();
            return listaDeSolicitudes;
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public LinkedList<Solicitud>solicitudes(String identificacion){
        try{
            LinkedList<Solicitud> listaDeSolicitudes = new LinkedList<>();
            Connection conexion = connection.getConnection();
                    PreparedStatement datos = conexion.prepareStatement("SELECT\n" +
            "    consecutivo,\n" +
            "    fecha,\n" +
        "    identificacion,\n "+ 
        " f.codigo AS codigoFacultad," +
        "    f.nombre AS Facultad,\n" +
        "    a.nombre AS Area,\n "+ 
        "a.codigo AS codigoArea, "+
        "es.codigo AS codigoEstado," +
        "    requerimiento,\n" +
        "    es.nombre AS Estado\n" +
        "FROM\n" +
        "    solicitudes AS s\n" +
        "INNER JOIN AREA AS a\n" +
        "ON\n" +
        "    s.cod_area = a.codigo\n" +
        "INNER JOIN facultad AS f\n" +
        "ON\n" +
        "    f.codigo = s.cod_facultad\n" +
        "INNER JOIN estado AS es\n" +
        "ON\n" +
        "    es.codigo = s.cod_estado WHERE identificacion = ?");
            datos.setString(1, identificacion);
            ResultSet resultado = datos.executeQuery();
            while(resultado.next()){
                //int consecutivo,String fecha,String identificacion, Facultad facultad, Area area, String requerimiento, Estado estado
                listaDeSolicitudes.add(new Solicitud(resultado.getInt("consecutivo"), resultado.getDate("fecha").toString(),resultado.getString("identificacion"),new Facultad(resultado.getInt("codigoFacultad"),resultado.getString("Facultad")), new Area(resultado.getInt("codigoArea"),resultado.getString("Area")),resultado.getString("requerimiento"), new Estado(resultado.getInt("codigoEstado"),resultado.getString("Estado"))));
            }
            conexion.close();
            return listaDeSolicitudes;
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return null;
    }
}
