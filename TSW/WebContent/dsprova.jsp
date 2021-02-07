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
<style>
.inputProfilo {
	width: 100%;
	display: inline-block;
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid #b5afaf;
	margin: -5px;
}
#area-profilo {
	width: 95%;
	/* display: grid; */
	/* grid-template-columns: 35% 35%; */
	/* grid-template-rows: 65% 5% 25%; */
	height: 900px;
	/* justify-content: center; */
	/* grid-column-gap: 2%; */
	margin: auto;
}
.bottoneProfilo {
	margin: auto;
	width: 10%;
	color: ghostwhite;
	/* float: right; */
	/* margin-top: 70px; */
}

.bottoneModifiche {
	margin: auto;
	width: 57%;
	color: ghostwhite;
	/* float: right; */
	/* margin-top: 70px; */
	margin-top: 35px;
}
.titProfilo {
	font-size: 28px;
	font-family: 'janda';
	margin-top: 25px;
}

.oper {
	grid-row-start: 1;
	grid-row-end: 4;
	width: 85%;
	margin: auto;
	height: 445px;
}

#nomeOperazione {
	text-decoration: none;
	color: black;
	font-family: "janda";
}

.operazioniBox {
	width: 100%;
	height: 355px;
	border: 1px solid rgba(40, 150, 5, 0.2);
	border-radius: 5px;
	display: grid;
	grid-template-columns: 50% 50%;
	margin-top: 20px;
}
.datiBox {
	width: 100%;
	height: 500px;
	border: 1px solid rgba(40, 150, 5, 0.2);
	border-radius: 5px;
	display: grid;
	grid-template-columns: 35% 35% 35%;
}
.datiPersonali {
	grid-row-start: 1;
	grid-row-end: 4;
	width: 85%;
	margin: auto;
	height: 445px;
}

.prova{ width: 80%;}
.immagineOp{margin: auto;
width: 27%;}
</style>
<title>Oltre il giardino - Profilo Utente</title>
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
				
			
					<button class="bottoni bottoni-colori" name ="azioneProfilo" value="modificaDati" onclick="document.getElementById('modifica').style.display='block'" style="width:auto;" >
					Modifica Dati</button>
				
				
			</div>
			</div>
			<div class="datiPersonali">
				<p class="titProfilo text-center">Dati Pagamento</p>
				<div class="riga1" class="hr"></div>
				<div class="prova">
					<label id=""> Numero</label> <input type="text" name="numeroCarta" id="numeroCarta" class="inputProfilo" value="<%=numeroCarta%>" readonly>
					<label id=""> Scadenza</label><input type="text" name="scadenza" id="scadenza" class="inputProfilo" value="<%=scadenza%>" readonly>
					<label id=""> Circuito</label><input type="text" name="circuito" id="circuito" class="inputProfilo" value="<%=circuito%>" readonly> 
					<label id=""> CVV</label><input type="text" name="CVV" id="CVV" class="inputProfilo" value="<%=CVV%>" readonly> 
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
						<h4 class="text-center"><a id="nomeOperazione" class="text-center" href="">I miei Ordini</a></h4>
						<p class="text-center" >Visualizza qui gli ordini effettuati in precedenza e gli ordini in arrivo!</p>
				</div>
				
				<div class="datiPersonali">
				<p class="titProfilo text-center">Wishlist</p>
				<div class="riga1" class="hr"></div>
				<div class="immagineOp">
					<img src="https://img.icons8.com/plasticine/150/000000/wish-list.png" />
				</div>
						<h4 class="text-center"><a id="nomeOperazione"   href="">WishList</a></h4>
						<p class="text-center" >Visualizza qui gli oggetti che hai aggiunto alla tua lista dei desideri!</p>
				</div>
			
		</div>
	</div>
	<div class="bottoneProfilo">
		<button type="submit" class=" bottoni bottoni-colori ">
			Indietro</button>
	</div>
	
	<!-- POP UP -->
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
	<%@ include file="footer.jsp"%>
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