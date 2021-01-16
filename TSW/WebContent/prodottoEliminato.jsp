<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Prodotto Eliminato</title>
<style>
.titoloPaginaDelete{
	margin: auto;
	text-align: center;
	color: black;
	font-size: 55px;
	font-weight: bold;
	margin-top:250px;
}

.vuoto{
height:280px;}
</style>
</head>
<body>
<!-- Questa jsp dice all'utente che ha eliminato il prodotto, la possiamo usare per quando lo elimina dalla wishlist o dal carrello
se non la vuole più, anche se alla fine non serve perchè quando impareremo a fare le altre cose o gli facciamo uscire un alert o un messaggio sotto 
però io la faccio momentaneamente per completare wishlist senno mi sento una persona inutile se non vedo prodotto eliminato ahahaahhaah -->

<%@include file="navbar.jsp" %>

<div>
		<p class="titoloPagine">Prodotto Eliminato</p>

	</div>
	
 	<div class="vuoto"></div> 

<%@include file="footer.jsp" %>
</body>
</html>