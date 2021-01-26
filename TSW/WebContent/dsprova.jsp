<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bean.Utente"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<style>
.inputProfilo {
	width: 90%;
	display: inline-block;
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid #b5afaf;
	margin: -5px;
}

#area-profilo {
	width: 100%;
	display: grid;
	grid-template-columns: 35% 35%;
	grid-template-rows: 65% 5% 25%;
	height: 900px;
	justify-content: center;
	grid-column-gap: 2%;
}

.bottoneProfilo {
	margin: auto;
	width: 10%;
	color: ghostwhite;
	/* float: right; */
	/* margin-top: 70px; */
}
.titProfilo {
	font-size: 28px;
	font-family: 'janda';
	margin-top: 25px;
}

.boxOperazioni {
	position: relative;
	display: -ms-flexbox;
	/* display: flex; */
	-ms-flex-direction: column;
	/* flex-direction: column; */
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	margin: 5px;
}

#nomeOperazione{
	text-decoration: none;
	color: black;
	font-family: "janda";
}
</style>
<title>Oltre il giardino - Profilo Utente</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div>
		<p class="titoloPagine">Profilo Utente</p>
	</div>


	<% Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
	
		%>
<div id="area-profilo" >
	<div class="item-a" >
	<p class="titProfilo text-center" > Operazioni </p>
					<div class= "riga1" class="hr"></div>
		<div class="operazioni">
		
			<div class="boxOperazioni">
				<img src="https://img.icons8.com/plasticine/150/000000/box.png"/>
  					<div class="">
  					  <h4><a id="nomeOperazione" href="ProfiloUtenteServlet?infoProfilo=ordini">I miei Ordini </a></h4> 
  					  <p>Visualizza qui gli ordini effettuati in precedenza e gli ordini in arrivo!</p> 
 					</div>
			</div>


			<div class="boxOperazioni">
				<img src="https://img.icons8.com/plasticine/150/000000/wish-list.png"/>
  					<div class="">
    					<h4><a id="nomeOperazione"  href="ProfiloUtenteServlet?infoProfilo=wishlist">WishList</a></h4> 
    					<p>Visualizza qui gli oggetti che hai aggiunto alla tua lista dei desideri!</p> 
  					</div>
			</div>

			<div class="boxOperazioni">
				<img src="https://img.icons8.com/plasticine/150/000000/bank-cards.png"/>
  					<div class="">
    					<h4><a id="nomeOperazione"  href="modificaDati.jsp">Dati di pagamento e di spedizione</a></h4> 
    					<p>Clicca qui per modificare i dati della tua carta oppure il tuo indirizzo!</p> 
  					</div>
			</div>			
			</div>
	</div>
	
	
	
	<!-- COLONNA DI DESTRA -->
		<div class="item-b" >
		<div  class="text-center">
			 <p class="titProfilo text-center" > Dati Personali: </p>
			 <div class= "riga1" class="hr"></div>
			 <label id="inputData"> Email</label><input type="text" name="email" id="email" class="inputProfilo" placeholder="Email" value="<%=utente.getEmail()%>" readonly >
			 <label id="inputData"> Password</label><input type="password" name="password" id="password" class="inputProfilo" placeholder="Password" value="<%=utente.getPassword() %>" readonly >
			 <label id="inputData"> Nome</label><input type="text" name="nome" id="nome" class="inputProfilo" placeholder="Nome" value="<%=utente.getNome() %>" readonly > 
			 <label id="inputData"> Cognome</label><input type="text" name="cognome" id="cognome" class="inputProfilo" placeholder="Cognome" value="<%=utente.getCognome() %>" readonly > 
			 <label id="inputData"> Data di Nascita</label><input type="text" placeholder="dd mm yyyy" name="dataDiNascita" id="dataDiNascita" class="inputProfilo" value="<%=utente.getDataDiNascita() %>" readonly > 
		</div>

			<div class="text-center ">
				<p class="titProfilo text-center">Dati Spedizione:</p>
				<div class= "riga1" class="hr"></div>
				<select>
				<!-- 
					<%
						//for (int i = 0; i < indirizzi.size(); i++) {
					%>
					<option value="<%//=i%>" selected>VIA:
						//<%//=indirizzi.get(i).getVia()%> CAP:
					//	<%//=indirizzi.get(i).getCap()%> CITTA':
						//<%//=indirizzi.get(i).getCitta()%> PROVINCIA:
						//<%//=indirizzi.get(i).getProvincia()%></option>
			//		<%
				//		}
					//%>
					 -->
				</select>
			</div>

			<div  class="text-center">
			<p class="titProfilo text-center" > Dati Pagamento: </p>
			<div class= "riga1" class="hr"></div>
			
			
			
		
	</div>
</div>
</div>
<div class="bottoneProfilo">
		     <button type="submit"  class=" bottoni bottoni-colori " > Indietro </button>	
  		</div>	
<%@ include file="footer.jsp"%>
</body>
</html>