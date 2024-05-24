

<%@page import="mundo.GestionarJugadores"%>
<%@page import="mundo.Jugador"%>
<%@page import="mundo.GestionarEquipos"%>
<%@page import="mundo.Equipo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="lib/header.jsp" %>


<!DOCTYPE html>
<html lang="en">
<nav id="sidebar-wrapper" class="bg-success" style="opacity: 0.9;">
    <ul class="sidebar-nav">
        <li class="sidebar-brand"><a href="index.jsp" style="font-weight: bold; color: white;">Inicio</a></li>
        <li class="sidebar-nav-item"><a href="plantilla.jsp" style="font-weight: bold; color: white;">Plantilla</a></li>
    </ul>
</nav>



    <head>
        <!-- Meta Tags -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Mundial Colombia 2027</title>
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
    body {
        background-image: url("images/fondo.jpg");
        background-size: cover;
        background-repeat: no-repeat;
    }
    .table-bordered {
        border: 1px solid #dee2e6;
    }

    .table {
        width: 100%;
        margin-bottom: 1rem;
        color: #212529;
    }

    .table th,
    .table td {
        padding: 0.75rem;
        vertical-align: top;
        border-top: 1px solid #dee2e6;
    }
</style>

<nav class="navbar navbar-light bg-light">
    <a class="img-fluid mx-auto navbar-brand">
        <img src="images/banner.jpg" style="width: 100%; height: auto;" class="d-inline-block align-top" alt="banner">
    </a>
</nav>
    </head>



       <!-- Desplegable para escoger equipo con color amarillo -->
<div class="container text-center">
    <select id="selectEquipo" class="form-select mb-3 border border-primary mx-auto text-dark bg-warning" aria-label="Seleccionar equipo" style="width: auto;">
        <option selected disabled>Selecciona un equipo</option>
        <%
            ServletContext context = getServletContext();
            GestionarEquipos gestionarEquipos = new GestionarEquipos();
            List<Equipo> equipos = gestionarEquipos.getMisEquipos(context);
            for (Equipo equipo : equipos) {
        %>
        <option value="<%= equipo.getIdEquipo()%>"><%= equipo.getPais()%></option>
        <%
            }
        %>
    </select>
