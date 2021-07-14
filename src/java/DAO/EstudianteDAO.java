package DAO;
import Connection.ConnectionDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class EstudianteDAO {
    private final ConnectionDb connection;
    public EstudianteDAO(String db){
        this.connection = new ConnectionDb(db);
    }    
    public String logueo(String user, String password){
        String envio=null;
        try{
            Connection conexion = connection.getConnection();
           PreparedStatement statement = conexion.prepareStatement("SELECT nombre FROM estudiante WHERE email = ? AND identificacion = ?");
           statement.setString(1, user);
           statement.setString(2, password);
           ResultSet datos = statement.executeQuery();
           if(datos.next())
               envio = datos.getString("nombre");
           
            return envio;
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return envio;
    }
}
