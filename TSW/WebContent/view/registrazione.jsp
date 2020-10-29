<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/regi.css">
<title>REGISTRATI</title>
</head>
<body>
	<%@ include file="navbarnoButton.jsp"%>

	<div>
		<p class="titoloPagine">Registrati</p>

	</div>
	<div id="area-utente">
		<div class="item-a ">
			<h4 id="titoloCaselle">Dati personali e accesso</h4>
			<div class="riga1" class="hr"></div>
			<div class="datiPersonalieAccesso">
					<div class="container">
						<h4>
							<b>Nome: <input type="text"></b>
						</h4>
						<h4>
							<b>Cognome: <input type="text"></b>
						</h4>
						<h4>
							<b>Dati di Nascita: <input type="text"></b>
						</h4>
						<h4>
							<b>Telefono: <input type="text"></b>
						</h4>
						<h4>
							<b>Email: <input type="text"></b>
						</h4>
						<h4>
							<b>Password: <input type="text"></b>
						</h4>
						<h4>
							<b>Ripeti Password: <input type="text"></b>
						</h4>
					</div>
		
			</div>
		</div>

		<div class="item-b ">
			<div class="datiSpedizioneEPagamento">
				<h4 id="titoloCaselle">Dati di Spedizione</h4>
				<div class="riga" class="hr"></div>

				<div class="row justify-content">
					
					<h4>
						<b>Indirizzo: <input type="text"></b>
					</h4>



					<h4 id="titoloCaselle">Dati Pagamento</h4>
					<div class="riga" class="hr"></div>
					<div class="row justify-content">
						<h4>
							<b>Numero Carta: <input type="text"></b>
						</h4>
						<h4>
							<b>Scadenza Carta: <input type="text"></b>
						</h4>
						<h4>
							<b>CVV: <input type="text" class="CVV"></b>
						</h4>
						<h4>
							<b>Tipo Carta: <input type="radio" class="tipo"> Mastercard <input
								type="radio"> Maestro <input type="radio"> Visa
							</b>
						</h4>

					</div>
				</div>




			</div>

		</div>
	</div>
	<div class="bottoni" align="center">
		<button type="submit" class="conferma">Salva</button>
		<button type="submit" class="conferma">Indietro</button>
	</div>



	<%@ include file="footer.jsp"%>

</body>
</html>