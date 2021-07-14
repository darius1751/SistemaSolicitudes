<%@page import="java.util.LinkedList"%>
<%@page import="DAO.SolicitudDAO"%>
<%@page import="Clases.Solicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <style>
            body{
                background-color: black;
            }
            table,p{
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
                SolicitudDAO solicitudDAO = new SolicitudDAO("sistemadesolicitudesmeliza");
                LinkedList<Solicitud> solicitudes = solicitudDAO.solicitudes(request.getParameter("txtIdentificacion"));
                if (solicitudes != null) {
                    if (!solicitudes.isEmpty()) {


        %>
        <table class="highlight">
            <thead>
                <tr>
                    <th>
                        Fecha
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
                    for (final Solicitud solicitud : solicitudes) {%>
                <tr>
                    <td>
                        <%=solicitud.getFecha()%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  
    </body>
</html>
