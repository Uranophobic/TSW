<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/stilesito.css">
<title>Visualizza prodotto - Oltre il Giardino </title>
<style>
.colonne{
border: 1px solid gainsboro;
	background-color: rgb(250, 330, 300);
	height: 350px;
}

.procediOrdine {
	width: 97.5%;
	margin: auto;
	margin-left: 70px;
	margin-top: 35px;
}
</style>
</head>
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> Procedi all'acquisto </p>
</div>


<div class="procediOrdine">

 
  <div class="row">
    <div class="col-6 colonne">
      <span> lista degli oggetti</span>
    </div>
    <div class="col-5 colonne">
		    	<div class="row insDatiPersonali">
		     		 <span> INDIRIZZO</span>
		      	</div>
		      	
		      	<div class="row insDatiPersonali">
		     		 <span> PAGAMENTO</span>
		      	</div>
      
    </div>
  </div>
</div>
 
 	<div class="opBtn2">


<a class=" bottoni bottoni-colori " >
    <span class="">Procedi all'acquisto ></span>
</a>
       	
  	</div>
  				
  				
       
       
<%@ include file="footer.jsp"%>
</body>
</html>