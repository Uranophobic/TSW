<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="css/stilesito.css">
<title>Login form</title>

</head>
<body>
	<%@include file="navbar.jsp"%>
	<h1 class="titoloPagine ">Login</h1>
	<div class="contenitore">
		<div class="datiAccesso">

			<div class="immagineLog" align="center">
				<img src="images/log.png">
			</div>
			<div class="riga" class="hr"></div>
			
 		<form action="login" method="POST">
			<input type="text" id="email" placeholder="Email" name="email" required>
			<input type="password" id="password" placeholder="Password" name ="password" required>
			<br>
			<button type="submit" name ="azioneLogin" value="loginUtente" id="login-button" >
			Login
			</button>
		</form>	
			
<!-- 	<form action = "login" method="post">
		<div class="formLogin ">
				<label class="etichette2"> Email: </label> <br> 
				<input id="casella" type="text"> <br> 
				<label class="etichette2"> Password: </label> <br> 
				<input id="casella" type="text"> <br>

			</div>

			<div align="center">
				<button type="submit" class="login">Login</button>
			</div>
			<div align="center" class=ricordami>
				<input type="checkbox" id="check" name="ricordami1"
					value="ricordami">Ricordami
			</div>	
	</form>  <!-- CHIUSURA FORM LOGIN UTENTE  -->
	
			<div align="center">
				<a class="registrazione" href="../view/registrazione.jsp">Registrati</a>
			</div>

		</div>
	</div>

	<div class="botton" align="center">
		<button type="submit" class="conferma">Salva</button>
		<button type="submit" class="conferma">Indietro</button>
	</div>



	<%@include file="footer.jsp"%>


</body>
</html>