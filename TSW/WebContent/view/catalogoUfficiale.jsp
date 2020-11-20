<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="menu.js"></script>
<link rel="stylesheet" type="text/css" href="../css/stilesito.css">
<title> Catalogo - Oltre il Giardino</title>
</head>
<body>
<%@ include file="navbar.jsp"%>
<div>
<p  class="titoloPagine"> Catalogo </p>
</div>

<div class="catalogo">
 <div style="display:block" id="menuSx">
 
 <div class="menuSx">
  <a class="icon-bar" onclick="w3_close()" style=" font-size: 18px"> 
  <img class="tre" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAABmJLR0QA/wD/AP+gvaeTAAAAaklEQVRIie3UsQmAQAxG4UOstdWRdAad9yztXObgWYlHGkW5aPG/BT4SQkJQSv0hoAXGL9AIJGD2RBfOVqD2QGOGbkAnVKitumO/RR4HNO6rvsB74aVxe+nlX2aGH5MnYHJBDT64okop2w4gjRheP8Dm7QAAAABJRU5ErkJggg=="/>
    <img class="due arrow-style" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAABmJLR0QA/wD/AP+gvaeTAAAAaklEQVRIie3UsQmAQAxG4UOstdWRdAad9yztXObgWYlHGkW5aPG/BT4SQkJQSv0hoAXGL9AIJGD2RBfOVqD2QGOGbkAnVKitumO/RR4HNO6rvsB74aVxe+nlX2aGH5MnYHJBDT64okop2w4gjRheP8Dm7QAAAABJRU5ErkJggg=="/>
    <img class="uno arrow-style" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAABmJLR0QA/wD/AP+gvaeTAAAAaklEQVRIie3UsQmAQAxG4UOstdWRdAad9yztXObgWYlHGkW5aPG/BT4SQkJQSv0hoAXGL9AIJGD2RBfOVqD2QGOGbkAnVKitumO/RR4HNO6rvsB74aVxe+nlX2aGH5MnYHJBDT64okop2w4gjRheP8Dm7QAAAABJRU5ErkJggg=="/>
   </a>
   <div class="">
	<h3 id="titSx"> CATEGORIE </h3>
	</div>
<div class=" categorie">
    		<ul class="sottoList">
    			<li><a class="sottoCateg" href=""><span></span>Nuovi Arrivi</a></li>
    			<li><a  class="sottoCateg" href=""><span></span>Scontati</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    		<p id="categ">OGGETTI DA GIARDINO</p>
    		<ul class="sottoList">    	
	        	<li><a  class="sottoCateg" href=""><span></span>Attrezzi da potatura</a></li>
	            <li><a class="sottoCateg"  href=""><span></span>Attrecci per l'irrigazione</a></li>
	            <li><a  class="sottoCateg" href=""><span></span>Vasi e fioriere</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    	 <p id="categ">OGGETTI DA AGRICOLTURA</p>
    		<ul class="sottoList">
	            <li><a  class="sottoCateg" href=""><span></span>Attrezzature agricole manuali</a></li>
	            <li><a class="sottoCateg"  href=""><span></span>Attrezzature agricole motorizzate</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    	   <p id="categ">OGGETTI PER LA CURA DELLE PIANTE</p>
    		<ul class="sottoList"> 
	            <li><a class="sottoCateg"  href=""><span></span>Concime</a></li>
	            <li><a class="sottoCateg"  href=""><span></span>Protezione delle piante</a></li>
        	</ul>
    	</div>
</div>
</div>


