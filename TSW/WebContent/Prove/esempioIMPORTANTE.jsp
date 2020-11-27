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
  <div class="pos-f-t">
  <div class="collapse" id="navbarToggleExternalContent">
    <div class="bg-dark p-4">

	<div class= "icone-gruppo col-sm-5 col-md-4 col-lg-4 "> 
	
	<!-- homepage -->
	<a id="icona" href="../view/HomePage2.jsp"> 
	<svg  xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
		width="25" height="25"
		viewBox="0 0 172 172"
		style=" fill:#000000;">
		<g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path>
		<g fill="#394a3c"><path d="M86,14.19336l-78.90332,73.23438l7.30665,7.89453l7.09668,-6.59278v61.77051h53.75v-53.75h21.5v53.75h53.75v-61.77051l7.09668,6.59278l7.30665,-7.89453zM86,28.80665l53.75,49.9707v60.97266h-32.25v-53.75h-43v53.75h-32.25v-60.97266z"></path></g></g>
	</svg> Homepage
	</a>
	
	
	<!-- wish list -->  
	<a id="icona" href="../view/WishList.jsp"> 
	<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
			width="25" height=25
			viewBox="0 0 172 172"
			style=" fill:#000000;">
			<g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path>
			<g fill="#394a3e"><path d="M53.75,21.5c-21.79395,0 -39.7246,16.41895 -42.4121,37.45703c-0.37794,1.72168 -0.5879,3.52734 -0.5879,5.54297c0,24.56543 18.77051,46.7373 36.70118,63.19824c17.88867,16.50294 35.77734,27.37891 35.77734,27.37891l2.77148,1.72169l2.77149,-1.72169c0,0 17.88867,-10.87597 35.81933,-27.37891c17.88867,-16.46094 36.65918,-38.63281 36.65918,-63.19824c0,-2.01562 -0.20996,-3.77929 -0.5459,-5.45898c-2.72949,-21.12207 -20.61817,-37.54102 -42.4541,-37.54102c-13.35351,0 -24.39746,6.97071 -32.25,16.54493c-7.85254,-9.57422 -18.89648,-16.54493 -32.25,-16.54493zM53.75,32.25c11.8418,0 22.00391,6.38281 27.63086,15.87305l4.61914,7.81054l4.61915,-7.81054c5.62695,-9.49024 15.78906,-15.87305 27.63085,-15.87305c16.50293,0 29.85645,12.30371 31.83008,28.30274l0.08398,0.41992c0.20996,1.00781 0.33594,2.1416 0.33594,3.52734c0,18.8125 -16.16699,39.64063 -33.21582,55.30371c-15.62109,14.40332 -28.80664,22.42383 -31.28418,23.97754c-2.47754,-1.55371 -15.66308,-9.57422 -31.32617,-23.97754c-17.00684,-15.66308 -33.17383,-36.49121 -33.17383,-55.30371c0,-1.42773 0.12598,-2.56152 0.33594,-3.52734l0.08399,-0.25195v-0.25196c2.01563,-15.91504 15.32715,-28.21875 31.83007,-28.21875z"></path></g></g>
	</svg> Lista dei Desideri
	</a>
	
	
	
	<!-- carrello -->
	<a id="icona" href="../view/carrello.jsp"> 
	<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
		width="25" height="25"
		viewBox="0 0 172 172"
		style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path>
		<g fill="#394a3c"><path d="M10.75,10.66602v10.75h21.5c2.30957,0 4.28321,1.51172 5.03906,3.69531l10.03614,89.56933c0.92382,8.10449 7.89453,14.31933 16.04101,14.31933h65.63379v-10.75h-65.63379c-2.77148,0 -5.03906,-2.01562 -5.333,-4.74511l-0.67187,-6.00489h68.19531c7.64257,0 14.31933,-5.45898 15.83105,-12.93359l10.28808,-51.56641h-101.5791l-2.30956,-20.49219l-0.16797,-0.50391c-2.05763,-6.71875 -8.31446,-11.2959 -15.36915,-11.33789zM118.25,129c-5.9209,0 -10.75,4.8291 -10.75,10.75c0,5.9209 4.8291,10.75 10.75,10.75c5.9209,0 10.75,-4.8291 10.75,-10.75c0,-5.9209 -4.8291,-10.75 -10.75,-10.75zM64.5,129c-5.9209,0 -10.75,4.8291 -10.75,10.75c0,5.9209 4.8291,10.75 10.75,10.75c5.9209,0 10.75,-4.8291 10.75,-10.75c0,-5.9209 -4.8291,-10.75 -10.75,-10.75zM51.31446,53.75h87.25976l-7.72656,38.6748c-0.5459,2.56153 -2.6875,4.3252 -5.29101,4.3252h-69.41309z"></path></g></g>
	</svg> Carrello
	</a>
	
	<div class= "col-sm-3 col-md-4 col-lg-3">	
	<a class="logo">
  	<img alt="logo.png" src="../logo/logo_small.png" width="290" >
  	</a></div>
  	
  	
	<div class= "col-sm-4 col-md-4 col-lg-4  "><div class="barraRicerca">
	 <form class="navbar-form " action="/action_page.php">
	      <div class="input-group">
	        <input type="text" class="form-control" placeholder="Search" name="search">
	        <div class="input-group-btn">
	         <button class="btnRicerca" type="submit"><i class="fa fa-search"></i></button>
	        </div>
	      </div>
	    </form>
	 </div></div>
	 
<div id="nav" class="col-sm-24">

	
		<div class="col-sm-3 col-md-4 col-lg-3"  id="categMenu"> CATEGORIE</div>
		
				<div class="col-sm-8 col-md-4 col-lg-9 ">
					<ul class="group-menu">
						<li class="item   "> <a> <span> COME FUNZIONA </span> </a></li>
						<li class="item   "> <a> <span> ASSISTENZA </span> </a></li>
						<li class="item   "> <a> <span> CHI SIAMO </span> </a> </li>
					</ul>
				</div>
	
</div>	 
</div>	
    </div>
  </div>
  <nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </nav>
</div>







  
  <!--   transforma in radio button -->
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