<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/stilesito.css">
<title>Modifica Dati Utente</title>
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
				<span> NOME PRODOTTO: </span> <br>
				<span> CODICE PRDOTTO: </span>	<br>
				<span> PREZZO PRODOTTO: </span> <br>
				<span> DESCRIZIONE: </span>	
	</div>
	
</div>
</div>

<%@ include file="footer.jsp"%>
<button id="modificaBtn"> Indietro</button>
<button id="modificaBtn"> Aggiungi al carello </button>
</body>
</html>