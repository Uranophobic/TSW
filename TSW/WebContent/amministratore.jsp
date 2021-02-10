<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList, bean.Composizione, bean.Prodotto, bean.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Gestione Amministratore</title>
</head>
<body>
<%@include file = "navbar.jsp" %>
<% ArrayList<Prodotto> catalogo=(ArrayList<Prodotto>) request.getSession().getAttribute("catalogoSessione");
	System.out.println("catalogo lato jsp admin: "+catalogo);%>
	
	
	<!-- 	OPERAZIONI CATALOGO:
		  dobbiamo prendere tutti i prodotti del catalogo dal db
		  dobbiamo poter aggiungere un prodotto (e vedere dopo la lista aggiornata)
		  dobbiao poter selezionare un prodotto da modificare (e vederlo modificato successivamente, lista aggiornata)
		  dobbiamo poter selezionare un prodotto per eliminarlo (e vedere la lista aggiornata senza il prodotto che abbiamo cancellato)
		  
		  	OPERAZIONI ORDINI:
		  dobbiamo prendere tutti gli ordini dal db
		  dobbiamo visualizzarli in ordine data-data
		  dobbiamo visualizzarli pr utente A-Z
	 -->
<h1> SONO IN GESTIONE AMMINISTRATORE </h1>

<h1>I prodotti del catalogo: </h1>
<form action="amministratore" method="POST">
<%for(int i=0;i<catalogo.size();i++){%>

<p >ID PRODOTTO:<%=catalogo.get(i).getIdProdotto() %> </p>
<p>IMMAGINE:<img src="<%=catalogo.get(i).getImmaginePath() %>" style="width:30%"> </p>
<p>NOME: <%=catalogo.get(i).getNome() %></p>
<p>DESCRIZIONE: <%=catalogo.get(i).getDescrizione() %></p>
<p>CATEGORIA: <%=catalogo.get(i).getCategoria() %> </p>
<p>PREZZO: <%=catalogo.get(i).getPrezzo() %> </p>
<p>IVA: <%=catalogo.get(i).getIva() %></p>
<p>SCONTO: <%=catalogo.get(i).getSconto() %></p>



<button class=" bottoni bottoni-colori " name="azioneCapo" value="prendiProd">Modifica</button>

<input type="hidden" name="idProdCapo" value="<%=catalogo.get(i).getIdProdotto() %>">
<button type="submit" class=" bottoni bottoni-colori ">Elimina</button>
<%} %>
</form>
<%@include file = "footer.jsp" %>
</body>
</html>