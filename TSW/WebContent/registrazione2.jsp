<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Registrazione - Oltre Il Giardino</title>
</head>
<style>

.inputLogin{
	width: 90%;
	display: inline-block;
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid #b5afaf;
	margin: 10px;
}
.inputLogin2 {
	width: 40%;
	/* display: inline-block; */
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid #b5afaf;
	margin: 20px;
}
#numeroCarta {
	width: 60%;
	/* display: inline-block; */
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid #b5afaf;
	margin: 20px;
}

#CVV {
	width: 20%;
	/* display: inline-block; */
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid #b5afaf;
	margin: 20px;
}

.regContenitore {
	width: 100%;
	display: grid;
	grid-template-columns: 50% 50%;
	height: 504px;
	justify-content: center;
	grid-column-gap: 2%;
	/* margin-left: 90px; */
	/* grid-row-gap: 0px; */
}

.datiUtente {
	grid-row-start: 1;
	grid-row-end: 4;
	width: 100%;
	height: 504px;
	width: 100%;
	border: 2px solid  #a6ec84;
	background-color: white;
	border-radius: 5px;
}
.datiSped {
	height: 200px;
	width: 90%;
	border: 2px solid  #a6ec84;
	background-color: white;;
	border-radius: 5px;
	/* grid-row-gap: 5%; */
	margin-bottom: 5px;
}
.datiPag {
	height: 300px;
	width: 90%;
	border: 2px solid  #a6ec84;
	background-color: white;
	border-radius: 5px;
	grid-row-gap: 0;
	grid-row-start: 2;
	grid-row-end: 4;
}
#login{
	width: 80%;
	margin: auto;
}

#inputData {
	float: left;
	margin-left: 25px;
	margin-top: 10px;
}

#dataDiNascita, #scadenzaCarta{
color: grey;
}

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
			<br><input type="radio" name="circuito" id="circuito">
		</div>
	</div>
	
		<div class="opBtn2">
		
		     <button type="submit" name ="azioneLogin" value="registraUtente" id="login-button" class=" bottoni bottoni-colori " > Registrati </button> <!-- i bottoni sono meglio nel form  -->
			
  	</div>
	
			
			</form> <!--  chiusura form registra utente -->
	<%@include file="footer.jsp"%>
</body>
</html>