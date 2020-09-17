
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
<script type="text/javascript">

$( document ).ready(function() {
    console.log( "ready!" );
    showNotifica();
  

}); 


</script>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"
  />
  
	<meta charset="UTF-8">
	<title>Agricolàrio - Navbar</title>
	
	<style> 
	
	body{
	   font-family: "Dosis";
	src: url("../font/Dosis/AnyConv.com__Dosis-Regular.otf");
	}
	
.hr {
	height: 2px;
	margin: 60px 0 50px 0;
	background: rgba(255,255,255,.2);
}

.foot-lnk {
    text-align: center;
}




/* Caselle di input */

input[type="text"], input[type="password"] {
	width: 100%;
	/* margin: 16px; */
	display: inline-block;
	border: none;
	box-sizing: border-box;
	background: transparent;
	border-bottom: 1px solid rgba(255,255,255,.3);
	color: white;
	margin-top: 15px;
	margin-bottom: 15px;
}


#text, #psw{
	margin-top: 36px;
}	

input[type=text]:focus, input[type=password]:focus{
	-webkit-transition: 0.2s;
 	 transition: 0.2s;
 	 border-bottom: 2px solid white;
 	 
}

/* Checkbox di 'Ricordami' quando cliccata */
input[type="checkbox"] {
	box-sizing: border-box;
	padding: 0;
	color:white;
}

/* Checkbox disposizione */
.checkbox{
display: inline-block;
}


/* Cambia forma il puntatore quando passi sulla checkbox*/
.form-check-input:hover{
	cursor: pointer;
}

/*Grandezza di ricordami*/
.white-text{
	font-size: 20px;
}