</div>


        <div class="container">
            <!-- Columnas para mostrar jugadores e información -->
            <div class="row">
                <!-- Columna izquierda: Jugadores -->
                <div class="col-lg-6 text-center bordered-box">
                    <h3>Jugadores</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Edad</th>
                                <th>Posición</th>
                                <th>Ver</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                GestionarJugadores gestionarJugadores = new GestionarJugadores();
                                List<Jugador> jugadores = gestionarJugadores.getMisJugadores(context);
                                for (Jugador jugador : jugadores) {
                            %>
                            <tr class="jugador" data-equipo="<%= jugador.getIdEquipo()%>">
                                <td><%= jugador.getNombre()%></td>
                                <td><%= jugador.getEdad()%></td>
                                <td><%= jugador.getPosicion()%></td>
                                <td>
                                    <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#verModal<%= jugador.getIdJugador()%>"><i class="fa fa-eye"></i></a>
                                    <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#verModal2<%= jugador.getIdJugador()%>"><i class="fa fa-edit"></i></a>
                                    <a href="sv_EliminarJugador?id=<%= jugador.getIdJugador()%>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de eliminar este jugador?')"><i class="fa fa-trash"></i></a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>

                <!-- Columna derecha: Información del Jugador -->
                <div class="col-lg-6 text-center bordered-box">
                    <h3>Información del Jugador</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Edad</th>
                                <th>Altura</th>
                                <th>Peso</th>
                                <th>Salario</th>
                                <th>Posición</th>
                                <th>Foto</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Jugador jugador : jugadores) {
                                    String traerImagen = jugador.getFoto();
                            %>
                            <tr class="jugador-info" data-equipo="<%= jugador.getIdEquipo()%>">
                                <td><%= jugador.getIdJugador()%></td>
                                <td><%= jugador.getNombre()%></td>
                                <td><%= jugador.getEdad()%></td>
                                <td><%= jugador.getAltura()%></td>
                                <td><%= jugador.getPeso()%></td>
                                <td><%= jugador.getSalario()%></td>
                                <td><%= jugador.getPosicion()%></td>
                                <td>
                                    <% if (traerImagen != null && !traerImagen.isEmpty()) {%>
                                    <img src="<%= request.getContextPath() + "/" + traerImagen%>" alt="Imagen del Jugador" class="img-fluid" style="width: 50px; height: auto;">
                                    <% } else { %>
                                    <p>No hay imagen disponible</p>
                                    <% } %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Modales -->
        <%
            for (Jugador jugador : jugadores) {
                String traerImagen = jugador.getFoto();
        %>
               <!-- Modal para visualizar Jugador -->

        <div class="modal fade" id="verModal<%= jugador.getIdJugador()%>" tabindex="-1" aria-labelledby="verModalLabel<%= jugador.getIdJugador()%>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="verModalLabel<%= jugador.getIdJugador()%>">Información del Jugador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>ID: <%= jugador.getIdJugador()%></p>
                        <p>Nombre: <%= jugador.getNombre()%></p>
                        <p>Edad: <%= jugador.getEdad()%></p>
                        <p>ID del Equipo: <%= jugador.getIdEquipo()%></p>
                        <!-- Agrega aquí el resto de los datos del jugador -->
                        <% if (traerImagen != null && !traerImagen.isEmpty()) {%>
                        <p><img src="<%= request.getContextPath() + "/" + jugador.getFoto()%>" alt="Imagen del Jugador" class="img-fluid"></p>
                            <% } else { %>
                        <p>No hay imagen disponible</p>
                        <% } %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
        <%
            GestionarJugadores gesJugadores = new GestionarJugadores();
            ServletContext context1 = request.getServletContext();
            gesJugadores.cargarJugadoresDesdeArchivo(context1);
            List<Jugador> misJugadores = gesJugadores.getMisJugadores(context1);
        %>
        <% if (misJugadores != null && !misJugadores.isEmpty()) {
                for (Jugador j : misJugadores) {
                    String traerImagen = j.getFoto();
        %>                      
        <div class="modal fade" id="verModal3<%= j.getIdJugador()%>" tabindex="-1" aria-labelledby="verModalLabel<%= j.getIdJugador()%>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="verModalLabel<%= j.getIdJugador()%>">Información del Jugador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>ID: <%= j.getIdJugador()%></p>
                        <p>Nombre: <%= j.getNombre()%></p>
                        <p>Edad: <%= j.getEdad()%> años</p>
                        <p>Altura: <%= j.getAltura()%> m</p>
                        <p>Peso: <%= j.getPeso()%> Kg</p>
                        <p>Salario: <%= j.getSalario()%></p>
                        <p>Posición: <%= j.getPosicion()%></p>
                        <p>Id Equipo: <%= j.getIdEquipo()%></p>
                        <% if (traerImagen != null && !traerImagen.isEmpty()) {%>
                        <p><img src="<%= request.getContextPath() + "/" + j.getFoto()%>" alt="Foto del jugador" class="img-fluid"></p>
                            <% } else { %>
                        <p>No hay imagen disponible</p>
                        <% } %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <% }
                         }%>



        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="recursosTwo/js/scripts.js"></script>

        <!-- JavaScript para filtrar jugadores -->
        <script>
                                        function filtrarJugadores() {
                                            var selectEquipo = document.getElementById("selectEquipo");
                                            var selectedEquipoId = selectEquipo.value;
                                            var jugadores = document.getElementsByClassName("jugador");
                                            var jugadoresInfo = document.getElementsByClassName("jugador-info");

                                            // Ocultar todos los jugadores
                                            for (var i = 0; i < jugadores.length; i++) {
                                                jugadores[i].style.display = "none";
                                            }
                                            for (var i = 0; i < jugadoresInfo.length; i++) {
                                                jugadoresInfo[i].style.display = "none";
                                            }

                                            // Mostrar solo los jugadores del equipo seleccionado
                                            var jugadoresEquipo = document.querySelectorAll("[data-equipo='" + selectedEquipoId + "']");
                                            for (var j = 0; j < jugadoresEquipo.length; j++) {
                                                jugadoresEquipo[j].style.display = "";
                                            }
                                        }

                                        // Agregar un listener para detectar cambios en la selección del desplegable
                                        document.getElementById("selectEquipo").addEventListener("change", filtrarJugadores);

                                        // Filtrar los jugadores cuando se cargue la página
                                        window.onload = function () {
                                            if (document.getElementById("selectEquipo").value !== "Selecciona un equipo") {
                                                filtrarJugadores();
                                            }
                                        };
        </script>
                <%@include file="lib/footer.jsp" %>

    </body>
</html>