<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="bean.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">


<title>OLTRE IL GIARDINO</title>
<style>
/*
.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}

.sticky + .content {
  padding-top: 60px;
}*/
</style>
	
</head>

<body>

<nav>
	<div class="contenutoNav">
	
		<ul class="listaNav">
			<li class="iconNav"> <!-- elemento che contiene le icone -->
			<%
				if(session.getAttribute("utenteSessione") != null){
					
				
			%>
				<div class="iconeContenitore">
				
				  	<!-- profilo utente  -->
					<div class="icona"> 
						 <a href="dsProva.jsp"><img src="https://img.icons8.com/fluent-systems-regular/24/000000/user.png"/></a><!-- cambia immagine -->
						 <a class="iconaTxt" href="dsprova.jsp"> Profilo Utente </a>
					</div>

					<!-- wish list -->  
					<div  class="icona"> 
					<a href="wishlist.jsp">	<img class="size" src="https://img.icons8.com/small/32/000000/like.png"/> </a>
						<a class="iconaTxt" href="wishlist.jsp"> Lista dei Desideri </a>
						<!-- href="prodotto?azioneP=prova" questo stava prima -->
					</div>
		
					<!-- carrello -->
					<div class="icona"> 
					<a href="carrello?azioneCarrello=visualizzaCarrello">	<img class="size" src="https://img.icons8.com/small/32/000000/shopping-cart.png"/> </a>
						<a class="iconaTxt" href="carrello?azioneCarrello=visualizzaCarrello"> Carrello </a>
					</div>
				</div>
			<% } else{ %>	
				  <a href="login.jsp"><button class=" bottoni bottoni-colori ">ACCEDI</button></a>
			<% } %>
			 </li>
		
			<!-- logo -->
			<li class="logoNav"> 
				<div class= "logoContenitore">
					<a  href="">
				  		<img  class="logo" alt="logo.png" src="logo/logo_small.png">
				  	</a> 
			  	</div>
			</li>
		 
		 	<!-- barra di ricerca -->
			<li class="barraRicercaNav">  
				<div class="barraRicerca">
					 <form class="navbar-form " action="/action_page.php">
					      <div class="input-group">
					        <input type="text" class="form-control" placeholder="Search" name="search">
					        <div class="input-group-btn">
					         <button class="btnRicerca" type="submit"><i class="fa fa-search"></i></button>
					        </div>
					      </div>
					    </form>
				 </div>
			</li>
			
			<!-- navbar verde -->
			<li id="navbarVerde"> 
						<div class="col-sm-4 col-md-4 col-lg-12">
							<ul class="bottoniNav">
							<li class="item"> <a href="HomePage.jsp">  HOME PAGE </a></li>
							    <li class="item"> <a href="prodotto?azioneP=visualizzaCatalogo">  CATALOGO </a></li>
								<li class="item"> <a href=""> COME FUNZIONA </a></li>
								<li class="item"> <a href="InformazioniServlet?informazioni=assistenza"> ASSISTENZA  </a></li>
								<li class="item"> <a href="InformazioniServlet?informazioni=chisiamo"> CHI SIAMO  </a> </li>
							</ul>
						</div>
		</li>
		
	</ul>
</div>

</nav>
<!-- 
<script>
window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbarVerde");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
</script>
 -->



</body>
</html>