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
	<h1 class="titoloPagine ">Login</h1>
	<div class="contenitore">
		<div class="datiAccesso" > 

			<div class="immagineLog" align="center">
				<img src="../images/log.png">
			</div>
			<div class="riga" class="hr" ></div>

			<div  class="formLogin ">  <!--  ho sostituito fomrLogin con row justify-center -->

<!-- ho eliminato un div row justify-center e i div col6 form gruop -->
				
					<!--  l'ho chiamata etichette2 perchè etichette in stilesito esiste già e non andava -->
					<label class="etichette2">Username:</label> <br> <!--  ho aggiunto un br per andare a capo -->
					<input id= "casella" type="text"> <br>  <!--  ho aggiunto un id alle input text per la lunghezza -->
		
					<label class="etichette2">Password:</label> <br>
					<input  id= "casella" type="text"> <br>
				
			</div>  
			
			<div align="center">
				<button type="submit" class="login">Login</button>
			</div>
			<div align="center" class=ricordami>
				<input type="checkbox" id="check" name="ricordami1"
					value="ricordami">Ricordami
			</div>
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