<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	  <%@page import="bean.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="css/stilesito.css">
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Login - Oltre il Giardino</title>
<style>

</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h1 class="titoloPagine ">Login</h1>
	<div class="loginBox">
		<div class="">
			<div class="boxImg" align="center">
				<img class="imgLog"  src="images/log.png">
			</div>
 		<form action="login" method="POST" onsubmit="return validateEmail();">
 			<label class="eticLog"> Email:</label> <br>
			<input class="inLog" type="text" id="email" placeholder="Email" name="email"  required> <br>
			<label class="eticLog"> Password:</label> <br>
			<input  class="inLog" type="password" id="password" placeholder="Password" name ="password" required> <br>
			<div  id="botReg">
			<button  class=" bottoni bottoni-colori " type="submit" name ="azioneLogin" value="loginUtente" id="login-button">
			Login
			</button>
			</div>
		</form>				
		</div>
		
		<div class="rigaSx" class="hr"></div><a style="font-family:janda;"> oppure</a>  <div class="rigaDx" class="hr"></div> 
		<div  id="botReg">
			<a>Clicca qui per </a><a  href= "registrazione.jsp" style=" font-family: janda;" >Registrati</a>
		</div>
	</div>
	


	<%@include file="footer.jsp"%>

<script>

	function validateEmail() {
		var emailUtente = document.getElementById("email");
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/;
		if (email.value.match(mailformat)) {
			return true;
		} else {
			alert("Controlla di aver inserito correttamente l'email.");
			email.focus();
			return false;
		}
	}
</script>
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
</body>
</html>