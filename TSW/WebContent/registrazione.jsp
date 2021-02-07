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

<form id="login" action="login" method="POST">
	<div class="regContenitore" >
		<div  class="text-center datiUtente">
			 <p class="titColonne text-center" > Dati Personali: </p>
			 <input type="text" name="email" id="email" class="inputLogin" placeholder="Email" >
			 <input type="password" name="password" id="password" class="inputLogin" placeholder="Password">
			 <input type="text" name="nome" id="nome" class="inputLogin" placeholder="Nome"> 
			 <input type="text" name="cognome" id="cognome" class="inputLogin" placeholder="Cognome"> 
			 <label id="inputData"> Data di Nascita</label><input type="date" placeholder="dd mm yyyy" name="dataDiNascita" id="dataDiNascita" class="inputLogin" data-date-format="DD MM YYYY"> 
		</div>
		
		<div  class="text-center datiSped">
			<p class="titColonne text-center" > Dati Spedizione: </p>
			 <input type="text" name="via" id="via" class="inputLogin2" placeholder="Via">
			 <input type="text" name="cap" id="cap" class="inputLogin2" placeholder="Cap">
			 <input type="text" name="citta" id="citta" class="inputLogin2" placeholder="Citta"> 
		     <input type="text" name="provincia" id="provincia"  class="inputLogin2" placeholder="Provincia">  
		</div>
		
		<div  class="text-center datiPag">
			<p class="titColonne text-center" > Dati Pagamento: </p>
			<input type="text" name="numeroCarta" id="numeroCarta" placeholder="Numero Carta">
			<input type="text" name="CVV" id="CVV"  placeholder="CVV">
			<label id="inputData"> Scadenza </label><input type="date" placeholder="dd mm yyyy" name="scadenzaCarta" id="scadenzaCarta" class="inputLogin" data-date-format="DD MM YYYY"> 
			<br><label class="etichette">Circuito<br></label>
				
				<div>
	<!-- 	<label class="etichette"><input type="" name="circuito" id="circuito" onClick="return trovaCircuito()"><img src="images/mastercard.jpg" class="circuito"></label>
					<label class="etichette"><input type="radio"  name="circuito" id="circuito" onClick=" return trovaCircuito()"><img src="images/maestro.png" class="circuito"></label> 
					<label class="etichette"><input type="radio"  name="circuito" id="circuito" onClick=" return trovaCircuito()"><img src="images/visa.jpg" class="circuito"></label> 
			</div>  -->
			<select name="circuito" id="circuito">
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
	


</body>
</html>