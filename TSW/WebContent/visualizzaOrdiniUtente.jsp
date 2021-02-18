<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bean.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Ordine"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Visualizza i tuoi ordini - Oltre il giardino</title>
<style>
#colOrdini{
	width: 33%;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Visualizza i tuoi ordini</p>

	</div>
	<%
		Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
	ArrayList<Ordine> ordini = (ArrayList<Ordine>) request.getSession().getAttribute("ordiniSessione");
	
	%>
	
			<div class="container">
				<table class="table">
					<thead>
						<tr>
							<th id="colOrdini">Id ordine</th>
							<th id="colOrdini">Data</th>
							<th id="colOrdini">Importo totale</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < ordini.size(); i++) {
						%>


						<tr>
							<td><p><%=ordini.get(i).getIdOrdine()%></p></td>
							<td><p><%=ordini.get(i).getDataOrdine()%></p></td>
							<td><p><%=ordini.get(i).getImportoTot()%></p></td>
						</tr>


						<%
							}
						%>
					</tbody>
				</table>
			

<div class="botModDati">
          <form>
			<button class="botMod bottoni-colori" onClick="history.go(-1);return true;" name="button">Indietro</button>
		</form>
</div>
</div>
	<%@ include file="footer.jsp"%>


</body>
</html>