/* Caratteristiche del titolo 'Accedi'  */
.titAccedi {
	margin: auto;
	width: 50%;
	font-size: 35px;
	color: white;
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

.gruppo{
 margin-bottom: 30px;
}

/* Ogni bottone diventa opaco quando ci passi sopra  */
button:hover {
	opacity: 1;
}

/* Caratteristiche di tutte le label(etichette degli input) nel form  */
.etichetteAccedi{
	font-size: 1.5em;
	color: white;
	padding-bottom: 16px;
}



/* Bordi arrotondati per l'immagine sfondo */
img{
	border-radius: 5px;
}


/* Caratteristiche contenitore in cui si trova il form e tutto il resto*/

.contenitore {
	/* position: absolute; */
	/* width: 100%; */
	/* height: 100%; */
	background: rgba(0,100,50,0.4);
	padding: 90px 70px 50px 70px;
	z-index: 5000000000000000000000;
}

		


/* Caratteristiche secondo contenitore in cui si trova il "registrati qui" (prima c'era anche un tasto annulla ma l'ho tolto) */
.contenitore2{
	background-color: transparent;
	margin: auto;
  	width: 50%;
  	z-index: 5000000000000000000000;
} /* si deve aggiustare*/




/* The modale (background) */ /* Cose che non ho toccato */
.modale {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
	z-index: 5000000000000000000000;
	
}



/* modale Content/Box */
.login {
	/* width: 100%; */
	margin: auto;
	max-width: 520px;
	/* min-height: 660px; */
	position: relative;
	background: url(https://images.vanityfair.it/wp-content/uploads/2019/04/19133507/P29-850x1360.jpg) no-repeat center;
	box-shadow: 0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}



/* Bottone chiusura (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: white;
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


/* Add Zoom Animation */   /*  funziona */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	
	span.reg {
 
	}
	
	h1 {
		width: 100%;
	}
}


a.notif {
  position: relative;

  width: 50px;

  text-decoration: none;
}
.num {
    width: 25px;
    height: 25px;
    position: absolute;
    color: black;
    bottom: 8px;
    right: -12px;
    text-align: center;
    background-color: red;
    border-radius: 20px 20px 20px 20px;
    font-size: 16px;
    display:none;
}
@media 
only screen and (max-width: 988px)  {
.navbar-brand{

margin-right: 45%!important;

}
}
</style>
	
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow " id="navbar">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand " href="showHome" id="logoResponsive" style="display:none;">
  	<img alt="" src="image/LOGO.png" width="100" height="75" class="d-inline-block align-top">
  </a>
  <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
  <a class="navbar-brand mr-5" href="showHome" id="logo">
  	<img alt="" src="image/LOGO.png" width="100" height="75" class="d-inline-block align-top">
  </a>
    <ul class="navbar-nav justify-content-center ">
      <li class="nav-item active mr-5  dropdown ">
     
        <a class=" nav-link navbar-element" href="showFunzionalita?funzionalita=comefunziona" ><!--  role="button" data-toggle="dropdown"  data-hover="dropdown" -->COME FUNZIONA</a>
     <!--    <div class="dropdown-menu dropdown-menu-animation" >
   			 	 <a class="dropdown-item" href="">Registro Fitosanitario</a>
   				 <a class="dropdown-item" href="#">Prodotti Fitosanitario</a>
    			 <a class="dropdown-item" href="#">Scadenze</a>
 				 <a class="dropdown-item" href="#">Tracciabilità</a>
 	
 		</div> -->
      </li>
      <li class="nav-item active mr-5 navbar-element">
        <a class="nav-link navbar-element" href="showFunzionalita?funzionalita=vantaggi">VANTAGGI</a>
      </li>
      <li class="nav-item active mr-5 ">
        <a class="nav-link active navbar-element" href="showFunzionalita?funzionalita=chisiamo">CHI SIAMO</a>
      </li>
      <li class="nav-item active mr-5">
        <a class="nav-link navbar-element" href="showFunzionalita?funzionalita=assistenza">ASSISTENZA</a>
      </li>
    </ul>
  
     <div id="icone" class="align-baseline icon-bar-vertical">
  	<a class="" href="showHome"><img src="https://img.icons8.com/officel/30/000000/home-page.png"/></a>
  	<a href="showAccount" class=" ml-3" ><img src="https://img.icons8.com/officel/30/000000/gender-neutral-user.png"/></a>
  	<a href="showNotifiche" class=" ml-3 notif"><img src="https://img.icons8.com/officel/30/000000/appointment-reminders.png"/><span class="num"></span></a>
  	<a href="logout" class=" ml-3" ><img src="https://img.icons8.com/officel/30/000000/exit.png"/></a>
  	
  	
  	
  	
	</div> 
   
    <button class="primo" onclick="document.getElementById('id01').style.display='block'"
		style="width:auto;">
	ACCEDI
	</button>
	

</nav>


<div id="id01" class="modale">
  
  <form class="animate" action="login"
			method="post">
   <div class="login">
			 
  
   <div class="imgcontenitore">
      <span onclick="document.getElementById('id01').style.display='none'"
						class="close">&times;</span>
    </div>

    <div class="contenitore">
    	<h1 class="titAccedi text-center"><b> Accedi</b></h1><br>
      <label class="etichetteAccedi"><b>Inserisci qui la tua e-mail</b></label>
      <input  style="color: white;" type="text" placeholder="Email" name="email" required>

      <label class="etichetteAccedi"><b>Inserisci qui la tua password</b></label>
      <input  style="color: white;" type="password" placeholder="Password" name="password" required> 
        
     
      <div class="gruppo">
					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span style="font-size:16px" "class="icon"> Ricordami</label></span>
	</div>
	
	 <font color="#009e0f"> <button class="secondo" type="submit">ACCEDI</button></font>
       <div class="hr"></div>
			<div class="foot-lnk">
					<a style="color:white">Non sei ancora registrato?</a> <a href="" style="color: white; font-style: italic; font-weight: bold">Registrati qui!</a>
			</div>
    </div>

    
  </div>
		</form>
</div>

<script>
	// Get the modal
	var modal = document.getElementById('id01');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

</script>



</body>
</html>