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

<title>Profilo Utente - Oltre il Giardino</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div>
		<p class="titoloPagine">Profilo Utente</p>
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
				<p class="titProfilo text-center">Dati Personali</p>
				<div class="riga1" class="hr"></div>
				<div class="prova">
					<label id="inputData"> Email</label> <input type="text" name="email" id="email" class="inputProfilo" placeholder="Email" value="<%=utente.getEmail()%>" readonly>
					<label id="inputData"> Password</label><input type="password" name="password" id="password" class="inputProfilo" placeholder="Password" value="<%=utente.getPassword() %>" readonly>
					<label id="inputData"> Nome</label><input type="text" name="nome" id="nome" class="inputProfilo" placeholder="Nome" value="<%=utente.getNome() %>" readonly> 
					<label id="inputData"> Cognome</label><input type="text" name="cognome" id="cognome" class="inputProfilo" placeholder="Cognome"	value="<%=utente.getCognome() %>" readonly> 
					<label id="inputData"> Data di Nascita</label><input type="text" placeholder="dd mm yyyy" name="dataDiNascita" id="dataDiNascita" class="inputProfilo" value="<%=utente.getDataDiNascita() %>" readonly>
				</div>
			</div>

			<div class="datiPersonali ">
				<p class="titProfilo text-center">Dati Spedizione</p>
				<div class="riga1" class="hr"></div>
					<div class="prova">
					<label id="inputData"> Via</label> <input type="text" name="via" id="via" class="inputProfilo" value="<%=via%>" readonly>
					<label id="inputData"> Citta</label><input type="text" name="citta" id="citta" class="inputProfilo" value="<%=citta%>" readonly>
					<label id="inputData"> Cap</label><input type="text" name="cap" id="cap" class="inputProfilo" value="<%=cap%>" readonly> 
					<label id="inputData"> Provincia</label><input type="text" name="provincia" id="provincia" class="inputProfilo" value="<%=provincia%>" readonly> 
				</div>
			</div>
			<div class="datiPersonali">
				<p class="titProfilo text-center">Dati Pagamento</p>
				<div class="riga1" class="hr"></div>
				<div class="prova">
					<label id="inputData"> Numero</label> <input type="text" name="numeroCarta" id="numeroCarta" class="inputProfilo" value="<%=numeroCarta%>" readonly>
					<label id="inputData"> Scadenza</label><input type="text" name="scadenza" id="scadenza" class="inputProfilo" value="<%=scadenza%>" readonly>
					<label id="inputData"> Circuito</label><input type="text" name="circuito" id="circuito" class="inputProfilo" value="<%=circuito%>" readonly> 
					<label id="inputData"> CVV</label><input type="text" name="CVV" id="CVV" class="inputProfilo" value="<%=CVV%>" readonly> 
			</div>
			</div>	
		</div>
		
		<div class="operazioniBox">
				<div class="datiPersonali">
				<p class="titProfilo text-center">I miei ordini</p>
				<div class="riga1" class="hr"></div>
				<div class="immagineOp">
					<img src="https://img.icons8.com/plasticine/150/000000/box.png" />
				</div>
						<h4 class="text-center"><a  id="nomeOperazione" class="text-center" href="profilo?azioneProfilo=visualizzaOrdini&email=<%=utente.getEmail()%>">I miei Ordini</a></h4>
						<p class="text-center" >Visualizza qui gli ordini effettuati in precedenza e gli ordini in arrivo!</p>
				</div>
				
			
		</div>
	</div>
	<div class="bottoneProfilo">
			<a href="modificaDati2.jsp"><button class="botMod bottoni-colori"> Modifica Dati</button></a>
		<form>
			<button class="botMod bottoni-colori" onClick="history.go(-1);return true;" name="button">Indietro</button>
		</form>
	</div>
	

	<%@ include file="footer.jsp"%>

</body>
</html>