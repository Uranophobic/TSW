<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList, bean.Ordine, bean.Prodotto, bean.Utente"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestione Amministratore - Lista Ordini</title>
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


/*GRANDEZZE large, medium, small, extra-large e extra-small*/
@media all and (max-width: 1690px)and (min-width : 990px) {
.ordiniAmm {
	width: 105%;
	margin: auto;
	margin-left: 135px;
}
}

@media all and (max-width: 991px) and (min-width: 768px) {
.ordiniAmm {
	width: 105%;
	margin: auto;
	margin-left: 82px;
}
}

/*small devices*/
@media all and (max-width: 767px) and (min-width: 601px) {
.ordiniAmm {
	width: 105%;
	margin: auto;
	margin-left: 82px;
}
}
/*extra-small devices*/
@media all and (max-width: 600px) {
#table2{
	overflow-x: scroll;
	overflow-y: scroll;
	height: 500px;
	}
.ordiniAmm {
	width: 105%;
	margin: auto;
	margin-left: 25px;

}
}

</style>
</head>
<body>
<%@include file = "navbar.jsp" %>
<% ArrayList<Ordine> allOrdini = (ArrayList<Ordine>) request.getSession().getAttribute("ordiniSessione");
 System.out.println("\n\n ordini nella jsp: "+ allOrdini);
%>

<div>
<p  class="titoloPagine"> Lista Ordini </p>
</div>
<div class="ordiniAmm">
<form action="amministratore" method="post" onsubmit="return validateEmail();">
<p class="lab"> Cerca un ordini utente(email): </p> <input type="search" name="emailCercata"  id="email" class="barraAmm" placeholder="cerca un utente per email"> 
<button name="azioneCapo" value="cercaPerEmail" class="bottoni bottoni-colori"> cerca </button>
</form>
<form action="amministratore" method="post">
<p class="lab"> Cerca un ordini dalla data: </p> <input type="date" class="barraAmm" name="dataInizio">
<p class="lab"> Alla data: </p> <input type="date" class="barraAmm" name="dataFine">
<button name="azioneCapo" value="cercaPerData" class="bottoni bottoni-colori"> cerca </button>
</form>
</div>
	<div class="container" id="table2">
				<table class="table">
					<thead>
						<tr>
							<th id="colOrdini">Id ordine</th>
							<th id="colOrdini">Email utente</th>
							<th id="colOrdini">Importo totale</th>
							<th id="colOrdini">Data</th>
						</tr>
					</thead>
					<tbody>
<% for(int i=0; i<allOrdini.size(); i++){%>
<tr>
	
	<td><p>  <%=allOrdini.get(i).getIdOrdine() %> </p></td>
	<td><p>  <%=allOrdini.get(i).getEmailUtente() %> </p></td>
	<td><p> <%=allOrdini.get(i).getImportoTot() %> </p></td>
	<td><p><%=allOrdini.get(i).getDataOrdine() %> </p></td>

	</tr>
<%} %>
		</tbody>
				</table>
			</div>

<%@include file = "footer.jsp" %>

<script>
function validateEmail() {
	var emailUtente = document.getElementById("email");
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/;
	if (email.value.match(mailformat)) {
		return true;
	} else {
		alert("Assicurati di aver inserito correttamente l'email nel campo 'email' in questo modo: example@gmail.com");
		email.focus();
		return false;
	}
}
</script>
</body>
</html>