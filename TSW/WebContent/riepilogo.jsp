<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="css/riep.css">
<title>Riepilogo dati</title>
</head>
<body>
	<%@include file="navbarnoButton.jsp"%>
	<div>
		<p class="titoloPaginaRiep">Riepilogo dati</p>

	</div>
	<div>
		<h2 class="sottotitoloRiep">Ecco le tue informazioni riguardanti
			le spedizioni e il pagamento</h2>
	</div>

	<div id="areaUtente">

		<div class="item-aa">

			<h4 id="titoloCaselle">Dati personali</h4>

			<div class="riga1" class="hr"></div>

			<div class="datiPersonali">

				<div class="container">

					<h4>
						<b>Nome:</b> <a>qualcosa</a>
					</h4>

					<div class="riga" class="hr"></div>

					<h4>
						<b>Cognome: </b> <a>qualcosa</a>
					</h4>
					<div class="riga" class="hr"></div>

					<h4>
						<b>Telefono: </b><a>qualcosa</a>
					</h4>
					<div class="riga" class="hr"></div>

					<h4>
						<b>Email: </b><a>qualcosa</a>
					</h4>
					<div class="riga" class="hr"></div>

				</div>
				<!-- div chiusura container -->
			</div>
			<!-- div chiusura datiPersonali -->
		</div>
		<!-- div chiusura item-a -->

		<div class="item-bb">

			<div class="DatiSpedizioniEPagamento">


				<h4 id="titoloCaselle">Dati di Spedizione</h4>

				<div class="riga1" class="hr"></div>
			
					<h4 align="center">
						<b>Indirizzo: </b><a>qualcosa</a>
					</h4>
					<div class="riga" class="hr"></div>
					<!-- non so perchè qui la riga non si vede mentre sotto agli altri campi si -->
					<!-- 	<div class="riga1" class="hr"></div> -->
					<!-- ho messo riga1 perche riga non era visibile ma non so il perchè -->
				</div>

				<h4 id="titoloCaselle">Dati Pagamento</h4>

				<div class="riga1" class="hr"></div>
				
					<h4 align="center">
						<b>Numero Carta: </b><a>qualcosa</a>
					</h4>
					<div class="riga" class="hr"></div>
					<!-- 		<div class="riga" class="hr"></div> -->
				</div>
			</div>
			<!-- chiusura datiSpedizioniEPagmento -->
		
		<!--  chiusura item-b -->



	<!-- chiusura area utente? -->

	<div class="bottoni" align="center">
		<button type="submit" class="conferma">Conferma</button>

		<button type="submit" class="conferma">Indietro</button>
	</div>

	<%@include file="footer.jsp"%>

</body>
</html>