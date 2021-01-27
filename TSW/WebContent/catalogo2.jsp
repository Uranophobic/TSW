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
</head>
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> Catalogo </p>
</div>
<%	ArrayList<Prodotto> catalogo = (ArrayList<Prodotto>) request.getSession().getAttribute("catalogoSessione");
	Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
%>
<div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; CATEGORIE</span>

<div class="grid-container">
	<%for(int i=0; i<catalogo.size(); i++){ %>
    <div class="item1"> <!-- prodotto 1  -->
	    <div class="hovereffect">
	    	<img class="imgProdotto" src="<%= catalogo.get(i).getImmaginePath() %>" alt="forbice">
	            <a id="link" href="prodotto?azioneP=visualizzaProdotto&idProdotto=<%=catalogo.get(i).getIdProdotto() %>" class="overlay">
					<button id="scopri"  class="  bottoni bottoni-colori"> Scopri di più</button>
	            </a>
	    </div>
		
		<div class="addWishlist"><img  src="https://img.icons8.com/small/20/000000/like.png"/> <a style="font-size: 16px;">  Aggiungi alla tua wishlist </a></div>
		
		
	
		 <p class="nomeProdotto" id="idProdottoSelezionato"> <%= catalogo.get(i).getIdProdotto() %>
		 <p class="nomeProdotto"> <%= catalogo.get(i).getNome() %></p>
		 <p class="nomeProdotto"> <%= catalogo.get(i).getPrezzo() %>  </p>
		 <input type="hidden" id="prova" >
		
			<div class="bottoneAddCarrello">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
		  
  			
  </div>
  
  
  <%} %>
  
  
  
  
  
  
  
</div>

</div>



<!-- sidebar -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  
  
 <div class="menuSx">




<div class=" categorie">
	<h3 id="titSx"> Categorie </h3>
    		<ul class="sottoList">
    			<li><a class="sottoCateg" href="">Nuovi Arrivi</a></li>
    			<li><a  class="sottoCateg" href="">Scontati</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    		<p id="categ">Giardinaggio</p>
    		<ul class="sottoList">    	
	        	<li><a  class="sottoCateg" href="">Attrezzi da potatura</a></li>
	            <li><a class="sottoCateg"  href="">Attrezzi per l'irrigazione</a></li>
	            <li><a  class="sottoCateg" href="">Vasi e fioriere</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    	 <p id="categ">Agricoltura</p>
    		<ul class="sottoList">
	            <li><a  class="sottoCateg" href="">Attrezzature agricole manuali</a></li>
	            <li><a class="sottoCateg"  href="">Attrezzature agricole motorizzate</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    	   <p id="categ">Cura delle piante</p>
    		<ul class="sottoList"> 
	            <li><a class="sottoCateg"  href="">Concime</a></li>
	            <li><a class="sottoCateg"  href="">Protezione delle piante</a></li>
        	</ul>
    	</div>
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




<%@ include file="footer.jsp"%>


	
</body>
</html>