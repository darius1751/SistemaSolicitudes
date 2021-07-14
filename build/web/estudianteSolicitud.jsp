<%@page import="Clases.Area"%>
<%@page import="DAO.AreaDAO"%>
<%@page import="Clases.Facultad"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.FacultadDAO"%>
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
            input,textArea{
                color:white;
            }
            input[type="date"]::-webkit-calendar-picker-indicator{
                background-image: url("https://cdn4.iconfinder.com/data/icons/small-n-flat/24/calendar-64.png");
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
        %>
        <nav style="text-align: center;background: #999999">
            <a class="waves-effect waves-light btn" href='formEstudiantes.jsp'>Estudiantes</a>
            <a class="waves-effect waves-light btn" href='formAdministrador.jsp'>Administrador</a>
        </nav>
        <div class="row">
            <form class="col s12" method="post">
                <div class="row">
                    <div class="input-field col s6">
                        <input  name='txtFecha'type="date" class="validate" placeholder="Ingrese su Nombre:">
                        <label>Fecha:</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input placeholder="Ingrese su Identificacion:" type="text" class="validate" name='txtIdentificacion'>
                        <label>Identificacion</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <select required name='cmbxFacultad'>
                            <option value="" disabled selected>Seleccione su facultad</option>
                            <%
                                FacultadDAO facultadDAO = new FacultadDAO("sistemadesolicitudesmeliza");
                                LinkedList<Facultad> facultades = facultadDAO.getFacultades();
                                if(facultades != null){
                                    if(!facultades.isEmpty()){
                                        for(final Facultad facultad : facultades){
                                            out.println("<option value='"+facultad.getCodigo()+"'>"+facultad.getNombre()+"</option>");
                                        }
                                    }
                                }
                                    
                            %>
                        </select>
                        <label>Facultades</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <select required name='cmbxArea'>
                            <option value="" disabled selected>Seleccione su area</option>
                            <%
                                AreaDAO areaDAO = new AreaDAO("sistemadesolicitudesmeliza");
                                LinkedList<Area> areas = areaDAO.getAreas();
                                if(areas != null){
                                    if(!areas.isEmpty()){
                                        for(final Area area : areas){
                                            out.println("<option value='"+area.getCodigo()+"'>"+area.getNombre()+"</option>");
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
                        <textarea name='txtRequerimiento'class="materialize-textarea"></textarea>
                        <label>Requerimientos</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input  name='txtFecha'type="text" value='Pendiente' readonly>
                        <label>Estado</label>
                    </div>
                </div>
                <input class="waves-effect waves-light btn" type="submit" value='Registrar' name='btnRegistrar'/>
                <input class="waves-effect waves-light btn" type="submit" value='Consultar' name='btnConsultar'/>
            </form>
        </div>
        
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var elems = document.querySelectorAll('select');
                const options = {classes: '', dropdownOptions: {}};
                var instances = M.FormSelect.init(elems, options);
            });
            const $inputDate = document.querySelector('input[type="date"]');

        </script>
    </body>
</html>
