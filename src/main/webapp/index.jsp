<%@page import="mundo.GestionarEquipos"%>
<%@page import="mundo.Equipo"%>
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
    <body id="page-top">
    <!-- Navigation -->
<nav class="navbar navbar-expand-lg text-uppercase fixed-top" id="mainNav" style="background-color: rgba(128, 128, 128, 0.8);">
    <div class="container">
        <a class="navbar-brand" href="#page-top">Inicio</a>
        <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
                <div class="header text-center text-white">
                    <h1>Bienvenidos al Mundial de Fútbol 2026</h1>
                </div>
                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Inicio</a></li>
                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Equipos</a></li>
            </ul>
        </div>
    </div>
</nav>




<!-<!-- Portfolio Section -->
<section class="page-section portfolio" id="portfolio" style="background-color: #2c3e50;">
    <div class="container">
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Agregar Nuevo Equipo</h2>
        
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-8 mb-5">
                <!-- Formulario de creación de equipo -->
                <div id="formCrearEquipo" class="form-container">
                    <h5 class="form-heading">Agregar Equipo</h5>
                    <form action="sv_AgregarEquipo" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="idEquipo" class="form-label">Id:</label>
                            <input type="text" name="idEquipo" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="pais" class="form-label">País:</label>
                            <input type="text" name="pais" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="director" class="form-label">Director:</label>
                            <input type="text" name="director" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="bandera" class="form-label">Escudo:</label>
                            <input type="file" name="bandera" id="imagen" class="form-control" accept="image/*" required>
                        </div>
                        <div class="d-grid">
                            <input type="submit" name="agregar" value="Agregar Equipo" class="btn btn-success">
                        </div>
                    </form>
                    <div class="switch-form-btn">
                        <button class="btn btn-primary mt-3" onclick="mostrarFormulario('formCrearJugador')">Agregar Jugador</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


                      <!-- Formulario de creación de jugador -->
<div id="formCrearJugador" class="form-container" style="display: none; background-color: #2c3e50; padding: 20px; border-radius: 8px; color: white;">
    <h5 class="form-heading">Agregar Jugador</h5>
    <form action="sv_AgregarJugador" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="idJugador" class="form-label">Id:</label>
            <input type="text" name="idJugador" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre:</label>
            <input type="text" name="nombre" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="edad" class="form-label">Edad:</label>
            <input type="text" name="edad" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="altura" class="form-label">Altura:</label>
            <input type="text" name="altura" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="peso" class="form-label">Peso:</label>
            <input type="text" name="peso" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="salario" class="form-label">Salario:</label>
            <input type="text" name="salario" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="posicion" class="form-label">Posición:</label>
            <select name="posicion" class="form-control" required>
                <option value="ARQ">ARQ</option>
                <option value="DEF">DEF</option>
                <option value="CEN">CEN</option>
                <option value="DEL">DEL</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="foto" class="form-label">Foto:</label>
            <input type="file" name="foto" id="imagen" class="form-control" accept="image/*" required>
        </div>
        <div class="mb-3">
            <label for="idEquipo" class="form-label">Equipo:</label>
            <select name="idEquipo" class="form-control" required>
                <!-- Aquí deberías agregar los equipos disponibles desde el servidor -->
            </select>
        </div>
        <div class="d-grid">
            <input type="submit" name="agregar" value="Agregar Jugador" class="btn btn-success">
        </div>
    </form>
    <div class="switch-form-btn">
        <button class="btn btn-index mt-3" onclick="mostrarFormulario('formCrearEquipo')">Agregar Equipo</button>
    </div>
