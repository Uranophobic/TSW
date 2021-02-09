<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import=java.util.ArrayList %>
<%@page import=bean.Ordine %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/fattura.css">

<title>Fattura</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Fattura</p>
	</div>
	<% ArrayList<Ordine> ordini=(ArrayList<Ordine>)request.getSession().getAttribute("ordiniSessione"); %>
	<h2 class="sottotitoloFattura" align="center">Questa pagina presenta la fattura
		del prodotto che hai appena acquistato</h2>
	<div class="quadrato-a">
	<h3 class="titoloCaselle">Il tuo ordine è andato a buon fine </h3>
	
			<h4>
			<%for(int i=0; i<ordini.size();i++){ %>
			<label class="a">ID ORDINE: <%=ordini.get(i).getIdOrdine() %></label><br>
			<label class="a">DATA ORDINE: <%=ordini.get(i).getDataOrdine() %></label><br>
			<label class="a">IMPORTO TOTALE: <%=ordini.get(i).getImportoTot() %></label><br>
			
			<%} %>
			</h4>
			
	</div>
	<a href="visualizzaOrdiniUtente.jsp"><button type="submit" class="conferma" >I miei ordini</button></a>

	<%@include file="footer.jsp"%>
</body>
</html>