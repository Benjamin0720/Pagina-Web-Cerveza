<%-- 
    Document   : contacto
    Created on : 20/07/2020, 09:09:20 AM
    Author     : benja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body background="">
        <nav class="navbar navbar-expand-lg navbar bg">
  <a class="navbar-brand" href="cliente.jsp">Tienda Cerveza</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href=""><span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="">Contacto</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       <%
            try{
               String nombre = request.getSession().getAttribute("nombre").toString();
               if(nombre!=null){
                   %>
          Bienvenido <%=nombre%>
          <%            
                } else {
                    response.sendRedirect("Login.jsp");
                }
            } catch (Exception ex) {
                //response.sendRedirect("error.jsp?mensaje=" + ex);
                %>
                Iniciar sesion
                <%
            }
        %> 
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="login.jsp">Iniciar Sesion</a>
          <a class="dropdown-item" href="#"></a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="LoginServlet?btnLogin=cerrar">Cerrar Sesion</a>
        </div>
      </li>
    </form>
  </div>
</nav>
    <p align = "center">
    <!-- Footer -->
  <footer class="w3-padding-64 w3-light-grey w3-small w3-center" id="footer">
    <div class="w3-row-padding">
      <div class="w3-col s4">
        <h4>Contactenos</h4>
        <p>¿Alguna opinion?</p>
        <form action="resultado.jsp" target="_blank" method="post">
            <p><input class="w3-input w3-border" type="text" placeholder="Name" name="Para" required=""/></p>
            <p><input class="w3-input w3-border" type="text" placeholder="Email" name="De" required=""/></p>
            <p><input class="w3-input w3-border" type="password" placeholder="Contrasena" name="clave" required=""/></p>
            <p><input class="w3-input w3-border" type="text" placeholder="Subject" name="Asunto" required=""/></p>
            <p><input class="w3-input w3-border" type="text" placeholder="Message" name="Mensaje" required=""/></p>
            <button type="submit" class="w3-button w3-block w3-black" value="Enviar">Enviar</button>
        </form>
      </div>

      <div class="w3-col s4">
        <h4>Acerca de</h4>
        <p><a href="#">¿Quienes Somos?</a></p>
        <p>Somos un empresa dedicada a la marihuana medicinal todo legal para personas que lo necesiten</p>
        <div id="newsletter" class="w3-modal">
        <p><a href="#">Trabaje con nosotros</a></p>
        <p><a href="#">Soporte</a></p>
        <p><a href="#">Encontrar Tienda</a></p>
        <p><a href="#">Envio</a></p>
        <p><a href="#">Pago</a></p>
        <p><a href="#">Ayuda</a></p>
      </div>

      <div class="w3-col s4 w3-justify">
        <h4>Contactenos</h4>
        <p><i class="fa fa-fw fa-map-marker"></i> Growshop</p>
        <p><i class="fa fa-fw fa-phone"></i> +56984231886</p>
        <p><i class="fa fa-fw fa-envelope"></i> blara81@gmail.com</p>
        <h4>Aceptamos</h4>
        <p><i class="fa fa-fw fa-cc-amex"></i> Transferencia bancaria</p>
        <p><i class="fa fa-fw fa-credit-card"></i> Tarjeta de credito</p>
        <br>
        <i class="fa fa-facebook-official w3-hover-opacity w3-large"></i>
        <i class="fa fa-instagram w3-hover-opacity w3-large"></i>
        <i class="fa fa-snapchat w3-hover-opacity w3-large"></i>
        <i class="fa fa-pinterest-p w3-hover-opacity w3-large"></i>
        <i class="fa fa-twitter w3-hover-opacity w3-large"></i>
        <i class="fa fa-linkedin w3-hover-opacity w3-large"></i>
      </div>
    </div>
  </footer>
  <!-- End page content -->
</div>

<!-- Newsletter Modal -->
<div id="newsletter" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom" style="padding:32px">
    <div class="w3-container w3-white w3-center">
      <i onclick="document.getElementById('newsletter').style.display='none'" class="fa fa-remove w3-right w3-button w3-transparent w3-xxlarge"></i>
      <h2 class="w3-wide">Contactenos</h2>
      <p>Mandenos un mensaje a nuestro correo y le resolveremos sus dudas</p>
      <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
      <button type="button" class="w3-button w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('newsletter').style.display='none'">Enviar</button>
    </div>
  </div>
</div>
<script>
// Accordion 
function myAccFunc() {
  var x = document.getElementById("demoAcc");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}

// Click on the "Jeans" link on page load to open the accordion for demo purposes
document.getElementById("myBtn").click();


// Open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
</script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </body>
</html>
