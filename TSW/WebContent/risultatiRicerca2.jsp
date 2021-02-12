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

<%ArrayList<Ordine> ordiniData = (ArrayList<Ordine>) request.getSession().getAttribute("ordiniCercati");
System.out.println("ORDINI DATA NELLA JSPPPPPPPPPPP" + ordiniData);%>

<% for(int i=0; i<ordiniData.size(); i++){%>
	<div class="ordini">
	<p> ID ORDINE <%=ordiniData.get(i).getIdOrdine() %> </p>
	<p> EMAIL ORDINE <%=ordiniData.get(i).getEmailUtente() %> </p>
	<p> IMPORTO TOTALE <%=ordiniData.get(i).getImportoTot() %> </p>
	<p> DATA ORDINE <%=ordiniData.get(i).getDataOrdine() %> </p>
	</div>
<%} %>
</body>
</html>