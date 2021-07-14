package Clases;
public class Estudiante {
    private String identificacion;
    private String nombre;
    private String celular;
    private String email;
    public Estudiante(String identificacion, String nombre, String celular, String email) {
        this.identificacion = identificacion;
        this.nombre = nombre;
        this.celular = celular;
        this.email = email;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
