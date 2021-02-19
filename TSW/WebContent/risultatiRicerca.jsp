<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList, bean.Ordine, bean.Prodotto, bean.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Risultati ricerca - Gestione Amministratore</title>
 <link rel="stylesheet" type="text/css" href="css/stilesito.css">
<style>
.ordiniAmm {
	width: 70%;
	margin: auto;
	margin-left: 410px;
}

.barraAmm {
	width: 50%;
	border: none;
	border-bottom: 1px solid grey;
	margin: 20px;
}

.lab{
	margin: -9px;
}
</style>
</head>
<body>
<%ArrayList<Ordine> ordiniUtente = (ArrayList<Ordine>) request.getSession().getAttribute("ordiniCercati");
System.out.println("ordiniUtente" + ordiniUtente);%>
<%@include file = "navbar.jsp" %>
<div>
<p  class="titoloPagine"> Risultati Ricerca </p>
</div>
<% if(ordiniUtente.size()!=0){ %>
	<div class="container">
				<table class="table">
					<thead>
						<tr>
							<th id="colOrdini">Id</th>
							<th id="colOrdini">Email</th>
							<th id="colOrdini">Data</th>
							<th id="colOrdini">Importo totale</th>
						</tr>
					</thead>
					<tbody>
					
<% for(int i=0; i<ordiniUtente.size(); i++){%>
<tr>
<td>	<p> <%=ordiniUtente.get(i).getIdOrdine() %> </p> </td>
<td>	<p>  <%=ordiniUtente.get(i).getEmailUtente() %> </p></td>

<td>	<p> <%=ordiniUtente.get(i).getDataOrdine() %> </p></td>
<td>	<p>  <%=ordiniUtente.get(i).getImportoTot() %> </p></td>
</tr>	
			<%} %>
					</tbody>
				</table>
			</div>
<% } else {%>
<div class="text-center">
			<p style="font-size: 28px;"> Spiacenti, la ricerca non ha prodotto nessun risultato. </p></div>
		<% } %>	

<%@include file = "footer.jsp" %>
</body>
</html>