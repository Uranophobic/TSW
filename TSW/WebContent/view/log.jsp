<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<title>Login form</title>

</head>
<body>
	<%@include file="navbarnoButton.jsp"%>
	<h1 class="titoloLogin " align="center">Login</h1>
	<div class="contenitore">


		<div class="immagineLog" align="center">
			<img src="../images/log.png">
		</div>

		<div class="campiFormLogin" align="center">
			<label class="dati"> Username: <input type="text"
				placeholder="Username" name="username">
			</label> <label class="dati"> Password: <input type="text"
				placeholder="Password" name="password">
			</label>
		</div>

		<div align="center">
			<button type="submit" class="login">Login</button>
		</div>
		<div align="center" class=ricordami>
			<input type="checkbox" id="check" name="ricordami1" value="ricordami">Ricordami
		</div>
		<div align="center">
			<a class="registrazione" href="../view/registrazione.jsp">Registrati</a>
		</div>
	</div>




	<%@include file="footer.jsp"%>


</body>
</html>