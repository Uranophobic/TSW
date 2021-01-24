<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" /> <!-- AGGIUNGERE QUESTA LIBRERIA  -->
<title>Esempio di pop up </title>
	
<style> 
.hr {
	height: 2px;
	margin: 60px 0 50px 0;
	background: rgba(255,255,255,.2);
}

.foot-lnk {
    text-align: center;
}
/* Caselle di input */
.inputModifica {
	width: 100%;
	/* margin: 16px; */
	display: inline-block;
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid black;
	color: black;
	margin-top: 15px;
	margin-bottom: 15px;
}
#text, #psw{
	margin-top: 36px;
}	

/* Caratteristiche del titolo 'Accedi'  */
.titAccedi {
	margin: auto;
	width: 50%;
	font-size: 35px;
	color: black;
}

/* Primo pulsante accedi "esterno"*/   
.primo{
	background: #00BB2D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 20%;
	border-radius: 5px;
}

/* Secondo pulsante accedi per confermare email e pasw */
.secondo {
	background: #1161ee;
	padding: 15px 20px;
	border-radius: 25px;
	width: 100%;
	color: white;
	display: block;
	text-transform: uppercase;
	box-sizing: border-box;
	cursor: pointer;
	position: relative;
	border: none;
	margin-top: 50px;
}

/* Caratteristiche di tutte le label(etichette degli input) nel form  */
.etichetteModifica{
	font-size: 1.5em;
	color: black;
	padding-bottom: 16px;
}

/* Caratteristiche contenitore in cui si trova il form e tutto il resto*/
.contenitore {
	/* position: absolute; */
	/* width: 100%; */
	/* height: 100%; */
	padding: 90px 70px 50px 70px;
	z-index: 1;
}

/* The modale (background) */ /* Cose che non ho toccato */
.modale {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	padding-top: 60px;
	z-index: 1;
	
}



/* modale Content/Box */
.modificheSped {
	/* width: 100%; */
	margin: auto;
	max-width: 520px;
	/* min-height: 660px; */
	position: relative;
	box-shadow: 0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}



/* Bottone chiusura (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: black;
	font-size: 35px;
	font-weight: bold;
	opacity: 1;
	z-index: 1; /* Sit on top */
}

/* Se ci passi sopra diventa rosso e il puntatore cambia (x) */
.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}
</style>
	
</head>

<body>
 <button class="primo" onclick="document.getElementById('modificaSped').style.display='block'"
		style="width:auto;">
	MODIFICA</button>


<div id="modificaSped" class="modale">
  <form class="animate" action="profilo" method="post">
  <div class="modificheSped">
  <div class="imgcontenitore">
      <span onclick="document.getElementById('modificaSped').style.display='none'" class="close">&times;</span>
    </div>

    <div class="contenitore">
    	<h1 class="titAccedi text-center"><b> Modifica</b></h1><br>
      <label class="etichetteModifica"><b>Via</b></label>
      <input  class= "inputModifica" type="text" placeholder="via" name="via" required >
      <label class="etichetteModifica"><b>Citta'</b></label>
      <input  class= "inputModifica" type="text" placeholder="Citta" name="citta" required> 
       <label class="etichetteModifica"><b>Provincia</b></label>
      <input  class= "inputModifica" type="text" placeholder="provincia" name="provincia" required> 
       <label class="etichetteModifica"><b>Cap</b></label>
      <input  class= "inputModifica" type="text" placeholder="CAP" name="CAP" required> 
       
	 <font color="#009e0f"> <button class="secondo" type="submit">MODIFICA</button></font>
       <div class="hr"></div>
       
    </div>

    
  </div>
		</form>
</div>

<script>
	// Get the modal
	var modal = document.getElementById('modificaSped')

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

</script>



</body>
</html>