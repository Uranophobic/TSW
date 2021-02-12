<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList, bean.Ordine, bean.Prodotto, bean.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%ArrayList<Ordine> ordiniUtente = (ArrayList<Ordine>) request.getSession().getAttribute("ordiniCercati");
System.out.println("ordiniUtente" + ordiniUtente);%>

<% for(int i=0; i<ordiniUtente.size(); i++){%>
	<div class="ordini">
	<p> ID ORDINE <%=ordiniUtente.get(i).getIdOrdine() %> </p>
	<p> EMAIL ORDINE <%=ordiniUtente.get(i).getEmailUtente() %> </p>
	<p> IMPORTO TOTALE <%=ordiniUtente.get(i).getImportoTot() %> </p>
	<p> DATA ORDINE <%=ordiniUtente.get(i).getDataOrdine() %> </p>
	</div>
<%} %>

</body>
</html>