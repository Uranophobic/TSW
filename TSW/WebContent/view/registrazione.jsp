<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrati</title>
<link type="text/css" rel="stylesheet" href="../css/registrazione.css">
</head>
<body>
	<%@include file="navbarnoButton.jsp"%>
	<h1 align="center">Registrati</h1>
	<div class="container">
		<form>
			<center>
				<div>
					<label>Nome: </label> <input type="text" placeholder="Nome"
						name="name" required>
				</div>
				<div>
					<label>Cognome: </label> <input type="text" placeholder="Cognome"
						name="cognome" required>
				</div>
				<div>
					<label>Cellulare: </label> <input type="text"
						placeholder="Cellulare" name="cellulare" required>
				</div>
				<div>
					<label>Dati Carta: </label> <input type="text"
						placeholder="Dati Carta" name="datiCarta" required>
				</div>
				<div>
					<label>Indirizzo</label> <input type="text" placeholder="Indirizzo"
						name="indirizzo" required>
				</div>
				<div>
					<label>Email: </label> <input type="text" placeholder="email"
						name="email" required>
				</div>
				<div>
					<label>Password: </label> <input type="password"
						placeholder="Password" name="password" required>
				</div>
				<div class="ripPw">
					<label>Inserisci nuovamente la password: </label> <input
						type="password" placeholder="Password" name="password" required>
				</div>
		</form>
	</div>
	<div>
		<center>
			<button type="submit" class="registrati">Conferma</button>
		</center>
	</div>
	</center>
	
<%@include file="footer.jsp" %>
</body>
</html>