<div class="">
  <a><button class="icon-bar" style="display:none;"  id=prova onclick="w3_open()"> 
  <img class="uno" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAABmJLR0QA/wD/AP+gvaeTAAAAaUlEQVRIie3Vuw2AMBAEUZtWXAK9QF8gEopEUMEQOMABggT2kn0NjO7kT0pmFgHIwAhkdXSmWoFOFS7AzmWRTQ70wNbEpZPfxUMnd/yR5mB8KWTVjv4dLcAhfzKpn8Qkv7NNfJBGzezNCeLiIwNs96qWAAAAAElFTkSuQmCC"/>
    <img class="due arrow-style" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAABmJLR0QA/wD/AP+gvaeTAAAAaUlEQVRIie3Vuw2AMBAEUZtWXAK9QF8gEopEUMEQOMABggT2kn0NjO7kT0pmFgHIwAhkdXSmWoFOFS7AzmWRTQ70wNbEpZPfxUMnd/yR5mB8KWTVjv4dLcAhfzKpn8Qkv7NNfJBGzezNCeLiIwNs96qWAAAAAElFTkSuQmCC"/>
    <img class="tre arrow-style" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAABmJLR0QA/wD/AP+gvaeTAAAAaUlEQVRIie3Vuw2AMBAEUZtWXAK9QF8gEopEUMEQOMABggT2kn0NjO7kT0pmFgHIwAhkdXSmWoFOFS7AzmWRTQ70wNbEpZPfxUMnd/yR5mB8KWTVjv4dLcAhfzKpn8Qkv7NNfJBGzezNCeLiIwNs96qWAAAAAElFTkSuQmCC"/>
     </button> </a>
</div>

	
	<div id="grid"> <!-- Inizio Catalogo -->
	<div class="lista">
		<input type='hidden' id='current_page' /> 
		<input type='hidden' id='show_per_page' />
		
		<ul id="listaProdotti">
			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbice" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbice per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a href="visualizzaProdotto.jsp"><button id="prodBtn">Visualizza descrizione</button></a>
						<a href="carrello.jsp"> <button id="prodBtn" >Aggiungi al Carrello</button></a>
					</div>
				</div>
			</li>
			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.peragashop.com/pub/media/catalog/product/cache/5ea676a585d1025fff988e7c16910e8b/1/3/1348411_bb_00_fb.eps_1000.jpg" alt="troncarami" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Troncarami Forgiato</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a href="visualizzaProdotto.jsp"><button id="prodBtn">Visualizza descrizione</button></a>
						<a href="carrello.jsp"> <button id="prodBtn" >Aggiungi al Carrello</button></a>
					</div>
				</div>
			</li>
			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbici" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbici per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a href="visualizzaProdotto.jsp"><button id="prodBtn">Visualizza descrizione</button></a>
						<a href="carrello.jsp"> <button id="prodBtn" >Aggiungi al Carrello</button></a>
					</div>
				</div>
			</li>
			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbici" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbici per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a href="visualizzaProdotto.jsp"><button id="prodBtn">Visualizza descrizione</button></a>
						<a href="carrello.jsp"> <button id="prodBtn" >Aggiungi al Carrello</button></a>
					</div>
				</div>
			</li>
			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbici" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbici per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a href="visualizzaProdotto.jsp"><button id="prodBtn">Visualizza descrizione</button></a>
						<a href="carrello.jsp"> <button id="prodBtn" >Aggiungi al Carrello</button></a>
					</div>
				</div>
			</li>
			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbici" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbici per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a href="visualizzaProdotto.jsp"><button id="prodBtn">Visualizza descrizione</button></a>
						<a href="carrello.jsp"> <button id="prodBtn" >Aggiungi al Carrello</button></a>
					</div>
				</div>
			</li>
			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbici" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbici per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a class="showBioBtn" href="visualizzaProdotto.jsp">Show BIO</a>
					</div>
				</div>
			</li>

			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbici" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbici per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a class="showBioBtn" href="visualizzaProdotto.jsp">Show BIO</a>
					</div>
				</div>
			</li>
			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbici" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbici per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a class="showBioBtn" href="visualizzaProdotto.jsp">Show BIO</a>
					</div>
				</div>
			</li>
			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbici" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbici per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a class="showBioBtn" href="visualizzaProdotto.jsp">Show BIO</a>
					</div>
				</div>
			</li>
			<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbici" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbici per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a class="showBioBtn" href="visualizzaProdotto.jsp">Show BIO</a>
					</div>
				</div>
			</li>

		<li id="prod">
				<div class="prodotto">
					<div class="picture">
						<img id="img" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbici" border="0">
					</div>

					<div class="descrProd">
							<p id="titInfo">Forbici per erba</p>
							<p id="info"> Prezzo: 19,50 euro. </p> <!--  si prenderà dal database, idem il codice -->
							<p id="info">Codice: AAA598721</p>
					</div>

					<div class="vediInfo">
						<a class="showBioBtn" href="visualizzaProdotto.jsp">Show BIO</a>
					</div>
				</div>
			</li>

		</ul>
	</div>
	<div id='paginazione'></div>
