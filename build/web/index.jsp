<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <style>
            nav input{
                color:white;
            }
            
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
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
