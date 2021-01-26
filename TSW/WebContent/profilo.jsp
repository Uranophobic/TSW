<%@page import="bean.Utente"%>
<%@page import="bean.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">




<title>Oltre il giardino - Profilo Utente</title>
</head>
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> Profilo Utente </p>

 </div>
 
<%  
	Utente utente=(Utente)request.getSession().getAttribute("utenteSessione"); 
	DatiPagamento dp =(DatiPagamento) request.getSession().getAttribute("datiPagSessione");
	DatiSpedizione ds =(DatiSpedizione) request.getSession().getAttribute("spedizioneSessione");
	ArrayList<DatiSpedizione> a = (ArrayList<DatiSpedizione>) request.getSession().getAttribute("spedizioneSessione");
	System.out.println("utente: " + utente);
	System.out.println("dp " + dp);
	System.out.println("ds " + ds);
	
%>

<%if(utente!=null){
	System.out.println(utente);
	
%>
<div id="area-utente" >
	<a> Nome: <%= utente.getNome() %></a>
	<a> Cognome: <%= utente.getCognome() %></a>
	


		
		
	

	



	

	
	 
</div>
<% } %>
<%@ include file="footer.jsp"%>

</body>
</html>