<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="css/stilesito.css">
<title>Error 404</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="contenuto">


		<h1 class="titoloPagine">Error 404</h1>

		<div class="immagineErrorDiv" align="center">
			<img src="images/imm4042.jpg" class="immagine404">
		</div>


		<h2 class="contenutoErrore">Risorsa non trovata</h2>

		<div class="tornaAllaHome" align="center">

			<a class="tornaHomeLink" href="HomePage.jsp">Torna alla
				home</a>

		</div>

	</div>

	<%@include file="footer.jsp"%>
</body>
</html>