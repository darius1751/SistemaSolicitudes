package DTO;
import Clases.Estudiante;
import Connection.ConnectionDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class EstudianteDTO {
    private final ConnectionDb connection;
    public EstudianteDTO(String db){
        this.connection = new ConnectionDb(db);
    }
    public boolean registrar(Estudiante estudiante){
        boolean registrado = false;
        try{
            Connection conexion = connection.getConnection();
            PreparedStatement statement = conexion.prepareStatement("INSERT INTO estudiante(identificacion,nombre,email,celular) VALUES(?,?,?,?)");
            statement.setString(1, estudiante.getIdentificacion());
            statement.setString(2, estudiante.getNombre());
            statement.setString(3, estudiante.getEmail());
            statement.setString(4, estudiante.getCelular());
            registrado =  statement.executeUpdate()>0;
            conexion.close();
            return registrado;
        }catch(SQLException ex){
            return registrado;
        }  
    }
}
