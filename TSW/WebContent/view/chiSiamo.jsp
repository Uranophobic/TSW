<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Chi siamo</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Chi siamo!</p>

	</div>
	<div>
		<h2 class="sottotitoloChiSiamo">Oltre il giardino è un sito di
			e-commerce che si rivolge a tutti le persone che amano o lavorano con
			la natura rendendo semplici gli acquisti degli oggetti a loro utili
			con un semplice click!</h2>
	</div>
	<div class="divMebri" align="center">
		<h4>
			<b class="membri">I membri del team</b>
		</h4>
	</div>
	<div class="container">
		<img src="image/alessia.png" style="width: 25%">
		<h4 class="titoloParagrafo">Alessia Crispo</h4>
	</div>
	<div class="container">
		<img src="images/luisa.PNG" style="width: 25%">
		<h4 class="titoloParagrafo">Luisa Cauteruccio</h4>
	</div>

	
	<div align="center">
	<button type="submit" class="conferma">Indietro</button>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>