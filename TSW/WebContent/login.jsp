<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<link type="text/css" rel="stylesheet" href="css/stilesito.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
			
</div>
</div>

	<div class="botton" align="center">
		<button type="submit" class="conferma">Salva</button>
		<button type="submit" class="conferma">Indietro</button>
	</div>



	<%@include file="footer.jsp"%>

<!-- 
<script>
$(document).ready(function(){
	$("#login-button").click(function(){
		
		$.post("/TSW/login",
				{
					"azioneLogin" : "loginUtente",
				},
				function(responseTxt, statusTxt, xhr){
					if(responseTxt=="successo")
						alert("Benvenuto");
					if(responseTxt=="passwordFailed")
						alert("Password non corretta!");
					if(responseTxt=="notExists")
						alert("Devi prima registrarti per accedere!");
			});
	});
});
 
</script>
-->
</body>
</html>