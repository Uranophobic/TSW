<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bean.Utente"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>

<title>Oltre il giardino - Profilo Utente</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div>
		<p class="titoloPagine">Modifica i tuoi dati personali</p>
	</div>


	<% Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
	   String datiSped = utente.getDatiSpedizione();
	   System.out.println("Sono i dati spedizione: " + datiSped);
	   String datiPag = utente.getDatiPagamento();
	   System.out.println("Sono i dati pagamento: " + datiPag);
	   
	   String via="", citta="", cap="", provincia=""; 
	   
	   if(utente.getDatiSpedizione()!=null){
		   
		   int uno = datiSped.indexOf("&"); //uno inteso come prima divisione della stringa(via)
		   via = datiSped.substring(0, uno);
		   String runo = datiSped.substring(uno+1); //r sta per resto quindi resto uno =runo
		   
		   int due = runo.indexOf("&");
		   citta = runo.substring(0, due);
		   String rdue = runo.substring(due+1);
		   
		   int tre = rdue.indexOf("&");
		   cap = rdue.substring(0, tre);
		   String rtre = rdue.substring(tre+1);
		   
		   int quattro = rtre.indexOf("&");
		   provincia = rtre.substring(0);
	   }
	   
	   String numeroCarta="", scadenza="", circuito="", CVV="";
	   
	   if(utente.getDatiPagamento()!=null){
		   int uno = datiPag.indexOf("&"); //uno inteso come prima divisione della stringa(via)
		   numeroCarta = datiPag.substring(0, uno);
		   String runo = datiPag.substring(uno+1); //r sta per resto quindi resto uno =runo
				   
		   int due = runo.indexOf("&");
		   scadenza = runo.substring(0, due);
		   String rdue = runo.substring(due+1);
		   
		   int tre = rdue.indexOf("&");
		   circuito = rdue.substring(0, tre);
		   String rtre = rdue.substring(tre+1);	
		   
		   int quattro = rtre.indexOf("&");
		   CVV = rtre.substring(0);
	   }
	   
	   
	%>
	<div id="area-profilo">
	<!-- primo quadrante -->
		<div class="datiBox">
			<div class="datiPersonali">
				<form action="profilo" method="post">
				<p class="titProfilo text-center">Dati Personali</p>
				<div class="riga1" class="hr"></div>
				<div class="prova">
					<label id="inputData"> Email</label> <input type="text" name="email" id="email" class="inputProfilo" placeholder="Email" value="<%=utente.getEmail() %>"  >
					<label id="inputData"> Password</label><input type="password" name="password" id="password" class="inputProfilo" placeholder="Password" value="<%=utente.getPassword()%>" >
					<label id="inputData"> Nome</label><input type="text" name="nome" id="nome" class="inputProfilo" placeholder="Nome" value="<%=utente.getNome() %>"> 
					<label id="inputData"> Cognome</label><input type="text" name="cognome" id="cognome" class="inputProfilo" placeholder="Cognome"	 value="<%=utente.getCognome() %>" > 
					<label id="inputData"> Data di Nascita</label><input type="text" placeholder="dd mm yyyy" name="dataDiNascita" id="dataDiNascita" class="inputProfilo"  value="<%=utente.getDataDiNascita() %>">
				</div>
			</div>

			<div class="datiPersonali ">
				<p class="titProfilo text-center">Dati Spedizione</p>
				<div class="riga1" class="hr"></div>
					<div class="prova">
					<label id="inputData"> Via</label> <input type="text" name="viaModificata" id="via" class="inputProfilo"  placeholder="Via" required >
					<label id="inputData"> Citta</label><input type="text" name="cittaModificata" id="citta" class="inputProfilo"  placeholder="Città" required >
					<label id="inputData"> Cap</label><input type="text" name="capModificata" id="cap" class="inputProfilo"  placeholder="Cap" required> 
					<label id="inputData"> Provincia</label><input type="text" name="provinciaModificata" id="provincia" class="inputProfilo"  placeholder="Provincia" required> 
				</div>
			</div>
			<div class="datiPersonali">
				<p class="titProfilo text-center">Dati Pagamento</p>
				<div class="riga1" class="hr"></div>
				<div class="prova">
					<label id="inputData"> Numero</label> <input type="text" name="numeroModificato" id="numeroCarta" class="inputProfilo"  placeholder="Numero della Carta" required >
					<label id="inputData"> Scadenza</label><input type="date" placeholder="dd mm yyyy" name="scadenzaModificata" id="scadenza" class="inputProfilo"  data-date-format="DD MM YYYY" placeholder="Scadenza"  required>
					<label id="inputData"> Circuito</label><input type="text" name="circuitoModificato" id="circuito" class="inputProfilo"  placeholder="Circuito"  required> 
					<label id="inputData"> CVV</label><input type="text" name="cvvModificata" id="CVV" class="inputProfilo"  placeholder="CVV" required > 
			</div>
			</div>	
		</div>
		
	</div>
	<div class="botModDati">
		<button class="bottoni bottoni-colori" name="azioneProfilo" value="modificaDati">Conferma</button>
	</div>
	






	<%@ include file="footer.jsp"%>

</body>
</html>