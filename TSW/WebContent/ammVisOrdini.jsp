<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList, bean.Ordine, bean.Prodotto, bean.Utente"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ORDINI AMMINISTRATORE</title>
   <link rel="stylesheet" type="text/css" href="css/stilesito.css">
<style>

.ordini{
	width: 50%;
	margin:auto;
	border: 1px solid #ddd;
}
</style>
</head>
<body>
<%@include file = "navbar.jsp" %>
<% ArrayList<Ordine> allOrdini = (ArrayList<Ordine>) request.getSession().getAttribute("ordiniSessione");
 System.out.println("\n\n ordini nella jsp: "+ allOrdini);
%>
<form action="amministratore" method="post" onsubmit="return validateEmail();">
<input type="search" name="emailCercata"  id="email" placeholder="cerca un utente per email"> 
<button name="azioneCapo" value="cercaPerEmail"> cerca </button>
</form>
<form action="amministratore" method="post">
<p> Cerca ordini da data: </p> <input type="date" name="dataInizio">
<p> a data: </p> <input type="date" name="dataFine">
<button name="azioneCapo" value="cercaPerData"> cerca </button>
</form>
<% for(int i=0; i<allOrdini.size(); i++){%>
	<div class="ordini">
	<p> ID ORDINE <%=allOrdini.get(i).getIdOrdine() %> </p>
	<p> EMAIL ORDINE <%=allOrdini.get(i).getEmailUtente() %> </p>
	<p> IMPORTO TOTALE <%=allOrdini.get(i).getImportoTot() %> </p>
	<p> DATA ORDINE <%=allOrdini.get(i).getDataOrdine() %> </p>
	</div>
<%} %>
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