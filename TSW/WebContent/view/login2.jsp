<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="../css/stilesito.css">
<title>Login form</title>

</head>
<body>
	<h1 class="titoloPagine ">Login</h1>
	<%
String email = (String)request.getAttribute("email");
	if(email == null) email = "";

String password = (String)request.getAttribute("password");
if(password == null) password = "";


String errore = (String)request.getAttribute("errore");
if(errore != null) {
%>
<div class="error"><%=errore %></div>
<% }%>
	
	
		<form name="checkformname" method="POST" action="/LoginServlet">
		Email: <input type="text" name="name" placeholder="Rita" value="<%=email %>"><br>
		Password: <input type="text" name="surname" placeholder="Francese" value="<%=password %>"><br>
		<br>
		<input type="submit">
		<input type="reset">
</form>
	
</body>
</html>