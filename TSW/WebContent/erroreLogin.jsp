<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="css/stilesito.css">
<title>Errore Login</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Errore nell'accesso</p>

	</div>
	<div>
		<h2 class="sottotitoloAssistenza">Qualcosa è andato storto!</h2>
	</div>
<div class="immagineErrorDiv" align="center">
			<img src="images/imm4042.jpg" class="immagine404">
		</div>


<!-- modifica font  -->
		<h2 class="contenutoErrore">Email non trovata</h2>

		<div class="tornaAllaHome" align="center">

			<a class="tornaHomeLink" href="registrazione.jsp">Registrati</a>

		</div>


	<%@include file="footer.jsp"%>

</body>
</html>