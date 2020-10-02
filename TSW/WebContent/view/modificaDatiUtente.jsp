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
<p  class="titoloPagine"> Profilo Utente </p>

 </div>
<div class="contenitore">


		<div class="datiPersona"> 
<h4 id="titoloCaselle"> Modifica i tuoi dati personali</h4>
					<div class= "riga" class="hr"></div>
				
					<div class="row justify-content">
    					
    					<div class="col-6 form-group">
    					<label class="etichette">Password:</label>
    					<input type="text">
    					</div>
  					</div>
  					
  					<div class="row justify-content">
    					<div class="col-6 form-group">
    						<label class="etichette">Telefono:</label>
      					<input type="text">
    					</div>	
  					</div>
  					
  				
  					<h4 id="titoloCaselle" >Dati Pagamento</h4>
					<div class= "riga" class="hr"></div>
					<div class="row justify-content">
    					<div class="col-6 form-group">
    						<label class="etichette">Carta:</label>
      						<input type="text">
    					</div>	
  					</div>
  					
					<h4 id="titoloCaselle" >Dati Spedizione</h4>
					<div class= "riga" class="hr"></div>
					<div class="row justify-content">
    					<div class="col-6 form-group">
    						<label class="etichette">Indirizzo:</label>
      						<input type="text">
    					</div>
  					</div>
	
					
	</div>
	
<button id="modificaBtn"> Indietro</button>
<button id="modificaBtn"> Salva </button>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>