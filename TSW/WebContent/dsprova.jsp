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
<title>Insert title here</title>
</head>
<body>

	
	<% Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
	   DatiSpedizione ds = (DatiSpedizione) request.getSession().getAttribute("dsSessione");
	 
	   if(utente!=null){
		   
	
	%>
		
		<div> 
		<a> Nome: <%=utente.getNome() %></a>
		<a> Cognome: <%=utente.getCognome() %></a>
		<a> Via <%=ds.getVia() %></a>
		<a> Citta <%=ds.getCitta() %></a>
		<a> Provincia <%=ds.getProvincia() %></a>
		<a> Cap <%=ds.getCap() %></a>
		</div>
		
		
		<%} %>
</body>
</html>