</div>



        <!-- Contact Section-->
        <section class="page-section" id="contact">
            <div class="container">
                <br><br>

                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Listado de equipos</h2>




                <!-- Lista de equipos y jugadres -->
                <div class="row justify-content-center"> <!-- Modificado justify-content-start a justify-content-center -->
                    <div class="col-md-8">
                        <div class="card card-body text-center"> <!-- Agregada la clase text-center -->
                            <h5 class="text-center mb-3">Listado de Equipos</h5>
                            <div class="row"> <!-- Nuevo div row para contener los equipos -->
                                <%
                                    GestionarEquipos gesEquipos = new GestionarEquipos();
                                    ServletContext context1 = request.getServletContext();
                                    gesEquipos.cargarEquiposDesdeArchivo(context1);
                                    List<Equipo> misEquipos = gesEquipos.getMisEquipos(context1);

                                    if (misEquipos != null) {
                                        int contador = 0; // Variable para contar equipos
                                        for (Equipo equipo : misEquipos) {
                                            if (contador % 3 == 0 && contador != 0) { // Si es múltiplo de 3 y no es el primer equipo, cierra el div row y abre uno nuevo
                                %>
                            </div>
                            <div class="row">
                                <% }%>
                                <div class="col-md-4"> <!-- Cambiado col-md-6 a col-md-4 para que cada equipo ocupe un tercio del ancho en dispositivos medianos -->
                                    <div class="equipo-container mb-4">
                                        <div class="row align-items-center">
                                            <div class="col-md-12 text-center"> <!-- Cambiado col-md-4 a col-md-12 para que ocupe todo el ancho -->
                                                <!-- Aquí va la foto del país -->
                                                <img src="<%= request.getContextPath() + "/" + equipo.getImagenBandera()%>" alt="Bandera de <%= equipo.getPais()%>" class="img-fluid">
                                            </div>
                                            <div class="col-md-12"> <!-- Cambiado col-md-8 a col-md-12 para que ocupe todo el ancho -->
                                                <!-- Aquí va la información del equipo -->
                                                <h6>ID: <%= equipo.getIdEquipo()%></h6>
                                                <p>País: <%= equipo.getPais()%></p>
                                                <p>Director: <%= equipo.getDirector()%></p>
                                                <div class="acciones">
                                                    <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#verModal<%= equipo.getIdEquipo()%>"><i class="fa fa-eye"></i></a>
                                                    <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#verModal2<%= equipo.getIdEquipo()%>"><i class="fa fa-edit"></i></a>
                                                    <a href="sv_EliminarEquipo?id=<%= equipo.getIdEquipo()%>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de eliminar este equipo?')"><i class="fa fa-trash"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        contador++;
                                    }
                                } else {
                                %>
                                <div align="center">
                                    <p>No hay equipos registrados</p>
                                </div>
                                <% } %>
                            </div> <!-- Cierre del div row -->
                        </div>
                    </div>
                </div>

                <!-- Enlace a la página de imágenes de equipos -->
                <div class="row justify-content-center mt-4" style="background-color: yellow;">
    <div class="col-md-8 text-center">
        <a href="jugador.jsp">
            <button class="btn btn-index">Equipos</button>
        </a>
    </div>
</div>


                <% if (misEquipos != null && !misEquipos.isEmpty()) {
                        for (Equipo e : misEquipos) {
                            String traerImagen = e.getImagenBandera();
                %>
        </section>




       <!-- Modal Ver Equipo -->
<div class="modal fade" id="verModal<%= e.getIdEquipo()%>" tabindex="-1" aria-labelledby="verModalLabel<%= e.getIdEquipo()%>" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #d4e6f1;">
            <div class="modal-header">
                <h5 class="modal-title" id="verModalLabel<%= e.getIdEquipo()%>">Información del Equipo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>ID: <%= e.getIdEquipo()%></p>
                <p>Pais: <%= e.getPais()%></p>
                <p>Director: <%= e.getDirector()%></p>
                <% if (traerImagen != null && !traerImagen.isEmpty()) { %>
                    <p><img src="<%= request.getContextPath() + "/" + e.getImagenBandera()%>" alt="Imagen del escudo" class="img-fluid"></p>
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


       <!-- Modal Editar Equipo -->
<div class="modal fade" id="verModal2<%= e.getIdEquipo()%>" tabindex="-1" aria-labelledby="verModal2Label<%= e.getIdEquipo()%>" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #d4e6f1;">
            <div class="modal-header">
                <h5 class="modal-title" id="verModal2Label<%= e.getIdEquipo()%>">Editar Equipo con ID: <%= e.getIdEquipo()%></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="sv_EditarEquipo" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="<%= e.getIdEquipo()%>">
                    <div class="mb-3">
                        <label for="pais" class="form-label">Pais:</label>
                        <input type="text" name="pais" value="<%= e.getPais()%>" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="director" class="form-label">Director:</label>
                        <input type="text" name="director" value="<%= e.getDirector()%>" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="bandera" class="form-label">Imagen Bandera:</label>
                        <input type="file" name="bandera" id="imagen" class="form-control" accept="image/*">
                    </div>
                    <div class="mb-2">
                        <a href="plantilla.jsp" class="btn btn-success btn-block">Modificar Plantilla</a>
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
            String mensaje = (String) request.getSession().getAttribute("mensaje");
            if (mensaje != null && !mensaje.isEmpty()) {%>
        <div id="autoToast" class="toast position-fixed bottom-0 end-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header bg-warning text-dark">
                <strong class="me-auto">Notificación</strong>
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
                autoToast.show();
            }, 0);
        </script>                                    
        <%@include file="lib/footer.jsp" %>
        <!-- Scripts al final del body para mejorar la carga de la página -->
        <!-- jQuery, Popper.js, Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Script para controlar la navegación entre formularios -->
        <script>
            function mostrarFormulario(idFormulario) {
                document.getElementById('formCrearEquipo').style.display = 'none';
                document.getElementById('formCrearJugador').style.display = 'none';
                document.getElementById(idFormulario).style.display = 'block';
            }
        </script>
    </body>
</html>