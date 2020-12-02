<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">




<title>Natural Shop - Profilo Utente</title>
</head>
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> Profilo Utente </p>

 </div>
 
 
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
      						<a id="informazioni"> qualcosa</a>
    					</div>
    					<div class="col-6 form-group">
    					<label class="etichette">Password:</label>
      				<a id="informazioni"> qualcosa</a>
    					</div>
  					</div>
  					
					<div class="row justify-content">
    					<div class="col-6 form-group">
    						<label class="etichette">Nome:</label>
      					<a id="informazioni"> qualcosa</a>
    					</div>
    					<div class="col-6 form-group">
    					<label class="etichette">Cognome:</label>
      				<a id="informazioni"> qualcosa</a>
    					</div>
  					</div>
  					
  					<div class="row justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette">Telefono:</label>
      					<a id="informazioni"> qualcosa</a>
    					</div>	
  					</div>
  					
  				
  					<h4 id="titoloCaselle" >Dati Pagamento</h4>
					<div class= "riga" class="hr"></div>
					<div class="row justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette">Carta:</label>
      						<a id="informazioni"> qualcosa</a>
    					</div>	
  					</div>
  					
					<h4 id="titoloCaselle" >Dati Spedizione</h4>
					<div class= "riga" class="hr"></div>
					<div class="row justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette">Indirizzo:</label>
      				<a id="informazioni"> qualcosa</a>
    					</div>
  					</div>
	
					
	</div>
	
</div>
</div>

<%@ include file="footer.jsp"%>

</body>
</html>