<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/stilesito.css">
<title>Modifica Dati Utente</title>

</head>
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> I tuoi indirizzi </p>

 </div>
<div class="container-dati">
 
  
  <div class="modificaDati">
    <div id="nuovoIndirizzo" class="col-sm-3">
    <h4 id="titoloCaselle" >Nuovo indirizzo </h4>
					<div class= "riga1" class="hr"></div>
		<span> Clicca qui per aggiungere un nuovo indirizzo di spedizione </span>
		<h1> + </h1>
    
    </div>
    <div id="indirizzi" class="col-sm-4">
   		<div class="datiPersona"> 
					<h4 id="titoloCaselle" >Indirizzo 1</h4>
					<div class= "riga" class="hr"></div>
		
					<div class="modificaDati justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette">NOME:</label> 
    						<a id="informazioni"> qualcosa</a> <br>
    						<label class="etichette">CODICE:</label>
      				<a id="informazioni"> qualcosa</a><br>
      				<label class="etichette">DESCRIZIONE:</label>
      				<a id="informazioni"> qualcosa</a><br>
      				<label class="etichette">SPECIFICHE DEL PRODOTTO:</label>
      				<a id="informazioni"> qualcosa</a><br>
    					</div>
  					</div>
  				
  				<div class="opBtn">
  					<button> Modifica</button>
  					<button> Elimina  </button>
  				</div>
	</div>
      				
    
    </div>
    <div id="indirizzi" class="col-sm-4">
   		<div class="datiPersona"> 
					<h4 id="titoloCaselle" >Indirizzo 2</h4>
					<div class= "riga" class="hr"></div>
		
					<div class="modificaDati justify-content">
    					<div class="col-10 form-group">
    						<label class="etichette">NOME:</label> 
    						<a id="informazioni"> qualcosa</a> <br>
    						<label class="etichette">CODICE:</label>
      				<a id="informazioni"> qualcosa</a><br>
      				<label class="etichette">DESCRIZIONE:</label>
      				<a id="informazioni"> qualcosa</a><br>
      				<label class="etichette">SPECIFICHE DEL PRODOTTO:</label>
      				<a id="informazioni"> qualcosa</a><br>
    
    					</div>
  					</div>
  							<div class="opBtn">
  					<button> Modifica</button>
  					<button> Elimina </button>
  				</div>
	</div>
      				
    
    </div>
    
 </div>
 <div class="opBtn">
		<a class=" bottoni bottoni-colori " >
		    <span class="">Indietro</span>
		</a>	
		<a class=" bottoni bottoni-colori " >
		    <span class="">Torna alla Home</span>
		</a>	
  	</div>
 </div>
 
 		

<%@ include file="footer.jsp"%>
</body>
</html>