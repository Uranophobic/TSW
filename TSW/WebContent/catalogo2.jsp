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
<% 
ArrayList<Prodotto> prodottiCategoria= (ArrayList<Prodotto>) request.getSession().getAttribute("menuSessione");
System.out.println("prodotti categoria: "+prodottiCategoria);
%>


<div>
<%
int j=0;
if(prodottiCategoria.get(j).getCategoria().equals("Agricoltura")) {%>
		<p  class="titoloPagine"> Catalogo - Prodotti Agricoltura </p>	
<%}else if (prodottiCategoria.get(j).getCategoria().equals("Giardinaggio")){ %>
		<p  class="titoloPagine"> Catalogo - Prodotti Giardinaggio </p>	
<%}else if (prodottiCategoria.get(j).getCategoria().equals("Cura")){ %>
		<p  class="titoloPagine"> Catalogo - Prodotti Cura delle piante </p>	
<% }else{ %>
		<p  class="titoloPagine"> Catalogo - Prodotti In Sconto</p>	
<% } %>

</div>


<div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; CATEGORIE</span>
<div class="grid-container">

	<%for(int i=0; i<prodottiCategoria.size(); i++){ %>
    <div class="item1"> <!-- prodotto 1  -->
	    <div class="hovereffect">
	    	<img class="immagineProdotto" src="<%= prodottiCategoria.get(i).getImmaginePath() %>" alt="forbice">
	            <a id="link" href="prodotto?azioneP=visualizzaProdotto&idProdotto=<%=prodottiCategoria.get(i).getIdProdotto() %>&nome=<%= prodottiCategoria.get(i).getNome() %>" class="overlay">
					<button id="scopri"  class="  bottoni bottoni-colori"> Scopri di più</button>
	            </a>
	    </div>
	
		
	
		 <p class="nomeProdotto" id="idProdottoSelezionato"> <%= prodottiCategoria.get(i).getIdProdotto() %>
		 <p class="nomeProdotto"> <%= prodottiCategoria.get(i).getNome() %></p>
		 <p class="nomeProdotto"> <%= prodottiCategoria.get(i).getPrezzo() %>  </p>
		 <input type="hidden" id="prova" >
		
			<div class="bottoneAddCarrello">
			<% if(session.getAttribute("utenteSessione")!= null){%>
				<a onclick="addProdotto()" href="carrello?azioneCarrello=addCarrello&idProdotto=<%= prodottiCategoria.get(i).getIdProdotto() %>" class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			<%} else { %>
			<a href="login.jsp" class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="images/icons8-add-shopping-cart-16.png"> </span>
				</a>
				<%} %>
			</div>
			
		  
  			
  </div>
  
  
  <%} %>


</div>

</div>



<div id="mySidenav" class="sidenav">
 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> 
 <div class="menuSx">
	 <h1 style="color: white; margin:auto; width:50%;"> MENU'</h1>
		 <form action="prodotto" method="post">
		    	<div class=" categorie">
		    	 	<!-- <button class="bottoni bottoni-colori" id="botMenu" name="azioneP" value="sconto">Scontati</button> -->
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