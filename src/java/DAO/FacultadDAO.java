package DAO;
import Clases.Facultad;
import Connection.ConnectionDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
public class FacultadDAO {
    private final ConnectionDb connection;
    public FacultadDAO(String db){
        this.connection = new ConnectionDb(db);
    }
    public LinkedList<Facultad>getFacultades(){
        LinkedList<Facultad> facultades = null;
        try{
            Connection conexion = connection.getConnection();
            PreparedStatement statement = conexion.prepareStatement("SELECT codigo,nombre FROM facultad ORDER BY codigo ASC ");
            ResultSet datos = statement.executeQuery();
            facultades = new LinkedList<>();
            while(datos.next()){
                facultades.add(new Facultad(datos.getInt("codigo"),datos.getString("nombre")));
            }
            conexion.close();
            return facultades;
        }catch(SQLException e){
            System.out.println("Error en AreaDAO: "+e.getMessage());
        }
        return facultades;
    }
}