</div>
</div>
<%@ include file="footer.jsp"%>
	<script>
function w3_open() {
  document.getElementById("menuSx").style.display = "block";
document.getElementById("prova").style.display = "none";
}

function w3_close() {
  document.getElementById("menuSx").style.display = "none";
  document.getElementById("prova").style.display = "block";
}
</script>

	<script type="text/javascript">
		jQuery(document).ready(function() {

							//Pagination JS
							//how much items per page to show
							var show_per_page = 6;
							//getting the amount of elements inside listaProdotti div
							var number_of_items = $('#listaProdotti').children().size();
							//calculate the number of pages we are going to have
							var number_of_pages = Math.ceil(number_of_items/ show_per_page);    //Math ceil serve ad arrotondare un numero

							//set the value of our hidden input fields
							$('#current_page').val(0);
							$('#show_per_page').val(show_per_page);

							//now when we got all we need for the navigation let's make it '

							/* 
							what are we going to have in the navigation?
								- link to previous page
								- links to specific pages
								- link to next page
							 */
							var navigation_html = '<a class="previous_link" href="javascript:previous();">Prev</a>';
							var current_link = 0;
							while (number_of_pages > current_link) {
								navigation_html += '<a class="page_link" href="javascript:go_to_page('
										+ current_link
										+ ')" longdesc="'
										+ current_link
										+ '">'
										+ (current_link + 1) + '</a>';
								current_link++;
							}
							navigation_html += '<a class="next_link" href="javascript:next();">Next</a>';

							$('#paginazione').html(navigation_html);

							//add active_page class to the first page link
							$('#paginazione .page_link:first').addClass(
									'active_page');

							//hide all the elements inside listaProdotti div
							$('#listaProdotti').children().css('display', 'none');

							//and show the first n (show_per_page) elements
							$('#listaProdotti').children().slice(0, show_per_page)
									.css('display', 'block');

						});

		//Pagination JS

		function previous() {

			new_page = parseInt($('#current_page').val()) - 1;
			//if there is an item before the current active link run the function
			if ($('.active_page').prev('.page_link').length == true) {
				go_to_page(new_page);
			}

		}

		function next() {
			new_page = parseInt($('#current_page').val()) + 1;
			//if there is an item after the current active link run the function
			if ($('.active_page').next('.page_link').length == true) {
				go_to_page(new_page);
			}

		}
		function go_to_page(page_num) {
			//get the number of items shown per page
			var show_per_page = parseInt($('#show_per_page').val());

			//get the element number where to start the slice from
			start_from = page_num * show_per_page;

			//get the element number where to end the slice
			end_on = start_from + show_per_page;

			//hide all children elements of listaProdotti div, get specific items and show them
			$('#listaProdotti').children().css('display', 'none').slice(start_from,
					end_on).css('display', 'block');

			/*get the page link that has longdesc attribute of the current page and add active_page class to it
			 and remove that class from previously active page link*/
			$('.page_link[longdesc=' + page_num + ']').addClass('active_page')
					.siblings('.active_page').removeClass('active_page');

			//update the current page input field
			$('#current_page').val(page_num);
		}
	</script>
	
</body>
</html>