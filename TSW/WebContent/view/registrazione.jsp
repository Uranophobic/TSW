<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="../css/registrazione.css">
<title>Registrazione</title>
</head>
<body>
	<%@ include file="navbarnoButton.jsp"%>
	<div>
		<p class="titoloReg">Registrati!</p>
		<!-- modificare class con titoloPagine quando il css andrà inserito dentro stilesito -->
	</div>
	<div class="contenitore">
		<!-- ma come è possibile? -->
		<div class="inserimentoDati">
			<h2 class="titoloInformazioni">Dati Personali:</h2>
			<label class="etichette">Nome: </label> <input type="text">
			<div class="cognome">
				<label class="etichette">Cognome: </label> <input type="text">
			</div>
			<div class="telefono">
				<label class="etichette">Telefono </label> <input type="text">
			</div>
		</div>
		<h2 class="titoloInformazioni">Dati Spedizione:</h2>
		<label class="etichette">Indirizzo: </label> <input type="text">
		<h2 class="titoloInformazioni">Dati Pagamento:</h2>

		<div class="numeroCarta">
			<label class="etichette">Numero Carta:</label> <input type="text">
		</div>
		<div class="scadenzaCarta">
			<label class="etichette">Scadenza Carta:</label> <input type="text">
		</div>
		<div class="codiceCVV">
			<label class="etichette">CVV: </label> <input type="text">
		</div>
		<div class="tipologiaCarta">
		<label class="etichette"> TipoCarta: </label> <input type="radio">Mastercard
		<input type="radio">Maestro
		<input type="radio">Visa
		
		</div>

<h2 class="titoloInformazioni">Dati di Accesso:</h2>
<div class="email">
			<label class="etichette">Email: </label> <input type="text">
		</div>
		<div class="password">
			<label class="etichette">Password: </label> <input type="text">
		</div>
		<div class="ripetiPw">
			<label class="etichette">Ripeti Password: </label> <input type="text">
		</div>
	</div>
	<!-- Questo è il div dell'inserimento dati -->
		
	
	</div>
	<div align="center">
			<button type="submit" class="conferma">Conferma</button></div>
	<!-- Questa è la chiusura del div da parte del contenitore -->

</body>
</html>