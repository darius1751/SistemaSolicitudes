<%@page import="DAO.AdministradorDAO"%>
<%@page import="DAO.EstudianteDAO"%>
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
            input{
                color:white;
            }
            div.row{
                text-align: center;
                width: 500px;
                margin: 0 auto;
            
            }
            form.col{
                margin: 0 auto;
                border: 3px #999999 dashed;
            }
            p{
                color:red;
            }
            
        </style>
        <title>Login</title>
    </head>
    <body>
        <%
           //Object tipo = request.getSession().getAttribute("tipo");
           int tipo = Integer.parseInt(request.getParameter("txtTipo"));
           String usuario= "";
           switch (tipo) {
                   case 1:
                       usuario = "Usuario Estudiante:";
                       break;
                   default:
                       usuario = "Usuario Administrador:";
               }
        %> 
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
        <div class="row">
            <form class="col s6" method="post" action="login.jsp">
                <div class="row">
                    <div class="input-field col s6">
                        <input placeholder="Ingrese su Usuario:" type="text" class="validate" name='txtUsuario' autocomplete="off">
                        <label><%=usuario%></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input placeholder="Ingrese su Password" type="password" class="validate" name='txtPassword'>
                        <label>Password:</label>
                    </div>
                </div>
                <input type='hidden' name='txtTipo' value='<%=tipo%>'/>
                <input type='submit' value='Iniciar Sesion' class="waves-effect waves-light btn" name='btnIniciar'/>
            </form>
        </div>
        <%
            if(request.getParameter("btnIniciar")!= null){
                
                String nombre = null;
                String identificacion = request.getParameter("txtPassword");
                session.setAttribute("identificacion",identificacion);
                switch (tipo) {
                    case 1:
                         EstudianteDAO estudianteDAO = new EstudianteDAO("sistemadesolicitudesmeliza");
                        
                    if((nombre = estudianteDAO.logueo(request.getParameter("txtUsuario"), request.getParameter("txtPassword"))) != null){
                        session.setAttribute("usuario", nombre);
                        response.sendRedirect("formEstudiantes.jsp");
                    }else{
                        out.print("<p>No se encuentra estudiante con este USUARIO/PASSWORD</p>");
                    }
                        break;
                    case 2:
                        AdministradorDAO administradorDAO = new AdministradorDAO("sistemadesolicitudesmeliza");
                        if((nombre = administradorDAO.logueo(request.getParameter("txtUsuario"), identificacion)) != null){
                            session.setAttribute("usuario", nombre);
                            response.sendRedirect("formAdministrador.jsp");
                        }else{
                            out.print("<p>No se encuentra Administrador con este USUARIO/PASSWORD</p>");
                    }
                        break;
                        
                }
               
            }
        %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
