<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="">
<title>Visualizza prodotto - Oltre il Giardino </title>
<style>

.procediOrdine {
	width: 91%;
	display: grid;
	grid-template-columns: 50% 50%;
	/* grid-template-rows: 50% 50%; */
	height: 1000px;
	justify-content: center;
	grid-column-gap: 5%;
	margin-left: 90px;
}

.colonnaSx {
	grid-row-start: 1;
	grid-row-end: 4;
	width: 100%;
	height: 965px;
	width: 100%;
	border: 1px solid gainsboro;
	background-color: rgb(250, 330, 300);
	border-radius: 5px;
}

.colonnaDx1 {
	width: 100%;
	height: 365px;
	width: 90%;
	border: 1px solid gainsboro;
	background-color: rgb(250, 330, 300);
	border-radius: 5px;
	grid-row-gap: 5%;
}

.colonnaDx2 {
	width: 100%;
	height: 565px;
	width: 90%;
	border: 1px solid gainsboro;
	background-color: rgb(250, 330, 300);
    border-radius: 5px;
	grid-row-gap: 0;
	grid-row-start: 2;
	grid-row-end: 4;
}

#titColonne{
	font-size: 16px;
}


#carrelloOrdine {
	border-collapse: collapse;
	width: 90%;
	margin-left: 40px;
	font-size: 20px;
}

.immagineProd, .nomeProd, .quantProd, .prezzoProd, .scontoProd {
   padding: 8px;
   text-align: left;
   border-bottom: 1px solid #ddd;
}



#specificheTab{
	text-align: left;
}

#specificheTab:hover {background-color:#f5f5f5;}	

.totaleCol {
	position: absolute;
	top: 1230px;
	width: 40%;
	/* float: right; */
	font-size: 20px;
}

.totaleCol a{
	float:right;
}

/*
.colonne {
	border: 1px solid gainsboro;
	background-color: rgb(250, 330, 300);
	height: 500px;
	/* margin: 10px; 
	margin-right: 15px;
}
.procediOrdine {
	width: 97.5%;
	margin: auto;
	margin-left: 70px;
	margin-top: 35px;
}



.insDatiPersonali{
height: 250px;
width: 100%;
padding: 5px;
margin: 5px;
} */

#righe {
	margin: 0;
	font-size: 20px;
	line-height: 15px;
	float: left;
}

#caselle{
border-bottom: 1px solid rgba(40, 150, 5, 0.9);
}

#informazioniUtente{
	margin-left: 20px;
	margin-right: 20px;
}

.rigaSx {
	height: 1px;
	background: rgba(0,0,0,.2);
	width: 35%;
	margin: auto;
	margin-top: 10px;
	margin-bottom: 10px;
	float: left;
}

.rigaDx {
	height: 1px;
	background: rgba(0,0,0,.2);
	width: 35%;
	margin: auto;
	margin-top: 10px;
	margin-bottom: 10px;
	float: right;
}

.cose {
	font-size: 1.2em;
	color: #394a3c;
	padding: 5px;
}

#via, #civico, #provincia, #cap, #nome, #cognome, #numCarta, #cvv, #scadenza  {
	width: 90%;
	display: inline-block;
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid #b5afaf;
	margin-bottom: 15px;
	margin-left: 5px;
}


.select {
	width: 100%;
	margin-top: 6px;
	display: inline-block;
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid red;
	color: black;
}

.disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}

.abledbutton {
    pointer-events: visible;
     opacity: 1;
}
</style>
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
				  </tr>
				  <tr id="specificheTab">
				    <td class="immagineProd">Peter a</td>
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
     					<label class="">Scegli un indirizzo già salvato</label><br>	
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
		
		<label class="cose" for="carta">Carta</label>
		<input type="checkbox" id="carta" />
		
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
      		
      		
      		<label class="cose" for="contrassegno">Contrassegno</label>
			<input type="checkbox" id="contrassegno" />
			
			<div class="oppure text-center"><div class= "rigaSx" class="hr"></div><a id="oppure"> oppure </a><div class= "rigaDx" class="hr"></div></div>
			
			<div class="col-12 form-group">
     					<label class="">Scegli una carta già salvata</label><br>	
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
			document.getElementById("contrassegno").checked = false;
			$("#cartaUtente").addClass("abledbutton");
		}
	}

	function clickNo() {
		if (document.getElementById("carta").checked) {
			document.getElementById("carta").checked = false;
			$("#cartaUtente").addClass("disabledbutton");
		}
	}

	document.getElementById("carta").onchange = clickYes;
	document.getElementById("contrassegno").onchange = clickNo;

  </script>
<!-- 

<div class="procediOrdine">

 
  <div class="row">
    <div class="col-6 colonne">
      <span> lista degli oggetti</span>
    </div>
    <div class="col-5 colonne">
		    	<div class="row ">
		    		<div class=" insDatiPersonali">	    	
			     		 <a> INDIRIZZO</a><br>
			     		 <div class= "riga1" class="hr"></div> <br>
			     		 <a> Via: </a>  <br>
			     		 <a> Civico: </a>  <br>
			     		 <a> Città: </a>  <br>
			     		 <a> Codice postale: </a>  <br>
			     	</div>
		      	</div>
		      	
		      	<div class="row ">
		    		<div class=" insDatiPersonali">	    	
			     		 <a> PAGAMENTO</a><br>
			     		 <div class= "riga1" class="hr"></div> <br>
			     		 <a> Nome: </a>  <br>
			     		 <a> Cognome: </a>  <br>
			     		 <a> Tipo: </a>  <br>
			     		 <a> Numero Carta: </a>  <br>
			     		 <a>Cvv: </a>  <br>
			     	</div>
		      	</div>
      
    </div>
  </div>
</div>
 -->
 	
       
       
<%@ include file="footer.jsp"%>
</body>
</html>