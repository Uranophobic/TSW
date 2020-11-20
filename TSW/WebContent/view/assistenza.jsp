<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/assistenza.css">

<title>Assistenza!</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Assistenza!</p>

	</div>
	<div>
		<h2 class="sottotitoloAssistenza">Questa pagina presenta i
			contatti attraverso i quali un utente pu� contattare "oltre il
			giardino", per dubbi, perplessit�, reclami ma soprattutto per
			conoscerci meglio. Attraverso la nostra pagina facebook e instagram.

		</h2>
		<h2 class="sottotitoloAssistenza">Oppure puoi chiamarci
			direttamente</h2>
	</div>

	<div class="item-a">

		<h3 class="titoloCasella">I nostri contatti</h3>
		<div class="riga1" class="hr"></div>
		<div class="mail">
			<h4 class="titoloContatto">La nostra mail</h4>
			<h4>
				<img src="../images/gmail.png" class="img">
			</h4>
			<br>
			<h5 class="contatto">oltreilgiardino@gmail.com</h5>
		</div>
		<!-- chiusura div mail -->
		<div class="riga1" class="hr"></div>
		<div class="facebook">
			<h4 class="titoloContatto">Il nostro account facebook</h4>
			<h4>
				<img src="../images/facebook.png" class="imgfb">
			</h4>
			<br>
			<h5 class="contatto">Oltre il giardino</h5>
		</div>
		<div class="riga1" class="hr"></div>
		<div class="instagram">
			<h4 class="titoloContatto">Il nostro account instragram</h4>
			<h4>
				<img src="../images/instagram.jpg" class="img">
			</h4>
			<br>
			<h5 class="contatto">_oltre_il_giardino_</h5>
		</div>
		<div class="riga1" class="hr"></div>
		<div class="telefono">
			<h4 class="titoloContatto">Il nostro numero di cellulare</h4>
			<h4>
				<img src="../images/tel-wa.jpg" class="img">
			</h4>
			<br>
			<h5 class="contatto">
				3383557942
				<!-- ovviamente � inventato -->
			</h5>
		</div>
	</div>
	<div class="bottoni" align="center">
		<button type="submit" class="conferma">Indietro</button>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>