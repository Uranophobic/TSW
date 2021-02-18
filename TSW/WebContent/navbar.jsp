<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="bean.Utente, bean.Prodotto ,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<style>

.topnav {
	overflow: hidden;
	width: 95%;
}
.topnav a {
  float: left;
  display: block;
  color: #394a3e;
  text-align: center;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {

  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

.topnav .icon {
  display: none;
}

.topnav {
	overflow: hidden;
	/* width: 95%; */
}

@media screen and (max-width: 768px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
  
  .topnav.responsive {
	position: relative;
	z-index: 9999999999;
}
}

@media screen and (max-width: 768px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
</style>
</head>
<body>


<nav>
<div class="contenutoNav">


	<ul class="listaNav">
			<li class="iconNav"> <!-- elemento che contiene le icone -->
			<% if(session.getAttribute("capoSessione") != null ){ %>
				 <a href="amministratore?azioneCapo=visualizzaProd"><button class="bottoni bottoni-colori">GESTIONE AMMINISTRATORE</button></a> 
			<% } %>
			
			<%
				if(session.getAttribute("utenteSessione") != null){
				
			%>
				<div class="iconeContenitore">
				
				  	<!-- profilo utente  -->
					<div class="icona"> 
						  <a href="profilo.jsp"><img class="size"  src="https://img.icons8.com/fluent-systems-regular/32/000000/user.png"/></a><!-- cambia immagine -->
						 <a class="iconaTxt" href="profilo.jsp"> Profilo Utente </a>
					</div>

					<!-- carrello -->
					<div class="icona"> 
					<a href="carrello?azioneCarrello=visualizzaCarrello">	<img class="size" src="https://img.icons8.com/small/32/000000/shopping-cart.png"/> </a>
						<a class="iconaTxt" href="carrello?azioneCarrello=visualizzaCarrello"> Carrello </a>
					</div>
					
					<!-- logout -->
					<div class="icona"> 
					<a href="login?azioneLogin=logout"><img  class="size" src="https://img.icons8.com/fluent-systems-regular/32/000000/exit.png"/></a>
						<a class="iconaTxt" href="login?azioneLogin=logoutUtente"> Logout </a>
					</div>
				</div>
				<% } else{ %>	
				 <a href="login.jsp"><button class=" bottoni bottoni-colori ">ACCEDI</button></a>
			<% } %>
			 </li>
		
			<!-- logo -->
			<li class="logoNav"> 
				<div class= "logoContenitore">
					<a  href="HomePage.jsp">
				  		<img  class="logo" alt="logo.png" src="logo/logo_small.png">
				  	</a> 
			  	</div>
			</li>
		 
		 	
			
		
			
			
			<li  id="navbarVerde">
					<div class="topnav" id="myTopnav">
		  				<a href="HomePage.jsp" class="item">HOMEPAGE</a>
						  <a href="prodotto?azioneP=visualizzaCatalogo" class="item">CATALOGO</a>
						   <a  href="InformazioniServlet?informazioni=assistenza" class="item">ASSISTENZA</a>
						  <a  href="InformazioniServlet?informazioni=chisiamo" class="item"> CHI SIAMO</a>
						 <a href="InformazioniServlet?informazioni=comefunziona" class="item"> COME FUNZIONA</a>
						 
							  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
							    <i class="fa fa-bars"></i>
							  </a>
</div>
	 
			</li>
			
	 
		
	</ul>
</div>
</nav>
<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>

</body>
</html>
