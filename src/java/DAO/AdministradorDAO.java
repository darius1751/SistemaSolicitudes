package DAO;
import java.sql.SQLException;
import Connection.ConnectionDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class AdministradorDAO {
    private final ConnectionDb connection;
    public AdministradorDAO(String db){
        this.connection = new ConnectionDb(db);
    }
    public String logueo(String user, String password){
        String usuario = null;
        try{
            Connection conexion = connection.getConnection();
            PreparedStatement statement = conexion.prepareStatement("SELECT usuario FROM administrador WHERE usuario = ? AND password = ? ");
            statement.setString(1, user);
            statement.setString(2, password);
            ResultSet datos = statement.executeQuery();
            if(datos.next()){
                usuario = datos.getString("usuario");
            }
            conexion.close();
        }catch(SQLException e){
            System.out.println("Error en Administrador DAO: "+e.getMessage());
        }
        return usuario;
    }
}
