<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="css/stylesheet.css">
<meta charset="ISO-8859-1">
<title>Agricolàrio - Assistenza</title>

<style>
/** Style che serve per il form */
.etichetta {
	font-size: 20px;
	padding: 0 0 5px 0;
	margin:0;
	color: white;
}
.form-control:valid, .form-control:invalid{
  background-color: white;
  margin:0;
  color: black;
}
.bottoneInvio{
	background: #1161ee;
    padding: 15px 20px;
    border-radius: 25px;
    width: 50%;
	color: white;
	margin:auto;
    text-transform: uppercase;
    box-sizing: border-box;
    cursor: pointer;
	position: relative;
	border:none;
	margin-top: 20px;
}
.bottoneInvio:hover {
	-webkit-transition: 0.3s;
 	 transition: 0.3s;
	background: #0d52cb;
	font-weight: bold;
}


/*POP UP CONFERMA*/
.contenitore-delega {
	width: 100%;
	height: auto;
	z-index: 1;
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	justify-content: center;
	align-items: center;
	padding-top: 20%;
}

#delega-pop-up{
	display: none;
}


#blocco-delega {
	width: 400px;
	height: 150px;
	background-color: white;
	/* display: grid; */
	grid-template-rows: 25px 50px 50px 50px;
	border-radius: 10px;
	border: 1px solid gainsboro;
}


.close-delegato{
    width:15px;
    color: black;
	font-size: 20px;
	font-weight: bold;
	position:relative;
	float: right;
	margin-right: 10px;
}


.fa-close:hover{
	color: red;
	cursor: pointer;
}


#titolo-pop-up{
font-size: 28px;
font-weight: bold; 
 margin: auto;
 width: 50%;
}

#pop-text {
	font-size: 18px;
	/* margin: auto; */
	/* width: 80%; */
	margin-left: 50px;
}

.bottoni-pop-up {
	height: 20%;
	width: 100%;
	display: grid;
	grid-template-columns: 100px 100px;
	justify-content: center;
	grid-Column-gap: 5%;
	margin-top: 30px;
}

.colore-bottoni{

 /* background: #1161ee;
  border-radius: 25px;
  color: white;
  border:none;
  text-transform: uppercase; */
  
	background: #1161ee;
	border-radius: 25px;
	color: white;
	border: none;
	text-transform: uppercase;
	height: 100%;
	width: 100%;
	background-color: #23a9d8;
	color: white;
	font-weight: ;
	border: none;
	text-align: center;
	border-radius: 5px;
	font-size: 20px;
}


#confermaBottone:hover{

background-color: green;

}

#annullaBottone:hover{

background-color: red;

}

</style>
</head>
<body>



<div class="row row-cols-1 row-cols-md-2">

	<div class="col text-center justify-content-center pt-4">
				<h2 class="title p-4" style="color: #289605;">ASSISTENZA,</h2>               
                <h4 class="pl-5 pr-5 font-weight-light">Se sei ancora incerto sul funzionamento del sito,
                se hai difficoltà nello svolgere qualche operazione
                o se hai semplicemente qualche domanda o suggerimento da porre,
                puoi contattarci scrivendoci un messaggio.<br><br>
                Il team sarà disponibile per tutti i chiarimenti.</h4>
                <img class="img-fluid" style="width:auto" src="https://img.icons8.com/bubbles/300/000000/online-support.png"/>
      </div>
    <div class="col justify-content-center p-5">
    <div class="card card-body rounded-0 shadow picture" style="background-image:linear-gradient(rgba(0, 0, 0, 0.5),rgba(0, 0, 0, 0.5)), url('image/formbackground.jpg')">
 	<h1 class="text-center py-4 text-light"><b>Contattaci</b></h1><br>
		 <form class="needs-validation" novalidate id="form-contattaci" action="mailto:" method="post" enctype="text/plain">
			
  					<div class="row justify-content-center">
    					<div class="col-5 form-group">
    					<label class="etichetta">Nome</label>
      					<input class="form-control" type="text" placeholder="Nome..." name="nome" required>
    					</div>
    					<div class="col-5 form-group">
    					<label class="etichetta">Cognome</label>
      					<input class="form-control" type="text" placeholder="Cognome..." name="cognome" required>
    					</div>
  					</div>
 
  					<div class="row justify-content-center">
  					   <div class="col-10 form-group">
  					   		<label class="etichetta">Email</label>
      						<input class="form-control" type="email" placeholder="Email..." name="email" required>
   					   </div>
  					</div>
  					
  					<div class="row justify-content-center">
  					   <div class="col-10 form-group">
  					   		<label class="etichetta">Oggetto</label>
      						<input class="form-control" type="text" placeholder="Oggetto..." name="oggetto" required>
   					   </div>
  					</div>
  					
  					<div class="row justify-content-center">
  					   <div class="col-10 form-group">
  					   		<label class="etichetta">Messaggio</label>
      						<textarea class="form-control" rows="3" name="messaggio"  placeholder="Messaggio..." required></textarea>
   					   </div>
  					</div>

  				<div id="invia" class="row pb-5 justify-content-center">
   				    <button type="submit" class="bottoneInvio" id="bottone-invia" onClick="showPop()">Invia</button>   
  					</div>
  					
  					
  					</form>
  					
  					<div class="contenitore-delega" id="delega-pop-up">
		 <div id="blocco-delega" class="animazione-login">
		     <span class ="close-delegato" style="color: black"><i class=" fa fa-close" onclick="document.getElementById('delega-pop-up').style.display='none'"></i></span>
		    <p id="titolo-pop-up">Messaggio inviato</p>
		    <div >
		    <br>
		    <p id="pop-text">Il tuo messaggio è stato inviato.<br> Riceverai presto una risposta.</p>
		     </div>
	    </div> <!-- DOVREBBE SPARIRE DA SOLO DOPO UN PO MA NON LO FA
	    			IN PIU DOVREBBE SVUOTARSI IL FORM UNA VOLTA 
	    			CHE VIENE CLICCATO IL PULSANTE INVIA -->
		           
		 
 </div>
 	  	  				
   	</div>
   	
  	</div>	
      </div>
      
<script>
(function() {
	  'use strict';
	  window.addEventListener('load', function() {
	    // Fetch all the forms we want to apply custom Bootstrap validation styles to
	    var forms = document.getElementsByClassName('needs-validation');
	    // Loop over them and prevent submission
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	})();
	
	

function showPop(){

//$(".pop-up-delega").show();
document.getElementById('delega-pop-up').style.display='flex'
}
</script>
</body>
</html>