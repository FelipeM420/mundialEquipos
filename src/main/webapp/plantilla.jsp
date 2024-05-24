<%@page import="mundo.GestionarEquipos"%>
<%@page import="mundo.GestionarJugadores"%>
<%@page import="mundo.Equipo"%>
<%@page import="mundo.Jugador"%>
<%@page import="java.util.List"%>
<%@include file="lib/header.jsp" %>


<!DOCTYPE html>
<html lang="en">
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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Mundial de Futbol</a>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <div class="header text-center text-white">
                    <h1>Bienvenidos al Mundial de F�tbol 2026</h1>
                </div>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Regresar al Inicio</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container p-4">
    <div class="card card-body">
        <h1 class="text-center mb-4">Mundial de Futbol Colombia 2027</h1> <!-- Titulo  -->
        <div class="row">
            <!-- Columna izquierda -->
            <div class="col-md-4">
                <div class="card card-body">
                    <h5 class="text-center mb-3">Agregar Nuevo Jugador</h5> 
                    <form action="sv_AgregarJugador" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="id">Id:</label>  
                            <input type="text" name="idJugador" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="placa">Nombre:</label>  
                            <input type="text" name="nombre" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="marca">Edad:</label>  
                            <input type="text" name="edad" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="marca">Altura</label>  
                            <input type="text" name="altura" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="marca">Peso:</label>  
                            <input type="text" name="peso" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="marca">Salario:</label>  
                            <input type="text" name="salario" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="marca">Posici�n:</label>  
                            <select name="posicion" class="form-control" required>
                                <option value="" selected disabled>Seleccione una posici�n</option>
                                <option value="ARQ">Portero</option>
                                <option value="DEF">Defensa</option>
                                <option value="CEN">Centrocampo</option>
                                <option value="DEL">Delantero</option>
                            </select>

                        </div>
                        <div class="mb-3">
                            <input type="file" name="foto" id="imagen" class="form-control" accept="image/*" required>
                        </div>
                        <div class="mb-3">
                            <label for="idEquipo">Equipo:</label>  
                            <select name="idEquipo" class="form-control" required>
                                <option selected>Selecciona el equipo del jugador</option>
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
                        <div class="d-grid">
                            <input type="submit" name="agregar" value="Agregar Jugador" class="btn btn-success btn-block">
                        </div>
                    </form>
                </div>
            </div>
            <!-- Columna derecha -->
            <div class="col-md-8">
                <div class="card card-body">
                    <h5 class="text-center mb-3">Listado de Jugadores</h5>
                    <table class="table table-striped" style="margin: 0 auto;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Edad</th>
                                <th>Posici�n</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <%
                            GestionarJugadores gesJugadores = new GestionarJugadores();
                            ServletContext context1 = request.getServletContext();
                            gesJugadores.cargarJugadoresDesdeArchivo(context1);
                            List<Jugador> misJugadores = gesJugadores.getMisJugadores(context1);

                            if (misJugadores != null) {
                                for (Jugador j : misJugadores) {
                        %>
                        <tbody>

                            <tr>
                                <td><%= j.getIdJugador()%></td>
                                <td><%= j.getNombre()%></td>
                                <td><%= j.getEdad()%></td>
                                <td><%= j.getPosicion()%></td>
                                <td>
                                    <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#verModa3<%= j.getIdJugador()%>"><i class="fa fa-eye"></i></a>
                                    <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#verModal2<%= j.getIdJugador()%>"><i class="fa fa-edit"></i></a>
                                    <a href="sv_EliminarJugador?id=<%= j.getIdJugador()%>" class="btn btn-danger" onclick="return confirm('�Est�s seguro de eliminar este jugador?')"><i class="fa fa-trash"></i></a>
                                </td>
                            </tr>
                            <% }
                            } else { %>
                            <tr align="center">
                                <td colspan="6">No hay jugadores en este equipo.</td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>

<% if (misJugadores != null && !misJugadores.isEmpty()) {
        for (Jugador j : misJugadores) {
            String traerImagen = j.getFoto();
%>                      

<!-- Modal Visualizar Jugador -->
<div class="modal fade" id="verModa3<%= j.getIdJugador()%>" tabindex="-1" aria-labelledby="verModalLabel<%= j.getIdJugador()%>" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #ADD8E6;">
            <div class="modal-header">
                <h5 class="modal-title" id="verModalLabel<%= j.getIdJugador()%>">Informaci�n del Jugador</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>ID: <%= j.getIdJugador()%></p>
                <p>Nombre: <%= j.getNombre()%></p>
                <p>Edad: <%= j.getEdad()%> a�os</p>
                <p>Altura: <%= j.getAltura()%> m</p>
                <p>Peso: <%= j.getPeso()%> Kg</p>
                <p>Salario: <%= j.getSalario()%></p>
                <p>Posici�n: <%= j.getPosicion()%></p>
                <p>Id Equipo: <%= j.getIdEquipo()%></p>
                <% if (traerImagen != null && !traerImagen.isEmpty()) {%>
                <p><img src="<%= request.getContextPath() + "/" + j.getFoto()%>" alt="Foto del jugador" class="img-fluid"></p>
                    <% } else { %>
                <p>No hay imagen disponible</p>
                <% }%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal Editar Jugador -->
<div class="modal fade" id="verModal2<%= j.getIdJugador()%>" tabindex="-1" aria-labelledby="verModal2Label<%= j.getIdJugador()%>" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #ADD8E6;">
            <div class="modal-header">
                <h5 class="modal-title" id="verModal2Label<%= j.getIdJugador()%>">Editar Jugador con ID: <%= j.getIdJugador()%></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="sv_EditarJugador" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="idJugador" value="<%= j.getIdJugador()%>">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre:</label>
                        <input type="text" name="nombre" value="<%= j.getNombre()%>" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="edad" class="form-label">Edad:</label>
                        <input type="text" name="edad" value="<%= j.getEdad()%>" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="altura" class="form-label">Altura:</label>
                        <input type="text" name="altura" value="<%= j.getAltura()%>" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="peso" class="form-label">Peso:</label>
                        <input type="text" name="peso" value="<%= j.getPeso()%>" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="salario" class="form-label">Salario:</label>
                        <input type="text" name="salario" value="<%= j.getSalario()%>" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="posicion" class="form-label">Posici�n:</label>
                        <input type="text" name="posicion" value="<%= j.getPosicion()%>" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="foto" class="form-label">Foto del jugador:</label>
                        <input type="file" name="foto" id="imagen" class="form-control" accept="image/*">
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-success btn-block">Guardar Cambios</button>
                        <button type="button" class="btn btn-danger btn-block" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%
        }
    }
%>

<%
    List<Equipo> listaEquipos = (List<Equipo>) request.getSession().getAttribute("listaEquipos");
    if (listaEquipos != null && !listaEquipos.isEmpty()) {
        for (Equipo e : listaEquipos) {%>
<div class="container mt-4">
    <div class="alert alert-success text-center" role="alert">
        <h1><%= e.getPais()%></h1>
    </div>
</div>

<% }
    } %>


<%
    String mensaje = (String) request.getSession().getAttribute("mensaje");
    if (mensaje != null && !mensaje.isEmpty()) {%>
<div id="autoToast" class="toast position-fixed bottom-0 end-0" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header bg-warning text-dark">
        <strong class="me-auto">Notificaci�n</strong>
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body bg-secondary text-light">
        <%= mensaje%>
    </div>
</div>
<%
        session.removeAttribute("mensaje");
    }
%>                        

<script>
    setTimeout(function () {
        var autoToast = new bootstrap.Toast(document.getElementById('autoToast'));
        autoToast.show();
    }, 0);
</script>

<%@include file="lib/footer.jsp" %>
