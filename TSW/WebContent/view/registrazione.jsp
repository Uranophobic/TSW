<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
<link type="text/css" rel="stylesheet" href="../css/registrazione.css">
</head>
<body>
	<%@include file="navbarnoButton.jsp"%>
	<h1 class="titoloReg">Registrati!</h1>
	<div class="container">
		<form class="campiForm">
			<div class="nome">
				<!-- nome,cognome, telefono, dati pagamento (titolo) numero carta, circuito, scadenza, cvv, email, password, ripeti  password -->
				<!-- 
			<p class="nome">Nome: </p>
			<input type="text"  class=nomeT placeholder="nome" value="Nome">
			</div>
			<div class="cognome">
				Cognome: <input type="text" placeholder="cognome" value="Cognome">
			</div>
			<div class="cellulare">
				Cellulare: <input type="text" placeholder="Cellulare"
					value="Cellulare">
			</div>
			<div class="datiDiSpedizione">
				<p class="titoloPagamento">DATI PAGAMENTO</p>
			</div>
			<div class="datiPagamento">

				Numero Carta: <input type="text" placeholder="numeroDiCarta"
					value="numero di carta"> Circuito Carta: <input type="text"
					placeholder="circuitoCarta" value="circuito della carta">
				Scadenza Carta: <input type="text" placeholder="scadenzaCarta"
					value="scadenza della carta"> CVV: <input type="text"
					placeholder="codiceCVV" value="CVV">
			</div>

			<div class="datiAccesso">

				Email: <input type="text" placeholder="email" value="email">
				Password: <input type="text" placeholder="password" value="password">
				Ripeti password: <input type="text" placeholder="password"
					value="password">

			</div>

			<div class="buttonConferma1">
				<button type="submit" class="buttonConferma">Conferma</button>
			</div>

 -->
				<p class="nome" align="center">
					Nome: <input type="text" placeholder="name" value="Nome">
				</p>
				<p class="cognome" align="center">
					Cognome: <input type="text" placeholder="cognome" value="Cognome">
				</p>
				<p class="telefono" align="center">
					Telefono: <input type="text" placeholder="telefono"
						value="Telefono">
				</p>
				<p class="datiPagamento" align="center">DATI PAGAMENTO</p>
				<p class="numeroCarta" align="center">
					Numero Carta: <input type="text" placeholder="numeroCarta"
						value="Numero della carta">
				</p>
				<p class="scadenzaCarta" align="center">
					Scadenza Carta <input type="text" placeholder="scadenzaCarta"
						value="scadenzaCarta">
				</p>
				<p class="cvv" align="center">
					CVV: <input type="text" placeholder="cvv" value="CVV">
				</p>
				<p class="tipoCarta" align="center">
					Tipo Carta: <input type="text" placeholder="tipoCarta" value="tipoCarta">
				</p>
				<p class="datiPagamento" align="center">DATI SPEDIZIONE</p>
				<p class="indirizzo" align="center">
					indirizzo: <input type="text" placeholder="indirizzo"
						value="indirizzo">
				</p>
				<p class="email" align="center">
					Email: <input type="text" placeholder="email" value="email">
				</p>
				<p class="password" align="center">
					Password: <input type="text" placeholder="password" value="password">
				</p>
				<p class="rippassword" align="center">
					Ripeti Password: <input type="text" placeholder="password" value="password">
				</p>
				<div class="buttonConferma1">
				<button type="submit" class="buttonConferma">Conferma</button>
			</div>
		</form>
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>