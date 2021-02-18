<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Registrazione - Oltre Il Giardino</title>
</head>
<style>



</style>
<body>
	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Registrazione</p>
	</div>
	<div>
		<p class="sottotitoloReg">Completa la registrazione inserendo i tuoi dati personali negli appositi campi.</p>
	</div>

<form id="login" action="login" method="POST" onsubmit="return validateEmail();">
	<div class="regContenitore" >
		<div  class="text-center datiUtente">
			 <p class="titColonne text-center" > Dati Personali: </p>
			 <input type="text" name="email" id="email" class="inputLogin" placeholder="Email" required>
			 <input type="password" name="password" id="password" class="inputLogin" placeholder="Password" required>
			 <input type="text" name="nome" id="nome" class="inputLogin" placeholder="Nome" required> 
			 <input type="text" name="cognome" id="cognome" class="inputLogin" placeholder="Cognome" required> 
			 <label id="inputData"> Data di Nascita</label><input type="date" placeholder="dd mm yyyy" name="dataDiNascita" id="dataDiNascita" class="inputLogin" data-date-format="DD MM YYYY" required> 
		</div>
		
		<div  class="text-center datiSped">
			<p class="titColonne text-center" > Dati Spedizione: </p>
			 <input type="text" name="via" id="via" class="inputLogin2" placeholder="Via" required>
			 <input type="text" name="cap" id="cap" class="inputLogin2" placeholder="Cap" required>
			 <input type="text" name="citta" id="citta" class="inputLogin2" placeholder="Citta" required> 
		     <input type="text" name="provincia" id="provincia"  class="inputLogin2" placeholder="Provincia" required>  
		</div>
		
		<div  class="text-center datiPag">
			<p class="titColonne text-center" > Dati Pagamento: </p>
			<input type="text" name="numeroCarta" id="numeroCarta" placeholder="Numero Carta" class="inputLogin2"  required>
			<input type="text" name="CVV" id="CVV"  placeholder="CVV" class="inputLogin2"  required>
			<label id="inputData"> Scadenza </label><input type="date" placeholder="dd mm yyyy" name="scadenzaCarta" id="scadenzaCarta" class="inputLogin" data-date-format="DD MM YYYY" required> 
			<br><label class="etichette">Circuito<br></label>
				
				<div>
	
			<select name="circuito" id="circuito" required>
			<option value="0" selected> Perfavore, seleziona un circuito: </option>
			<option value="mastercard"> Mastercard </option>
			<option value="maestro"> Maestro </option>
			<option value="visa"> Visa </option>
			</select>
		</div>
	</div>
	
		
</div>
		<div class="opBtn2">
		     <button type="submit" name ="azioneLogin" value="registraUtente" id="login-button" class=" bottoni bottoni-colori " > Registrati </button> <!-- i bottoni sono meglio nel form  -->
  		</div>	
	</form> <!--  chiusura form registra utente -->
	<br>
	<br>
	<br>
	<%@include file="footer.jsp"%>
	
<script>



function validateEmail() {
	var emailUtente = document.getElementById("email");
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/;
	if (email.value.match(mailformat)) {
		return true;
	} else {
		alert("Assicurati di aver inserito correttamente l'email nel campo 'email' in questo modo: example@gmail.com");
		email.focus();
		return false;
	}
}

</script>

</body>
</html>