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

<title> prodottiCategoria - Oltre il Giardino</title>
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
	    	<img class="imgProdotto" src="<%= prodottiCategoria.get(i).getImmaginePath() %>" alt="forbice">
	            <a id="link" href="prodotto?azioneP=visualizzaProdotto&idProdotto=<%=prodottiCategoria.get(i).getIdProdotto() %>&nome=<%= prodottiCategoria.get(i).getNome() %>" class="overlay">
					<button id="scopri"  class="  bottoni bottoni-colori"> Scopri di più</button>
	            </a>
	    </div>
	    <% if(session.getAttribute("utenteSessione")!= null){ %>
		<div class="addWishlist"><img style="width: 13%;" src="https://img.icons8.com/small/20/000000/like.png"/> <a href="prodotto?azioneP=prova" style="font-size: 16px;">  Aggiungi alla tua wishlist </a></div>
		<%} else {%>
		<div class="addWishlist"><img style="width: 13%;" src="https://img.icons8.com/small/20/000000/like.png"/> <a  href="login.jsp" style="font-size: 16px;">  Aggiungi alla tua wishlist </a></div>
		<%} %>
		
	
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
    	 <form action="prodotto" method="post">
    	<div class=" categorie">
    		<button id="categ" name="azioneP" value="giardinaggio">Giardinaggio</button>
    	</div>
    	</form>
    	 <form action="prodotto" method="post">
    	<div class=" categorie">
    	 <button id="categ" name="azioneP" value="agricoltura">Agricoltura</button>
    	</div>
    	</form>
    	 <form action="prodotto" method="post">
    	<div class=" categorie">
    	   <button id="categ" name="azioneP" value="cura">Cura delle piante</button>
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