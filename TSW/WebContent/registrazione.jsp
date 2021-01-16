<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="css/stilesito.css">
<title>REGISTRATI</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Registrati!</p>
	</div>
	<div>
		<h2 class="sottotitoloReg">Questa è la pagina della registrazione
			che presenta il form per registrarsi a oltre il giardino</h2>
	</div>
	<div id="area-utente">
		<div class="riga1" class="hr"></div>
		<!--  	<h4 id="titoloCaselle">Dati personali e accesso</h4>-->
		<!-- la riga non si vede -->

  <form action="login" method="POST">
   <%System.out.println("sono nel form\n");%>
		<div class="quadrato-a">
			<h3 class="titoloCasella">Dati personali e accesso</h3>
			<div class="contenitore">
				 <label class="etichette"> Nome <input type="text" name="nome" id="nome">  </label>
				 <label class="etichette"> Cognome  <input type="text" name="cognome" id="cognome"> </label>
				 <label class="etichette">Data di nascita  <input type="date" placeholder="dd mm yyyy" name="dataDiNascita" id="dataDiNascita" data-date-format="DD MM YYYY"> </label> <br>
				 <label class="etichette"> Email <input type="text" name="email" id="email">  </label>
				 <label class="etichette"> Password <input type="password" name="password" id="password">  </label> <br>
				 <button type="submit" name ="azioneLogin" value="registraUtente" id="login-button" >Registrati</button> <!-- i bottoni sono meglio nel form  -->
				

			</div>
		</div>
		<!-- chiusura container item-a  -->
		
	</form> <!--  chiusura form registra utente -->

<!-- 
		<div class="item-b">
			<h3 class="titoloCasella">Dati spedizione e pagamento</h3>
			<div class="contenitore">
				<label class="etichette">Indirizzo <br> <input
					type="text"></label> <label class="etichette">Numero Carta<br>
					<input type="text"></label> <label class="etichette">Scadenza
					Carta<br> <input type="date">
				</label> <label class="etichette">CVV<br> <input type="text"></label>
				<label class="etichette">Circuito<br></label>
				<div class="immaginiCircuito" align="center">
					<label class="etichette"><input type="radio"><img
						src="../images/mastercard.jpg" class="circuito"></label> <label
						class="etichette"><input type="radio"><img
						src="../images/maestro.png" class="circuito"></label> <label
						class="etichette"><input type="radio"><img
						src="../images/visa.jpg" class="circuito"></label>
				</div>
				<!-- 
					<label class="etichette"><input type="radio"><img src="../images/mastercard.jpg" class="circuito"></label>
					<label class="etichette"><input type="radio"><img src="../images/maestro.png" class="circuito"></label> 
					<label class="etichette"><input type="radio"><img src="../images/visa.jpg" class="circuito"></label> -->
			</div>
			<!-- chiusura form reg2 -->
		</div>
		<!-- chiusura contenitore -->
		<!-- 	<h4 id="titoloCaselle">Dati spedizione</h4>
			<div class="riga1" class="hr"></div> -->

	</div>
	<!-- chiusura div item-b  -->

	<!-- chiusura div area-utente -->
	<div class="bottoni" align="center">
		
		<button type="submit" class="conferma">Indietro</button>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>