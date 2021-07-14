<%@page import="DAO.EstadoDAO"%>
<%@page import="Clases.Estado"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="DTO.SolicitudDTO"%>
<%@page import="Clases.Solicitud"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.SolicitudDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.Estudiante"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <style>
            body{
                background-color: black;
            }
            table,p,input{
                color:white;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <nav style="text-align: center;background: #999999">
            <form style="display: inline-block; padding-bottom:3px;" method="post" action="login.jsp">
                <input class="waves-effect waves-light btn" type="submit" value="Estudiantes">
                <input type="hidden" value="1" name="txtTipo"/>
            </form>
            <form style="display: inline-block;" method="post" action="login.jsp"   >
                <input class="waves-effect waves-light btn" type="submit" value="Administrador">
                <input type="hidden" value="2" name="txtTipo"/>
            </form>
            
        </nav>
        <%
            int opcion = Integer.parseInt(request.getParameter("rdbtnOpcion"));
            switch (opcion) {
                case 1:%>  

        <div class="row">
            <form class="col s12" method="post">
                <div class="row">
                    <div class="input-field col s6">
                        <input placeholder="Ingrese su Identificacion:" type="text" class="validate" name='txtIdentificacion'>
                        <label>Identificacion</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input  name='txtNombre'type="text" class="validate" placeholder="Ingrese su Nombre:">
                        <label >Nombre</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6">
                        <input name="txtEmail" type="email" class="validate" placeholder='Ingrese su Email'>
                        <label >Email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input type="text" class="validate" placeholder='Ingrese su Celular:' name="txtCelular">
                        <label>Celular</label>
                    </div>
                </div>
                <input type='hidden' name='rdbtnOpcion' value="1"/>
                <input class="waves-effect waves-light btn" type="submit" value='Registrar' name='btnRegistrar'/>
            </form>
        </div>


        <%
             if (request.getParameter("btnRegistrar") != null) {
                EstudianteDTO estudianteDTO = new EstudianteDTO("sistemadesolicitudesmeliza");
                Estudiante estudiante = new Estudiante(request.getParameter("txtIdentificacion"),request.getParameter("txtNombre"),request.getParameter("txtCelular"),request.getParameter("txtEmail"));
                if (estudianteDTO.registrar(estudiante)) {
                    out.print("<p>Se Logro Registrar correctamente al Estudiante</p>");
                } else {
                    out.print("<p>No fue posible Registrar al Estudiante</p>");
                }
            }
            break;
            case 2:
                LinkedList<Solicitud> solicitudes = new SolicitudDAO("sistemadesolicitudesmeliza").solicitudes();
                if (solicitudes != null) {
                    if (!solicitudes.isEmpty()) {
                    
        %>
        <table class="highlight">
            <thead>
                <tr>
                    <th>
                        Consecutivo
                    </th>
                    <th>
                        Fecha
                    </th>
                    <th>
                        Usuario
                    </th>
                    <th>
                        Facultad
                    </th>
                    <th>
                        Area
                    </th>
                    <th>
                        Solicitud
                    </th>
                    <th>
                        Estado
                    </th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (final Solicitud solicitud : solicitudes) {
                %>
                <tr>
                    <td>
                        <%=solicitud.getConsecutivo()%>
                    </td>
                    <td>
                        <%=solicitud.getFecha()%>
                    </td>
                    <td>
                        <%=solicitud.getIdentificacion()%>
                    </td>
                    <td>
                        <%=solicitud.getFacultad().getNombre()%>
                    </td>
                    <td>
                        <%=solicitud.getArea().getNombre()%>
                    </td>
                    <td>
                        <%=solicitud.getRequerimiento()%>
                    </td>
                    <td>
                        <%=solicitud.getEstado().getNombre()%>
                    </td>
                </tr>
                <%
                            }
                        }
                    } else {
                        out.print("<p>No se encontraron Solicitudes</p>");
                    }
                %>
            </tbody> 
        </table>

        <%
                break;
            default:%>
        <div class="row">
            <form class="col s12" method="post">
                <div class="row">
                    <div class="input-field col s6">
                        <input placeholder="Ingrese el Consecutivo" type="text" class="validate" name='txtConsecutivo'>
                        <label>Consecutivo:</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <select required name='cmbxEstado'>
                            <option value="" disabled selected >Seleccione el estado</option>
                            <%
                                EstadoDAO estadoDAO = new EstadoDAO("sistemadesolicitudesmeliza");
                                LinkedList<Estado> estados = estadoDAO.getEstados();
                                if(estados != null){
                                    if(!estados.isEmpty()){
                                        for(final Estado estado : estados){
                                
                            %>
                            <option value="<%=estado.getCodigo()%>"><%=estado.getNombre()%></option>
                            <%
                                    }
}
                                }
                            %>
                        </select>
                        <label>Estado</label>
                    </div>
                </div>
                <input type='hidden' name='rdbtnOpcion' value="3"/>
                <input class="waves-effect waves-light btn" type="submit" value='Registrar' name='btnRegistrarRespuesta'/>
            </form>    
        </div> 
        <%break;
            }
            if (request.getParameter("btnRegistrarRespuesta") != null) {
                SolicitudDTO solicitudDTO = new SolicitudDTO("sistemadesolicitudesmeliza");
                if (solicitudDTO.actualizar(Integer.parseInt(request.getParameter("txtConsecutivo")),Integer.parseInt(request.getParameter("cmbxEstado")))) {
                    out.print("<p>Se a actualizado correctamente el estado</p>");
                } else {
                    out.print("<p>No fue posible actualizar el estado</p>");
                }
            }
        %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var elems = document.querySelectorAll('select');
                var instances = M.FormSelect.init(elems, {classes: '', dropdownOptions: {}});
            });
            const $inputDate = document.querySelector('input[type="date"]');
        </script>
        <script>
            $spans = document.querySelectorAll('span');
                for(let $span of $spans){
                    $span.style.color = "green";
                }
        </script>
    </body>
</html>
