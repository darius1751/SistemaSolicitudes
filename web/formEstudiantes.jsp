<%@page import="Clases.Estado"%>
<%@page import="Clases.Facultad"%>
<%@page import="DAO.FacultadDAO"%>
<%@page import="Clases.Area"%>
<%@page import="DAO.AreaDAO"%>
<%@page import="DAO.SolicitudDAO"%>
<%@page import="DTO.SolicitudDTO"%>
<%@page import="Clases.Solicitud"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <style>
            body{
                background-color: black;
            }
            input, p,textArea{
                color:white;
            }
            table{
                color:white;
            }
            #btnConsultar{
                margin-top: 500px;
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
            String identificacion = request.getSession().getAttribute("identificacion").toString();
        %>
        <div class="row">
            <form class="col s6" method="post" action="formEstudiantes.jsp">
                <div class="row">
                    <div class="input-field col s6">
                        <input type='text' name='txtFecha'readonly>
                        <label>Fecha</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input type="text" value='<%=identificacion%>' name='txtIdentificacion' readonly>
                        <label>Identificacion</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <select required name='cmbxFacultad' >
                            <option value="" disabled selected>Seleccione la Facultad</option>
                            <%
                                FacultadDAO facultadDAO = new FacultadDAO("sistemadesolicitudesmeliza");
                                LinkedList<Facultad> facultades = facultadDAO.getFacultades();
                                if(facultades != null){
                                    if(!facultades.isEmpty()){
                                        for(final Facultad facultad : facultades){
                                
                            %>
                            <option value="<%=facultad.getCodigo()%>"><%=facultad.getNombre()%></option>
                            <%
                                    }
}
                                }
                            %>
                        </select>
                        <label>Facultad</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <select required name='cmbxArea'>
                            <option value="" disabled selected>Seleccione el Area</option>
                            <%
                                AreaDAO areaDAO = new AreaDAO("sistemadesolicitudesmeliza");
                                LinkedList<Area> areas = areaDAO.getAreas();
                                if(areas != null){
                                    if(!areas.isEmpty()){
                                        for(final Area area : areas){
                                
                            %>
                            <option value="<%=area.getCodigo()%>"><%=area.getNombre()%></option>
                            <%
                                    }
}
                                }
                            %>
                        </select>
                        <label>Area</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <textarea  class="materialize-textarea" name="txtRequerimiento"></textarea>
                        <label>Requerimiento</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input type="text" value='Pendiente' name='txtEstado'readonly>
                        <label>Identificacion</label>
                    </div>
                </div>
                <input type='submit' value='Registrar' class="waves-effect waves-light btn" name="btnRegistrar">
            </form>
        </div>
        <form style='display:inline-block;margin-left: 10px;' method='post' action='solicitudesEstudiante.jsp'>
            <input type='submit' value='Consultar' class="waves-effect waves-light btn" name="btnConsultar">
            <input type='hidden' value=<%=identificacion%> name='txtIdentificacion'>
        </form> 
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script>
            $date = document.querySelector('input[type="text"]');
            $date.value = new Date().toLocaleDateString().replaceAll("/","-");
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var elems = document.querySelectorAll('select');
                var instances = M.FormSelect.init(elems, {classes: '', dropdownOptions: {}});
            });
            const $inputDate = document.querySelector('input[type="date"]');

        </script>
        <%
            if (request.getParameter("btnRegistrar") != null) {
                SolicitudDTO solicitudDTO = new SolicitudDTO("sistemadesolicitudesmeliza");
                if (solicitudDTO.registrar(new Solicitud(
                        0,
                        request.getParameter("txtFecha"),
                        identificacion,
                        new Facultad(Integer.parseInt(request.getParameter("cmbxFacultad")),""),
                        new Area(Integer.parseInt(request.getParameter("cmbxArea")),""),
                        request.getParameter("txtRequerimiento"),
                        new Estado(1,request.getParameter("txtEstado"))
                ))) {
                    out.println("<p>Se a registrado la solicitud Correctamente<p>");
                } else {
                    out.println("<p>No fue posible registrar la solicitud</p>");
                }

            }
        %>
    </body>
</html>
