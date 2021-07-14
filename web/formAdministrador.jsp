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
        <form action="resultadosAdministrador.jsp" method='post'>
            <p>
                <label>
                    <input name="rdbtnOpcion" type="radio" value='1'checked />
                    <span>Registrar Estudiante</span>
                </label>
            </p>
            <p>
              <label>
                <input name="rdbtnOpcion" type="radio" value='2'/>
                <span>Ver todas las Solicitudes</span>
              </label>
            </p>
            <p>
              <label>
                <input  name="rdbtnOpcion" type="radio" value='3'/>
                <span>Dar respuesta a Solicitud</span>
              </label>
            </p>
            <p>
              <input class="waves-effect waves-light btn" type="submit" value='Enviar'/>
            </p>
        </form>
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
