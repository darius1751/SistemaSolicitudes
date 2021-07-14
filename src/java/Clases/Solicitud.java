package Clases;
public class Solicitud {
    private int consecutivo;
    private String identificacion;
    private String fecha;
    private Facultad facultad;
    private Area area;
    private String requerimiento;
    private Estado estado;
    public Solicitud(String fecha,String identificacion, Facultad facultad, Area area, String requerimiento, Estado estado) {
        this.identificacion = identificacion;
        this.fecha = fecha;
        this.facultad = facultad;
        this.area = area;
        this.requerimiento = requerimiento;
        this.estado = estado;
    }
    public Solicitud(int consecutivo,String fecha,String identificacion, Facultad facultad, Area area, String requerimiento, Estado estado){
        this(fecha, identificacion, facultad, area, requerimiento, estado);
        this.consecutivo = consecutivo;
    }
    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public int getConsecutivo() {
        return consecutivo;
    }

    public void setConsecutivo(int consecutivo) {
        this.consecutivo = consecutivo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Facultad getFacultad() {
        return facultad;
    }

    public void setFacultad(Facultad facultad) {
        this.facultad = facultad;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public String getRequerimiento() {
        return requerimiento;
    }

    public void setRequerimiento(String requerimiento) {
        this.requerimiento = requerimiento;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    
}
