<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
<meta charset="UTF-8">
<style>
.etichette {
	font-weight: bold;
	font-size: 1.2em;
	color: black;
	padding: 0;
}

input[type="text"], input[type="password"] {
	width: 100%;
	/* margin: 16px; */
	display: inline-block;
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid red;
	color: black;
	margin-top: 15px;
	margin-bottom: 15px;
}

input[type="date"] {
	width: 100%;
	margin: 0px 0 0px 0;
	display: inline-block;
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid red;
	color: black;
}

.select {
	width: 100%;
	margin-top: 6px;
	display: inline-block;
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid rgba(255,255,255,.3);
	color: black;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="row justify-content-center " id="form-registrazione">
		<div id="form-registrazione">
  					<div class="row justify-content-center">
    					<div class="col-4 form-group">
    						<label class="etichette">Nome</label>
      						<input type="text" placeholder="Nome" name="nome" id="nome" required="required">
    					</div>
    					<div class="col-4 form-group">
    					<label class="etichette">Cognome</label>
      					<input type="text" placeholder="Cognome" name="cognome" id="cognome" required="required">
    					</div>
  					</div>
 
  					<div class="row justify-content-center">
  					   <div class="col-8 form-grupo">
  					   		<label class="etichette">Email</label>
      						<input type="text" placeholder="Email" name="email" id="email" required="required">
   					   </div>
  					</div>
  					
 					 <div class="row justify-content-center mt-3">
    					<div class="col-4 form-goup">
    						<label class="etichette">Password</label>
      						<input type="password" placeholder="Password" name="password" id="password" required="">
    					</div>
    				 	<div class="col-4 form-group">
    				 		<label class="etichette">Conferma Password</label>
      				 		<input type="password" placeholder="Conferma Password" id="confirm_password" required="">
   					 	</div>
  					</div>	

   					<div class="row justify-content-center">
					    <div class="col-4">
					   	 <label class="etichette">Data di nascita</label>
    						<input type="date" placeholder="dd mm yyyy" name="dataNascita" id="dn" data-date-format="DD MM YYYY" required="required">
    					</div>
    					
    				<div class="col-4 form-group">
     					<label class="etichette">Ruolo</label>	
 							 <select class="select" id="ruolo" name="ruolo" required="required"> 
  								 <option selected="">---</option>
    						     <option value="titolare">Titolare</option>
   							     <option value="delegato">Delegato</option>
 							 </select>
    				</div>
 				   </div>
 				   
   					<div class="row  justify-content-center">
   				    <div class="col-8">
 							<div class="form-group form-check">
    								<input type="checkbox" class="form-check-input" id="exampleCheck1">
    								<label class="etichettaAcconsento">Acconsento al trattamento dei miei dati, accetto i Termini di Servizio e la Politica della Privacy</label>
 							</div>    
  					</div>
  					</div>
  				
  					<div id="registrazione" class="row  justify-content-center">
   				    <button type="submit" class="bottoneReg">Registrati</button>   
  					</div>
  
   				    	<div class="riga"></div>
							<div class="scritta">
								<a style="color: white"> Torna alla </a> <a href="#" style="color: white; font-style: italic; font-weight: bold">Home Page.</a>
							</div>
    				
  
  	</div>   
  </div>
  
  
  <p>Multually exclusive checkboxes. Obviously, the correct solution is to use radio buttons, but some people are stupid and you can't fix stupid (I had to do this for a boss who did not understand).</p>
<fieldset>
	

	<label for="carta">Carta</label>
	<input type="checkbox" id="carta" />

	<label for="contrassegno">Contrassegno</label>
	<input type="checkbox" id="contrassegno" />
</fieldset>
  <script>
  
  function clickYes() {
		if (document.getElementById("contrassegno").checked) {
			document.getElementById("contrassegno").checked = false;
		}
	}

	function clickNo() {
		if (document.getElementById("carta").checked) {
			document.getElementById("carta").checked = false;
		}
	}

	document.getElementById("carta").onchange = clickYes;
	document.getElementById("contrassegno").onchange = clickNo;

  </script>
  
  <!-- 
  <div  class="colonnaDx ">
		<p id="titColonne"> Spedisci all'indirizzo: </p>
		
			<label class="cose">Via:</label>
      		<input type="password" placeholder="Conferma Password" id="confirm_password" required="">
			<label class="cose">Civico:</label>
      		<input type="password" placeholder="Conferma Password" id="confirm_password" required=""><br>
			<label class="cose">Provincia:</label>
      		<input type="password" placeholder="Conferma Password" id="confirm_password" required="">
			<label class="cose">Codice Postale:</label>
      		<input type="password" placeholder="Conferma Password" id="confirm_password" required="">
			<div class="oppure"><div class= "rigaSx" class="hr"></div><a id="oppure"> oppure </a><div class= "rigaDx" class="hr"></div></div>
			<div class="col-12 form-group">
     					<label class="">Scegli un indirizzo già salvato</label><br>	
 							 <select class="select" id="ruolo" name="ruolo" > 
  								 <option selected="">---</option>
    						     <option value="">Indirizzo 1</option>
   							     <option value="">Indirizzo 2</option>
 							 </select>
    	</div>
    	</div>			
   -->
  
  
</body>
</html>