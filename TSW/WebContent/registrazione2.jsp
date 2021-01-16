<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Registrazione - Oltre Il Giardino</title>
</head>
<style>
.regContenitore {
	width: 85%;
	height: 950px;
	justify-content: center;
	grid-column-gap: 5%;
	margin-left: 90px;
	grid-row-gap: 20px;
}

.datiUtente, .datiSped, .datiPag {
	width: 85%;
	height: 300px;
	margin:auto;
	border: 1px solid gainsboro;
	background-color: rgb(250, 330, 300);
	border-radius: 5px;
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
	
	<div class="regContenitore" >
		<div  class="datiUtente">
		<h1> DATI PERSONALI </h1>
			
			 <form action="login" method="POST">
			 <label class="etichette"> Nome <input type="text" name="nome" id="nome">  </label>
			 <label class="etichette"> Cognome  <input type="text" name="cognome" id="cognome"> </label>
			 <label class="etichette">Data di nascita  <input type="date" placeholder="dd mm yyyy" name="dataDiNascita" id="dataDiNascita" data-date-format="DD MM YYYY"> </label> <br>
			 <label class="etichette"> Email <input type="text" name="email" id="email">  </label>
			 <label class="etichette"> Password <input type="password" name="password" id="password">  </label> <br>
			 <button type="submit" name ="azioneLogin" value="registraUtente" id="login-button" >Registrati</button> <!-- i bottoni sono meglio nel form  -->
			
			</form> <!--  chiusura form registra utente -->
		</div>
		
		<div  class="datiSped">
		<h1> DATI DI SPEDIZIONE </h1>
		</div>
		
		<div  class="datiPag">
		<h1> DATI DI PAGAMENTO </h1>
		</div>
	</div>
	
	<%@include file="footer.jsp"%>
</body>
</html>