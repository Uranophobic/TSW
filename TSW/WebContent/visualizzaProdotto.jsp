<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Prodotto"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Visualizza prodotto - Oltre il Giardino </title>
</head>
<style>
#titBoxVis {
	text-align: center;
	font-family: "janda";
}

.detProd{

	margin: 20px;
}
</style>
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> Visualizza dettagli del prodotto  </p>
</div>
<div class="visualizzaProdotto" >

<% Prodotto prodotto = (Prodotto) request.getSession().getAttribute("prodottoVisualizzato"); 

%>

	<div  class="fotoProdotto ">
	<h4 id="titBoxVis" >Immagine Prodotto</h4>
					<div class= "riga1" class="hr"></div>
		<img class="imgProdotto" src="<%= prodotto.getImmaginePath() %>" alt="forbice">
	
	</div>
	
	<div  class="dettagliProdotto ">
 
					<h4 id="titBoxVis" > Dettagli Informazioni Prodotto</h4>
						<div class= "riga1" class="hr"></div>
		
		
    			<div class="detProd">
		    				<label class="datiLab">NOME:</label> 
		    				<a class="inputLogin2"> <%= prodotto.getNome() %></a> <br>
		    				<label class="datiLab">CODICE:</label>
		      				<a class="inputLogin2"> <%= prodotto.getIdProdotto() %></a><br>
		      				<label class="datiLab">DESCRIZIONE:</label>
		      				<a class="inputLogin2"> <%= prodotto.getDescrizione() %></a><br>
		      				<label class="datiLab">	CATEGORIA :</label>
		      				<a class="inputLogin2"> <%= prodotto.getCategoria() %></a><br>
		      				<label class="datiLab">PREZZO:</label>
		      				<a class="inputLogin2"> <%= prodotto.getPrezzo() %></a><br>
		      					<label class="datiLab">IVA:</label>
		      				<a class="inputLogin2"> <%= prodotto.getIva() %></a><br>
		      				<% if(prodotto.getSconto() ==0 ){ %>
		      					<label class="datiLab">SCONTO: No</label><br>
		      				<%} else { %>
		      					<label class="datiLab">SCONTO:</label>
		      				<a class="inputLogin2"> <%= prodotto.getSconto() %></a><br>
		      				<%} %>
    				</div>

	
</div>

</div>
<div class="opBtn4">
 				<a onclick="addProdotto()" href="carrello?azioneCarrello=addCarrello&idProdotto=<%= prodotto.getIdProdotto() %>" class=" bottoni bottoni-colori " >
					Aggiungi al carrello  <img src="images/icons8-add-shopping-cart-16.png">
				</a>		
</div>
<%@ include file="footer.jsp"%>


</body>
</html>