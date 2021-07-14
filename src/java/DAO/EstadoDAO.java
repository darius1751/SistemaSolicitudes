package DAO;

import Clases.Estado;
import Connection.ConnectionDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class EstadoDAO {
    private final ConnectionDb connection;
    public EstadoDAO(String db){
        this.connection = new ConnectionDb(db);
    }
    public LinkedList<Estado>getEstados(){
        LinkedList<Estado> estados = null;
        try{
            Connection conexion = connection.getConnection();
            PreparedStatement statement = conexion.prepareStatement("SELECT codigo,nombre FROM estado ORDER BY codigo ASC ");
            ResultSet datos = statement.executeQuery();
            estados = new LinkedList<>();
            while(datos.next()){
                estados.add(new Estado(datos.getInt("codigo"),datos.getString("nombre")));
            }
            conexion.close();
            return estados;
        }catch(SQLException e){
            System.out.println("Error en AreaDAO: "+e.getMessage());
        }
        return estados;
    }
}
