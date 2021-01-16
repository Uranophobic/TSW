<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<div  class="fotoProdotto ">
	<h4 id="titoloCaselle" >Immagine Prodotto</h4>
					<div class= "riga1" class="hr"></div>
		<span> QUI CI VA LA FOTO </span>
	</div>
	
	<div  class="dettagliProdotto ">
		<div class="datiPersona"> 
					<h4 id="titoloCaselle" > Dettagli Informazioni Prodotto</h4>
					<div class= "riga" class="hr"></div>
		
					<div class="row justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette">NOME:</label> 
    						<a id="informazioni"> qualcosa</a> <br>
    						<label class="etichette">CODICE:</label>
      				<a id="informazioni"> qualcosa</a><br>
      				<label class="etichette">DESCRIZIONE:</label>
      				<a id="informazioni"> qualcosa</a><br>
      				<label class="etichette">SPECIFICHE DEL PRODOTTO:</label>
      				<a id="informazioni"> qualcosa</a><br>
      				<label class="etichette">PREZZO:</label>
      				<a id="informazioni"> qualcosa</a><br>
      				
      				
      				
      				<!-- LO METTIAMO A DESTRA -->
      				<label class="etichette">SCONTO: sì / no</label><br>
      				<label class="etichette">COSTI SPEDIZIONE:</label>
      				<a id="informazioni"> qualcosa</a><br>
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