<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/stilesito.css">
<title>Visualizza prodotto - Oltre il Giardino </title>
<style>

.procediOrdine {
	width: 90%;
	display: grid;
	grid-template-columns: 50% 50%;
	grid-template-rows: 50% 50%;
	height: 600px;
	justify-content: center;
	grid-column-gap: 5%;
	margin-left: 80px;
}

.colonnaSx {
	grid-row-start: 1;
	grid-row-end: 4;
	width: 100%;
	height: 565px;
	width: 100%;
	text-align: center;
	border: 1px solid gainsboro;
	background-color: rgb(250, 330, 300);
	border-radius: 5px;
}

.colonnaDx {
	/* grid-row-start: 1; */
	/* grid-row-end: 5; */
	width: 100%;
	height: 265px;
	width: 90%;
	text-align: center;
		border: 1px solid gainsboro;
	background-color: rgb(250, 330, 300);
	border-radius: 5px;
	margin: ;
	/* margin-bottom: 50px; */
	grid-row-gap: 5%;
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
text-align: left;}

#specificheTab:hover {background-color:#f5f5f5;}	

.totaleCol {
	position: absolute;
	top: 830px;
	width: 40%;
	/* float: right; */
	font-size: 20px;
	display: block;
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


</style>
</head>
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> Procedi all'acquisto </p>
</div>




<div class="procediOrdine" >
	<div  class="colonnaSx ">
 		<p id="titColonne"> Stai acquistando: </p>
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
	
	<div  class="colonnaDx ">
		<p id="titColonne"> Indirizzo </p>
			<a> Via: </a>  <br>
			<a> Civico: </a>  <br>
			<a> Città: </a>  <br>
			<a> Codice postale: </a>  <br>			
	</div>
	
	<div  class="colonnaDx ">
		<p id="titColonne"> Pagamento </p>		 
			<a> Nome: </a>  <br>
			<a> Cognome: </a>  <br>
			<a> Tipo: </a>  <br>
			<a> Numero Carta: </a>  <br>
			<a>Cvv: </a>  <br>		
	</div>
	
</div>


	<div class="opBtn2">
		<a class=" bottoni bottoni-colori " >
		    <span class="">Procedi all'acquisto ></span>
		</a>	
  	</div>
  				
  				


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