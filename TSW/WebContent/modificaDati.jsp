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

<!-- se modifica , esce pop-up con cosa deve modifcare (se non va facciamo un'altra jsp) 
se elimina facciamo un'altro pop-up per confermare l'eliminazione e se è si mostriamo alert, se
è no mostriamo nuovamente la pagina
 -->
 <style>
.hr {
	height: 2px;
	margin: 60px 0 50px 0;
	background: black;
}

.foot-lnk {
    text-align: center;
}
/* Caselle di input */
.inputModifica {
	width: 100%;
	/* margin: 16px; */
	display: inline-block;
	border: none;
	box-sizing: border-box;
	border-bottom: 1px solid black;
	color: black;
	margin-top: 15px;
	margin-bottom: 15px;
}
#text, #psw{
	margin-top: 36px;
}	

/* Caratteristiche del titolo 'Accedi'  */
.titAccedi {
	margin: auto;
	width: 50%;
	font-size: 35px;
	color: black;
}

/* Primo pulsante accedi "esterno"*/   
.primo{
	background: #00BB2D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 20%;
	border-radius: 5px;
}

/* Secondo pulsante accedi per confermare email e pasw */
.secondo {
	background: #1161ee;
	padding: 15px 20px;
	border-radius: 25px;
	width: 100%;
	color: white;
	display: block;
	text-transform: uppercase;
	box-sizing: border-box;
	cursor: pointer;
	position: relative;
	border: none;
	margin-top: 50px;
}

/* Caratteristiche di tutte le label(etichette degli input) nel form  */
.etichetteModifica{
	font-size: 1.5em;
	color: black;
	padding-bottom: 16px;
}

/* Caratteristiche contenitore in cui si trova il form e tutto il resto*/
.contenitore {
	/* position: absolute; */
	/* width: 100%; */
	/* height: 100%; */
	padding: 90px 70px 50px 70px;
	z-index: 1;
}

/* The modale (background) */ /* Cose che non ho toccato */
.modale {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	padding-top: 60px;
	z-index: 1;
	
}

/* modale Content/Box */
.modificheSped {
	/* width: 100%; */
	margin: auto;
	max-width: 520px;
	background:white;
	position: relative;
	box-shadow: 0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}

/* Bottone chiusura (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: black;
	font-size: 35px;
	font-weight: bold;
	opacity: 1;
	z-index: 1; /* Sit on top */
}

/* Se ci passi sopra diventa rosso e il puntatore cambia (x) */
.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}
</style>
<title>Modifica Dati due</title>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">Modifica Dati due</p>

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
	<input name="nome" value=" <%=utente.getNome()%>" >
	<input name="cognome" value="<%=utente.getCognome() %>" >
	<input name="dataDiNascita" value="<%=utente.getDataDiNascita()%>" > 
	<input name="password" value=" <%=utente.getPassword()%> " >
	<input name="email" value=" <%=utente.getEmail()%> " >
	
	<input name="via" value=" <%=via%>" >
	<input name="cap" value="<%=cap %>" >
	<input name="citta" value="<%=citta%>" > 
	<input name="provincia" value=" <%=provincia%> " >

	<br>
	<input name="numeroCarta" value=" <%=numeroCarta%>" >
	<input name="scadenza" value="<%=scadenza %>" >
	<input name="circuito" value="<%=circuito%>" > 
	<input name="cvv" value=" <%=CVV%> " >


	 <button class="primo" name ="azioneProfilo" value="modificaDati" onclick="document.getElementById('modifica').style.display='block'" style="width:auto;" >
	MODIFICA</button>

<div id="modifica" class="modale">
  <form class="animate" action="profilo" method="post">
  <div class="modificheSped">
  <div class="imgcontenitore">
      <span onclick="document.getElementById('modificaSped').style.display='none'" class="close">&times;</span>
    </div>

    <div class="contenitore">
    	<h1 class="titAccedi text-center"><b> Modifica Sped</b></h1><br>
    	
      <label class="etichetteModifica"><b>Via</b></label>
      <input  class= "inputModifica" type="text" placeholder="via" name="viaModificata"  required >
      
      <label class="etichetteModifica"><b>Citta'</b></label>
      <input  class= "inputModifica" type="text" placeholder="Citta"  name="cittaModificata" required> 
      
       <label class="etichetteModifica"><b>Provincia</b></label>
      <input  class= "inputModifica" type="text" placeholder="provincia"  name="provinciaModificata" required>
       
       <label class="etichetteModifica"><b>Cap</b></label>
      <input  class= "inputModifica" type="text" placeholder="CAP"  name="capModificata" required> 
      
   	 <label class="etichetteModifica"><b>Numero Carta</b></label>
      <input  class= "inputModifica" type="text" placeholder="numero carta" name="numeroModificato"  required >
      
      <label class="etichetteModifica"><b>Scadenza</b></label>
      <input  class= "inputModifica" type="text" placeholder="scadenza"  name="scadenzaModificata" required> 
      
       <label class="etichetteModifica"><b>Circuito</b></label>
      <input  class= "inputModifica" type="text" placeholder="circutio"  name="circuitoModificato" required>
       
       <label class="etichetteModifica"><b>CVV</b></label>
      <input  class= "inputModifica" type="text" placeholder="CVV"  name="cvvModificata" required> 

       
       
	  <button class="secondo" type="submit" name ="azioneProfilo" value="modificaDati">MODIFICA</button>
       <div class="hr"></div>
       <!-- bottonemodifica sempre a posto di quello che stava prima nell if guarda servlet -->
    </div>

    
  </div>
		</form>
</div>


    
 

	<%@include file="footer.jsp"%>
	
	
	<script>
	// Get the modal
	var modal = document.getElementById('modifica');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

</script>

</body>
</html>