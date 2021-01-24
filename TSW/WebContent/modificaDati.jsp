<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bean.Utente"%>
<%@page import="bean.DatiSpedizione"%>
<%@page import="bean.DatiPagamento"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>

<!-- se modifica , esce pop-up con cosa deve modifcare (se non va facciamo un'altra jsp) 
se elimina facciamo un'altro pop-up per confermare l'eliminazione e se è si mostriamo alert, se
è no mostriamo nuovamente la pagina
 -->
 
 <style>
 .modificaSped {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
	z-index: 1;
	
}
</style>
<title>Modifica Dati due</title>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Modifica Dati due</p>

	</div>

	<% Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
		ArrayList<DatiSpedizione> indirizzi = (ArrayList<DatiSpedizione>) request.getSession().getAttribute("spedizioneSessione");
		if(indirizzi.size()!=0){
			System.out.print("it's OK");
		}else{
			System.out.print("it's not OK");
		}
		//ArrayList<DatiPagamento> tuttiPagamenti=(ArrayList<DatiPagamento>) request.getSession().getAttribute("pagamentoSessione");
		%>

	<%for(int i=0;i<indirizzi.size();i++) {%>

	<a>VIA: <%=indirizzi.get(i).getVia()%></a>
	<a> CAP: <%=indirizzi.get(i).getCap()%></a>
	<a> CITTA': <%=indirizzi.get(i).getCitta()%></a>
	<a>PROVINCIA: <%=indirizzi.get(i).getProvincia()%></a>
	<%} %>

	<button type="submit"  onclick="document.getElementById('modificaSped').style.display='block'"
	>Modifica</button>
	<div id="modificaSped">
	
	<p> CIAO AMICI DEL MONDO DI TSW</p>
	<div class="imgcontenitore">
      <span onclick="document.getElementById('modificaSped').style.display='none'"
						class="close">&times;</span>
    </div>

	</div>
	
	<%@include file="footer.jsp"%>
	
	
	<script>
	// Get the modal
	var modal = document.getElementById('modificaSped');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

</script>
<!-- <div class="imgcontenitore">
      <span onclick="document.getElementById('id01').style.display='none'"
						class="close">&times;</span>
    </div>
 -->
 
 <!-- 
  -->
	
</body>
</html>