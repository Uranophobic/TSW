<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.ArrayList, bean.Utente, bean.DatiSpedizione, bean.DatiPagamento"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">




<title>Oltre il giardino - Profilo Utente</title>
</head>
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> Profilo Utente </p>

 </div>
 
<%  
	Utente utente=(Utente)request.getSession().getAttribute("utenteSessione"); 
	DatiSpedizione datiSped=(DatiSpedizione)request.getSession().getAttribute("datiSpedSessione");
	DatiPagamento datiPag=(DatiPagamento)request.getSession().getAttribute("datiPagSessione");

%>
	
		<form action="ProfiloUtenteServlet" method="POST">
<div id="area-utente" >
	<div  class="item-a ">
	<h4 id="titoloCaselle" >Operazioni</h4>
					<div class= "riga1" class="hr"></div>
		<div class="operazioni">
		
			<div class="pulsanti">
				<img src="https://img.icons8.com/plasticine/150/000000/box.png"/>
  					<div class="container">
  					  <h4><b><a href="ProfiloUtenteServlet?infoProfilo=ordini">I miei Ordini </a></b></h4> 
  					  <p>Visualizza qui gli ordini effettuati in precedenza e gli ordini in arrivo!</p> 
 					</div>
			</div>


			<div class="pulsanti">
				<img src="https://img.icons8.com/plasticine/150/000000/wish-list.png"/>
  					<div class="container">
    					<h4><b><a href="ProfiloUtenteServlet?infoProfilo=wishlist">WishList</a></b></h4> 
    					<p>Visualizza qui gli oggetti che hai aggiunto alla tua lista dei desideri!</p> 
  					</div>
			</div>

			<div class="pulsanti">
				<img src="https://img.icons8.com/plasticine/150/000000/bank-cards.png"/>
  					<div class="container">
    					<h4><b><a href="ProfiloUtenteServlet?infoProfilo=datiUtente">Dati di pagamento e di spedizione</a></b></h4> 
    					<p>Clicca qui per modificare i dati della tua carta oppure il tuo indirizzo!</p> 
  					</div>
			</div>			
			</div>
	</div>
	
	<div  class="item-b ">
		<div class="datiPersona"> 
					<h4 id="titoloCaselle" >Dati personali</h4>
					<div class= "riga" class="hr"></div>
				
					<div class="row justify-content">
    					<div class="col-6 form-group">
    						<label class="etichette">Email:</label>
    						<input type="text" id="informazioni" name="email" value="<%=utente.getEmail()%>">
      						
    					</div>
    					<div class="col-6 form-group">
    					<label class="etichette">Password:</label>
      				<input type="text" id="informazioni" name="password" value="<%=utente.getPassword()%>">
    					</div>
  					</div>
  					
					<div class="row justify-content">
    					<div class="col-6 form-group">
    						<label class="etichette">Nome:</label>
      					<input type="text" id="informazioni" name="nome" value="<%=utente.getNome()%>">
    					</div>
    					<div class="col-6 form-group">
    					<label class="etichette" name="cognome">Cognome:</label>
      				<input type="text" id="informazioni" name="cognome" value="<%=utente.getCognome()%>">
    					</div>
  					</div>
  					
  					
  					</div>
  					
  				
  					<h4 id="titoloCaselle" >Dati Pagamento</h4>
					<div class= "riga" class="hr"></div>
					<div class="row justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette"> Numero Carta:</label>
      						<input type="text" id="informazioni" name="numeroCarta" value="<%=datiPag.getNumeroCarta()%>">
    					</div>	
    					<div class="row justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette"> Data Scadenza:</label> 
      						<input type="text" id="informazioni" name="scadenzaCarta" value="<%=datiPag.getScadenzaCarta()%>">
    					</div>	
    					
    					<div class="row justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette"> CVV:</label>
      						<input type="text" id="informazioni" name="CVV" value="<%=datiPag.getCVV()%>">
    					</div>	
    					<div class="col-10 form-group">
    						<label class="etichette"> Circuito:</label>
      						<input type="text" id="informazioni" name="circuito" value="<%=datiPag.getCircuito()%>">
    					</div>	
  					</div>
  					
					<h4 id="titoloCaselle" >Dati Spedizione</h4>
					<div class= "riga" class="hr"></div>
					<div class="row justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette">Via:</label>
      				<input type="text" id="informazioni" name="via" value="<%=datiSped.getVia()%>">
    					</div>
    					<div class="col-10 form-group">
    						<label class="etichette">Città:</label>
      				<input type="text" id="informazioni" name="citta" value="<%=datiSped.getCitta()%>">
    					</div>
    					<div class="col-10 form-group">
    						<label class="etichette">Provincia:</label>
      				<input type="text" id="informazioni" name="provincia" value="<%=datiSped.getProvincia()%>">
    					</div>
    					
    					<div class="col-10 form-group">
    						<label class="etichette">Cap:</label>
      				<input type="text" id="informazioni" name="cap" value="<%=datiSped.getCap()%>">
    					</div>
  					</div>
	
					
	</div>
	</div>
</div>
</div>
</form>
<%@ include file="footer.jsp"%>

</body>
</html>