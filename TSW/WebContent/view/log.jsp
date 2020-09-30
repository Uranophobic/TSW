<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login form</title>
<link type="text/css" rel="stylesheet" href="../css/login.css">
</head>
<body>
	<%@include file="navbarnoButton.jsp"%>
	<h1 align="center">Login</h1>
	<center>
		<img src="../images/log.png">
	</center>
	<div class="container">
		<form>
			<center>
				<label>Username: </label> <input type="text" placeholder="Username"
					name="username" >
	</div>
	<div>
		<center>
			<label>Password: </label> <input type="password"
				placeholder="Password" name="password" >
		</center>
	</div>
	<center>
		<div>
			<button type="submit" class="login">Login</button>
	</center>

	</div>
	<div class=ricordami>
		<center>

			<input type="checkbox" id="check" name="ricordami1" value="ricordami">Ricordami

		</center>
	</div>

	<div class=registrati>
		<center>
			<button type="submit" >Se non sei registrato, fallo ora</button>
			<link rel="stylesheet" href="registrazione.jsp">
		</center>
	
	</div>
	</form>
	<%@include file="footer.jsp"%>
</body>
</html>