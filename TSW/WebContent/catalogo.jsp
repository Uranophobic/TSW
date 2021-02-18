<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList, bean.Prodotto, bean.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="menu.js"></script>
<link rel="stylesheet" type="text/css" href="css/stilesito.css">

<title> Catalogo - Oltre il Giardino</title>
<style>
.imgProdotto {
	width: 90%;
	margin: auto;
}

#aggCar{
	text-decoration: none;
	color: white;
}
</style>
</head>
<body>
<%@ include file="navbar.jsp"%>
<div>
<p  class="titoloPagine"> Catalogo </p>
</div>
<%	ArrayList<Prodotto> catalogo = (ArrayList<Prodotto>) request.getSession().getAttribute("catalogoSessione");%>
<div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; CATEGORIE</span>
  
  
  	<!-- barra di ricerca 	 -->
			<div class="barraRicercaNav">  
				<div class="barraRicerca">
				
					  <label style="font-size: 18px;">Cerca qui un elemento:</label><br>
					  <input list="prodotti" name="prod" id="prod" placeholder="Nome prodotto" style="font-size: 18px;">
					  <datalist id="prodotti">
					  	<%
					  		for(int i=0; i<catalogo.size(); i++){
					  	%>
					  		<option value="<%=catalogo.get(i).getNome() %>">
					  	<% } %>
					  </datalist>
					  <input type="submit" value="Cerca Prodotto" class="bottoni bottoni-colori"style="font-size: 18px;">
				
				 </div>
			</div>
		
  <script type="text/javascript">
$( document ).ready(function() {
$('#prod').on('input', function(){
	  var page = $(this).val();
	  window.location.href = "#"+page;
	});
});
</script>
  
<div class="grid-container">
	<%for(int i=0; i<catalogo.size(); i++){ %>
    <div id="<%= catalogo.get(i).getNome()%>"class="item1"> <!-- prodotto 1  -->
	    <div class="hovereffect">
	    	<img class="immagineProdotto" src="<%= catalogo.get(i).getImmaginePath() %>" alt="forbice">
	            <a id="link" href="prodotto?azioneP=visualizzaProdotto&idProdotto=<%=catalogo.get(i).getIdProdotto() %>&nome=<%= catalogo.get(i).getNome() %>" class="overlay">
					<button id="scopri"  class="  bottoni bottoni-colori"> Scopri di più</button>
	            </a>
	    </div>
	
		 <p class="nomeProdotto" id="idProdottoSelezionato"> <%= catalogo.get(i).getIdProdotto() %>
		 <p class="nomeProdotto"> <%= catalogo.get(i).getNome() %></p>
		 <p class="nomeProdotto"> <%= catalogo.get(i).getPrezzo() %>  </p>
		 <input type="hidden" id="prova" >
		
			<div class="bottoneAddCarrello">
			<% if(session.getAttribute("utenteSessione")!= null){%>
				<a onclick="addProdotto()" href="carrello?azioneCarrello=addCarrello&idProdotto=<%= catalogo.get(i).getIdProdotto() %>" class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			<%} else { %>
			<a id="aggCar" href="login.jsp" class=" bottoni bottoni-colori " >
				Aggiungi al carrello  <img src="images/icons8-add-shopping-cart-16.png">
				</a>
				<%} %>
			</div> 			
  </div>  
  <%} %>
</div>
</div>

<!-- sidebar -->
<div id="mySidenav" class="sidenav">
 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> 
 <div class="menuSx">
 	 <h1 style="color: white; margin:auto; width:50%;"> MENU'</h1>
		 <form action="prodotto" method="post">
		    	<div class=" categorie">
		    	 	
		    	 	<a href="prodotto?azioneP=sconto" id="categ"> Scontati </a>
		    	</div>
    	</form>
    	<form action="prodotto" method="post">
		    	<div class=" categorie">
		    		<a href="prodotto?azioneP=giardinaggio" id="categ"> Giardinaggio </a>
		    	</div>
    	</form>
    	<form action="prodotto" method="post">
		    	<div class=" categorie">
		    	 	<a href="prodotto?azioneP=agricoltura" id="categ"> Agricoltura</a>
		    	</div>
    	</form>
    	 <form action="prodotto" method="post">
		    	<div class=" categorie">
		    	   <a href="prodotto?azioneP=cura" id="categ"> Cura delle piante</a>
		    	</div>
    	</form>
</div> 	
</div>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "325px";
  document.getElementById("main").style.marginLeft = "325px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}
</script>

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script>
function addProdotto() {
  alert("Hai aggiunto un prodotto al carrello!");
}
</script>


<%@ include file="footer.jsp"%>
</body>
</html>