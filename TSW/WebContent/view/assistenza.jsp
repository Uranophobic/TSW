<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/assistenza.css">

<title>Assistenza</title>
</head>
<body>
	<%@include file="navbarnoButton.jsp"%>
	<div>
		<p class="titoloAssistenza">Assistenza!</p>

	</div>
	<div>
		<h2 class="sottotitoloAssistenza">Questa pagina presenta i
			contatti attraverso i quali un utente può contattare "oltre il
			giardino", per dubbi, perplessità, reclami ma soprattutto per
			conoscerci meglio. Attraverso la nostra pagina facebook e instagram.
		</h2>
	</div>

	<div class="mailDiv">
		<h4 class="mail" align="center">Per contattarci in caso di reclami puoi
			scriverci qui..</h4>
		<h5 align="center">
			<img src="../images/gmail.png">oltreilgiardino@gmail.com
		</h5>
	</div>

	<div class="FbDiv">
		<h4 class="facebook" align="center">Oppure puoi visitare le nostre pagine</h4>
		<h5 align="center">
			<img src="../images/facebook.png" style="width: 10%"> Oltre il
			giardino
		</h5>
	</div>

	<div class="IgDiv">
		<h5 align="center">
			<img src="../images/instagram.jpg">oltre_il_giardino
		</h5>
	</div>
	
	
	
	<div align="center">
	<button type="submit" class="conferma">Indietro</button>
	</div>
	
	<%@include file="footer.jsp"%>
</body>
</html>