<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Modifica Prodotto</title>
<style>
.boxModifica {
	width: 70%;
	height: 580px;
	border: 1px solid rgba(40, 150, 5, 0.2);
	border-radius: 5px;
	display: inline-block;
	/* grid-template-columns: 35% 35% 35%; */
	margin: auto;
	margin-left: 220px;
}

.prova2 {
	width: 80%;
	margin: auto;
}

#inputData2 {
	float: left;
	margin-left: 25px;
	margin-top: 15px;
	/* margin-bottom: -1px; */
	font-size: 18px;
}




/*********** grandezze monitor per il responsive ***********/
/*GRANDEZZE large, medium, small, extra-large e extra-small*/
@media all and (max-width: 1690px)and (min-width : 990px) {
}

@media all and (max-width: 991px) and (min-width: 768px) {
}

/*small devices*/
@media all and (max-width: 767px) and (min-width: 601px) {
}

/*extra-small devices*/
@media all and (max-width: 600px) {
.boxModifica {
	width: 90%;
	height: 580px;
	margin-left: 30px;
}
}






</style>
</head>
<body>
<%@include file = "navbar.jsp" %>


<div>
		<p class="titoloPagine">Modifica Prodotto</p>
	</div>



<form action="amministratore" method="post" >
<div id="area-profilo">
	<!-- primo quadrante -->
		<div class="boxModifica">
					<div class="prova2">
					<label id="inputData2"> Immagine</label><input type="text" name="immagine"  class="inputProfilo"  placeholder="Path Immagine" required >
					<label id="inputData2"> Nome</label><input type="text" name="nome" class="inputProfilo"  placeholder="Nome" required> 
					<label id="inputData2"> Descrizione</label><input type="text" name="descrizione" class="inputProfilo"  placeholder="Descrizione" required>
					<label id="inputData2"> Categoria</label><input type="text" name="categoria"  class="inputProfilo"  placeholder="Categoria" required >
					<label id="inputData2"> Prezzo</label><input type="text" name="prezzo"  class="inputProfilo"  placeholder="Prezzo" required> 
					<label id="inputData2"> Iva</label><input type="text" name="iva"  class="inputProfilo"  placeholder="Iva" required> 
					<label id="inputData2"> Sconto</label><input type="text" name="sconto"  class="inputProfilo"  placeholder="Sconto" required >  
			</div>
			
		</div>
		
	</div>
	<div class="botModDati">
		<button  name="azioneCapo" class="bottoni bottoni-colori" value="modificaProd">Conferma</button>
	</div>
	

</form>
<%@include file = "footer.jsp" %>
</body>
</html>