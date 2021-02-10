<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Modifica Prodotto</title>
</head>
<body>
<%@include file = "navbar.jsp" %>

<h1>Modifica prodotto</h1>
<form action="amministratore" method="POST">
<!--  <p >ID PRODOTTO: <input type="text" placeholder="idProdotto" name="idProdotto">  </p>-->
<p>IMMAGINE:<input type="text" placeholder="immagineProdotto" name="imgProd"></p>
<p>NOME: <input type="text" placeholder="nome" name="nome"></p>
<p>DESCRIZIONE:<input type="text" placeholder="descrizione" name="descrizione"></p>
<p>CATEGORIA:  <input type="text" placeholder="categoria" name="categoria"></p>
<p>PREZZO: <input type="text" placeholder="prezzo" name="prezzo"> </p>
<p>IVA:<input type="text" placeholder="iva" name="iva"> </p>
<p>SCONTO:<input type="text" placeholder="sconto" name="sconto"></p>

<button  name="azioneCapo" value="modificaProd">Conferma</button>
</form>
<%@include file = "footer.jsp" %>
</body>
</html>