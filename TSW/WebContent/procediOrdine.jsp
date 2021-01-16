<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Visualizza prodotto - Oltre il Giardino </title>

</head>
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> Procedi all'acquisto </p>
</div>




<div class="procediOrdine" >
	<div  class="colonnaSx ">
 		<p class="titColonne text-center"> Stai acquistando: </p>
				<table id="carrelloOrdine">
				  <tr style="text-align: left;">
				    <th id="colonna1">Immagine</th>
				    <th id="colonna2">Nome</th>
				    <th id="colonna3">Quantità</th>
				    <th id="colonna4">Prezzo</th>
				    <th id="colonna5">Sconto</th>
				    <th id="colonna6">Prezzo Totale</th>
				  </tr>
				  <tr id="specificheTab">
				    <td class="immagineProd">Peter a</td>
				    <td class="nomeProd">Griffin</td>
				    <td class="quantProd">$100</td>
				    <td class="prezzoProd">Griffin</td>
				    <td class="scontoProd">$100</td>
				    <td class="prezzoTot">$100</td>
				    
				  </tr>
				  <tr id="specificheTab">
				  <td class="immagineProd">Peter</td>
				    <td class="nomeProd">Griffin</td>
				    <td class="quantProd">$100</td>
				    <td class="prezzoProd">Griffin</td>
				    <td class="scontoProd">$100</td>
				  </tr>
				  <tr id="specificheTab">
				 <td class="immagineProd">Peter</td>
				    <td class="nomeProd">Griffin</td>
				    <td class="quantProd">$100</td>
				    <td class="prezzoProd">Griffin</td>
				    <td class="scontoProd">$100</td>
				  </tr>
				  <tr id="specificheTab">
				    <td class="immagineProd">Peter</td>
				    <td class="nomeProd">Griffin</td>
				    <td class="quantProd">$100</td>
				    <td class="prezzoProd">Griffin</td>
				    <td class="scontoProd">$100</td>
				  </tr>
				</table>
				
			<div class="totaleCol">
				<a> Totale prodotti: xxx </a> <br>
				<a> Costi spedizione: xxx </a> <br>
				<a> Totale complessivo: xxx </a>
			</div>	
	</div>
	
	<div  class="colonnaDx1 ">
		<p class="titColonne text-center" > Spedisci all'indirizzo: </p>
				<label class="">
		  <input type="radio" checked="checked" name="radio">
		  <span class="checkmark"></span>
		  Aggiungi un nuovo indirizzo:
		</label>
			<div class="row justify-content-center">
			<div class="col-6 form-goup">
			<label class="cose">Via:</label>
      		<input type="text" placeholder="Strada/Vicolo/Piazza"  name="via" id="via">
      		</div>
      		<div class="col-6 form-goup">
			<label class="cose">Civico:</label>
      		<input type="text" placeholder="Numero dell'abitazione" name="civico" id="civico">
      		</div>
      		</div>
      		
      		
      		<div class="row justify-content-center">
      		<div class="col-6 form-goup">
			<label class="cose">Provincia:</label>
      		<input type="text" placeholder="Provincia" name="provincia" id="provincia">
      		</div>
      		<div class="col-6 form-goup">
			<label class="cose">CAP:</label>
      		<input type="text" placeholder="Codice postale" name="cap" id="cap">
      		</div>
      		</div>
      		
      		
			<div class="oppure text-center"><div class= "rigaSx" class="hr"></div><a id="oppure"> oppure </a><div class= "rigaDx" class="hr"></div></div>
			
			<div class="col-12 form-group">
			
	<label class="">
  <input type="radio" checked="checked" name="radio">
  <span class="checkmark"></span>
  Scegli un indirizzo già salvati
</label>
			
     						
 							 <select class="select"  name="indirizzi" id="indirizzi"> 
  								 <option>---</option>
    						     <option value="ind1">Indirizzo 1</option>
   							     <option value="ind2">Indirizzo 2</option>
 							 </select>
    	</div>			
	</div>
	
	<div  class="colonnaDx2 ">
		<p class="titColonne text-center"> Paghi con: </p>
		
		<fieldset>
				<label class="">
		  <input type="radio" checked="checked" name="radio" onClick="clickYes()" id="contrassegno">
		  <span class="checkmark"></span>
		 	Contrassegno
		</label><br>
				<label class="">
		  <input type="radio" checked="checked" name="radio" onClick="clickNo()" id="carta">
		  <span class="checkmark"></span>
		  	Aggiungi una nuova carta:
		</label>
		
		<div id="cartaUtente">
		<div class="row justify-content-center">
			<div class="col-6 form-goup">
			<label class="cose">Nome:</label>
      		<input type="text" placeholder="Nome"  name="nome" id="nome">
      		</div>
      		<div class="col-6 form-goup">
			<label class="cose">Cognome:</label>
      		<input type="text" placeholder="Cognome" name="cognome" id="cognome">
      		</div>
      		</div>
      		
      		
      		<div class="row justify-content-center">
      		<div class="col-12 form-goup">
						<label class="cose">Numero carta:</label>
			      		<input type="text" placeholder="8 - 16 cifre " name="numeroCarta" id="numCarta">
      		</div>
      	
      		</div>
      		
      		<div class="row justify-content-center">
					    <div class="col-6">
					   	 <label class="cose">Scadenza</label>
    						<input type="date" placeholder="dd mm yyyy" name="scadenza" id="scadenza" data-date-format="DD MM YYYY">
    					</div>
    					<div class="col-6 form-goup">
							<label class="cose">Cvv:</label>
				      		<input type="text" placeholder="3 cifre" name="cvv" id="cvv">
      					</div>
      		</div>
      		</div>
      		
      		
      		
			
			<div class="oppure text-center"><div class= "rigaSx" class="hr"></div><a id="oppure"> oppure </a><div class= "rigaDx" class="hr"></div></div>
			
			<div class="col-12 form-group">
			     	<label >
					    <input type="radio" checked="checked" name="radio">
					    <span class="checkmark"></span>
					    Scegli una carta già salvata:
					</label>	
 					<select class="select"  name="indirizzi" id="indirizzi"> 
  						<option>---</option>
    					<option value="ind1">Indirizzo 1</option>
   						<option value="ind2">Indirizzo 2</option>
 					</select>
    	</div>					 
		</fieldset>	
	</div>
	
</div>


	<div class="opBtn2">
		<a class=" bottoni bottoni-colori " >
		    <span class="">Procedi all'acquisto ></span>
		</a>	
  	</div>
  				
  				

<script>
  
  function clickYes() {
		if (document.getElementById("contrassegno").checked) {
			$("#cartaUtente").addClass("disabledbutton");
			
		}
	}

	function clickNo() {
		if (document.getElementById("carta").checked) {
			$("#cartaUtente").addClass("abledbutton");
			
		}
	}



  </script>

       
       
<%@ include file="footer.jsp"%>
</body>
</html>