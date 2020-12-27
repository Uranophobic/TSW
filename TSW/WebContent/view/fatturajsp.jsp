<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/fattura.css">

<title>Fattura</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Fattura</p>
	</div>
	<h2 class="sottotitoloFattura" align="center">Questa pagina presenta la fattura
		del prodotto che hai appena acquistato</h2>
	<div class="quadrato-a">
	<h3 class="titoloCaselle">Il tuo prodotto</h3>
	<h4>
				<img src="../images/imm4042.jpg" class="immagine404">
			</h4>
			<h4>
			<label class="a">Descrizione: Questa è una pianta morta</label><br>
			<label class="a">Prezzo: 22,50</label><br>
			<label class="a">Quantita: 1</label><br>
			<label class="a">Sconto:10%</label><br>
			<label class="a">Iva: 22%</label><br>
			</h4>
			<h5 class=totale>Totale: 35</h5>
	</div>
	<button type="submit" class="conferma" >Procedi</button>

	<%@include file="footer.jsp"%>
</body>
</html>