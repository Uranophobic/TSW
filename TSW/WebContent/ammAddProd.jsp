<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> AGGIUNGI PRODOTTO:</h1>
<form action="amministratore" method="POST">
<p >ID PRODOTTO: <input type="text" placeholder="idProdotto" name="idProdotto">  </p>
<p>IMMAGINE:<input type="text" placeholder="immagineProdotto" name="immaginePath"></p>
<p>NOME: <input type="text" placeholder="nome" name="nome"></p>
<p>DESCRIZIONE:<input type="text" placeholder="descrizione" name="descrizione"></p>
<p>CATEGORIA:  <input type="text" placeholder="categoria" name="categoria"></p>
<p>PREZZO: <input type="text" placeholder="prezzo" name="prezzo"> </p>
<p>IVA:<input type="text" placeholder="iva" name="iva"> </p>
<p>SCONTO:<input type="text" placeholder="sconto" name="sconto"></p>

<button  name="azioneCapo" value="aggiungiProd">Conferma</button>
</form>
</body>
</html>