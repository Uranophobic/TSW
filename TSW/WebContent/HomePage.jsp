<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="bean.Utente" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/stilesito.css">
<style>

</style>
<title>HomePage - Oltre Il Giardino</title>
</head>
<body>
<%@ include file="navbar.jsp"%>
<% Utente utente = (Utente) request.getSession().getAttribute("utenteSessione"); %>
<div class="container-fluid">
	<div class="row justify-content-center ">
			<p id="sottotitolo"> Tutto ciò che desideri, 
			<br>dal <a style="color: #a6ec84;"> giardinaggio </a> all'<a style="color: #a6ec84;" > agricoltura</a>, 
			<br> a portata di un click! </p>	   
</div>

</div>


  
  
<div class="funzionalita" >
		<div class="descrFunz">
		<% if(session.getAttribute("utenteSessione") == null){ %>
  		 	<a class="link"  href="login.jsp"> <h4 class="titoloParagrafo2"> ACCEDI o REGISTRATI</h4></a>
  		  	<p id="descrFunz">Effettua l'accesso per poter usufruire del nostro shop online! </p>
  		<%}else{%>
  		    <a class="link"  href="profilo.jsp"> <h4 class="titoloParagrafo2"> VISUALIZZA PROFILO</h4></a>
  		  	<p id="descrFunz">Clicca qui per visualizzare le tue informazioni personali!</p>
  		<%} %>
		</div>

		<div class="descrFunz">
 			<a class="link" href="catalogo.jsp">  <h4 class="titoloParagrafo2" > ACQUISTA SUBITO</h4> </a>
            <p id="sparisci">Acquista in modo rapido e sicuro i nostri prodotti, ti garantiamo che riuscirai a trovare tutto ciò di cui hai bisogno!</p>
		</div>
	<% if(session.getAttribute("utenteSessione")!= null){ %>
		<div class="descrFunz"> 
      		<a class="link"  href="profilo?azioneProfilo=visualizzaOrdini&email=<%=utente.getEmail()%>">  <h4 class="titoloParagrafo2"> TUTTO SOTTO CONTROLLO</h4> </a>
    		<p id="sparisci">Ti garantiamo che potrai visionare tutti i tuoi ordini effettuati, come e quando vorrai!</p>
		</div>
			<% } else {  %>
			<div class="descrFunz"> 
      		<a class="link"  href="visualizzaOrdiniUtente.jsp">  <h4 class="titoloParagrafo2"> TUTTO SOTTO CONTROLLO</h4> </a>
    		<p id="sparisci">Ti garantiamo che potrai visionare tutti i tuoi ordini effettuati, come e quando vorrai!</p>
		</div>
		<% } %>
			
		<div class="descrFunz">
			<a class="link"  href="assistenza.jsp"> <h4 class="titoloParagrafo2"> SERVIZIO DI ASSISTENZA</h4> </a>
    		<p id="sparisci" class="mt-2">Potrai in qualsiasi momento rivolgerti al nostro servizio di assistenza in caso di dubbi o necessità, 24 ore su 24!</p>
		</div>
	
		
</div>

<%@ include file="footer.jsp"%>
</body>
</html>