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
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> Visualizza dettagli del prodotto  </p>
</div>
<div class="visualizzaProdotto" >

<% Prodotto prodotto = (Prodotto) request.getSession().getAttribute("prodottoVisualizzato"); 

%>

	<div  class="fotoProdotto ">
	<h4 id="titoloCaselle" >Immagine Prodotto</h4>
					<div class= "riga1" class="hr"></div>
		<img class="imgProdotto" src="<%= prodotto.getImmaginePath() %>" alt="forbice">
	
	</div>
	
	<div  class="dettagliProdotto ">
		<div class="datiPersona"> 
					<h4 id="titoloCaselle" > Dettagli Informazioni Prodotto</h4>
					<div class= "riga" class="hr"></div>
		
					<div class="row justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette">NOME:</label> 
    						<a id="informazioni"> <%= prodotto.getNome() %></a> <br>
    						<label class="etichette">CODICE:</label>
      				<a id="informazioni"> <%= prodotto.getIdProdotto() %></a><br>
      				<label class="etichette">DESCRIZIONE:</label>
      				<a id="informazioni"> <%= prodotto.getDescrizione() %></a><br>
      				<label class="etichette">	CATEGORIA :</label>
      				<a id="informazioni"> <%= prodotto.getCategoria() %></a><br>
      				<label class="etichette">PREZZO:</label>
      				<a id="informazioni"> <%= prodotto.getPrezzo() %></a><br>
      					<label class="etichette">IVA:</label>
      				<a id="informazioni"> <%= prodotto.getIva() %></a><br>
      				<% if(prodotto.getSconto() ==0 ){ %>
      					<label class="etichette">SCONTO: No</label><br>
      				<%} else { %>
      					<label class="etichette">SCONTO:</label>
      				<a id="informazioni"> <%= prodotto.getSconto() %></a><br>
      				<%} %>
      		
      				<label class="etichette">COSTI SPEDIZIONE:</label>
      				<a id="informazioni"> 5,99</a><br>
    					</div>
  					</div>
	</div>
	
</div>

</div>
<div class="opBtn4">
		<a class=" bottoni bottoni-colori " >
		    <span class="">Indietro</span>
		</a>	
		<a class=" bottoni bottoni-colori " >
		    <span class=""> Aggiungi al carrello ></span>
		</a>	
  	</div>
<%@ include file="footer.jsp"%>
<button id="modificaBtn"> Indietro</button>
<button id="modificaBtn"> Aggiungi al carello </button>
</body>
</html>