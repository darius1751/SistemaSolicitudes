package DAO;

import Clases.Area;
import Connection.ConnectionDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class AreaDAO {
    private final ConnectionDb connection;
    public AreaDAO(String db){
        this.connection = new ConnectionDb(db);
    }
    public LinkedList<Area>getAreas(){
        LinkedList<Area> areas = null;
        try{
            Connection conexion = connection.getConnection();
            PreparedStatement statement = conexion.prepareStatement("SELECT codigo,nombre FROM area ORDER BY codigo ASC ");
            ResultSet datos = statement.executeQuery();
            areas = new LinkedList<>();
            while(datos.next()){
                areas.add(new Area(datos.getInt("codigo"),datos.getString("nombre")));
            }
            conexion.close();
            return areas;
        }catch(SQLException e){
            System.out.println("Error en AreaDAO: "+e.getMessage());
        }
        return areas;
    }
}
