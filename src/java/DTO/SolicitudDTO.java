package DTO;

import Clases.Solicitud;
import Connection.ConnectionDb;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class SolicitudDTO {
    private final ConnectionDb connection;
    public SolicitudDTO(String db){
        this.connection = new ConnectionDb(db);
    }
    public boolean registrar(Solicitud solicitud){
        try{
            Connection conexion = connection.getConnection();
            PreparedStatement statement = conexion.prepareStatement("INSERT INTO solicitudes(fecha,identificacion,cod_facultad,cod_area,requerimiento,cod_estado) "
                    + "VALUES(?,?,?,?,?,?)");
            
            String[]fecha = solicitud.getFecha().split("-");
            String date = fecha[2]+"-"+fecha[1]+"-"+fecha[0];
            statement.setDate(1, Date.valueOf(date));
            statement.setString(2,solicitud.getIdentificacion());
            statement.setInt(3, solicitud.getFacultad().getCodigo());
            statement.setInt(4, solicitud.getArea().getCodigo());
            statement.setString(5, solicitud.getRequerimiento());
            statement.setInt(6, solicitud.getEstado().getCodigo());
            return statement.executeUpdate() > 0;
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return false;
    }
    public boolean actualizar(int consecutivo,int estado){
        boolean sw= false;
        try{
            Connection conexion = connection.getConnection();
            PreparedStatement statement = conexion.prepareStatement("UPDATE solicitudes SET cod_estado = ? WHERE consecutivo = ?");
            statement.setInt(1, estado);
            statement.setInt(2, consecutivo);
            sw = statement.executeUpdate() > 0;
            conexion.close();
        }catch(SQLException ex){
            System.out.println("Mi Error: "+ex.getMessage());
        }
        return sw;
    }
}
