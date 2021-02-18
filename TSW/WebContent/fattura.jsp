<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList, bean.Composizione, bean.Ordine, bean.Prodotto, bean.Utente"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/fattura.css">
<style>
.quadrFattura {
	border: 2px solid #a6ec84;
	border-radius: 5px;
	text-align: center;
	height: auto;
	width: 50%;
	margin: auto;
}

.fattBot {
	width: 13%;
	margin: auto;
	margin-top: 20px;
}
</style>
<title>Fattura - Oltre il Giardino</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Fattura</p>
	</div>
	<% ArrayList<Ordine> ordini=(ArrayList<Ordine>)request.getSession().getAttribute("ordiniSessione"); %>

	<div class="quadrFattura">
	<br>
	<p style="font-size:22px;">Il tuo ordine è andato a buon fine </p>
	
			<h4>
			<%for(int i=0; i<ordini.size();i++){ %>
			<p>ID ORDINE: <%=ordini.get(i).getIdOrdine() %><br>
			DATA ORDINE: <%=ordini.get(i).getDataOrdine() %><br>
			IMPORTO TOTALE: <%=ordini.get(i).getImportoTot() %></p><br>
			
			<%} %>
			</h4>
			
	</div>
	<div class="fattBot">
	<a href="visualizzaOrdiniUtente.jsp"><button type="submit" class="bottoni bottoni-colori" >I miei ordini</button></a>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>