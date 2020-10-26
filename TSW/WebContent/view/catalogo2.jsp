<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="menu.js"></script>
<link rel="stylesheet" type="text/css" href="../css/stilesito.css">
<title>Catalogo - Natural Shop</title>
<style>
body{
  overflow-x:hidden; 
}


*{
	    font-family: "Dosis";	
}

@font-face{
	font-family: "Dosis";
	src: url("../font/Dosis/AnyConv.com__Dosis-Regular.otf");
}

.titoloPagine { /*TITOLO DI TUTTE LE PAGINE*/
	margin: auto;
	font-size: 55px;
	color: black;
	margin:auto;
	text-align: center;
	
}

#wrapper {
	overflow: hidden;
	height: 1000px;
	width: 100%;
	background: #fff;
}
#grid-selector {
	height: 10px;
	width: 250px;
	padding: 40px 0 40px 30px;
	float: left;
	color: #262626;;
	font-size: 14px;
	font-weight: 700;
	position: relative;
	/* top: -20px; */
}
#targhetta{
font-size: 24px;
width: 30%;
}
#grid-menu {
	float: right;
	width: 60px;
	/* bottom: ; */
	position: absolute;
	height: 30px;
	top: 45px;
	right: 90px;
	/* left: 100px; */
}

#grid-menu ul {
	width: 100px;
	/* float: right; */
	position: relative;
	top: px;
}
  
#grid-menu li{	 
	 float:right;
	 width:25px;
	 height:25px;
	 list-style:none;
}
#grid-menu li a{	 
  	 display:block;
	 width:25px;	
	 height:25px;
	 background: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/grid-menu.png") 0 0  no-repeat;
}
#grid-menu li.smallGrid{margin-right:7px;}
#grid-menu li.smallGrid a{background-position:0 -33px;}
#grid-menu li.largeGrid a{background-position:-37px 0;}

#grid-menu li.smallGrid a.active{background-position:0 0;}
#grid-menu li.largeGrid a.active{background-position:-37px -33px;}

#sidebar {
	/* float: left; */
	background: #fff;
	width: 300px;
	padding: 13px 0 0 30px;
	height: 1400px;
	border-right: 1px solid #eee;
	/* position: absolute; */
}
#sidebar h3 {
	color: #262626;
	text-transform: uppercase;
	font-size: 30px;
	font-weight: 700;
	padding: 30px 0 5px 0;
	letter-spacing: 1px;
	clear: both;
	/* margin-right: ; */
}
#sidebar img{margin-top:6px;}
#sidebar .checklist{
	padding:0;
}

#cart{padding:0px;}

#cart .empty{
	font-style:italic;
	color:#a0a3ab;
	font-size:18px;
	letter-spacing:1px;	
}

.cart-icon-top {
	position: absolute;
	background: #fff url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/cart.png") 0 -3px no-repeat;
	margin: 0;
	width: 21px;
	height: 3px;
	z-index: 1;
	top: 267px;
	left: 200px;
}

.cart-icon-bottom {
	position: absolute;
	background: #fff url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/cart.png") 0 -3px no-repeat;
	margin: 0;
	width: 21px;
	height: 19px;
	z-index: 1;
	top: 270px;
	left: 200px;
}
#checkout {
	position: absolute;
	top: 170px;
	left: 181px;
	display: none;
	width: 100px;
	height: 35px;
}

#checkoutBtn {
	border: 2px solid #a6ec84;
	font-size: 18px;
	font-weight: bold;
	padding: 1px 7px;
	color: #a6ec84;
	background-color: #fff;
}


.categorie ul{
	margin-right: 10px;
	font-size: 22px; 
	color: #262626;
}

.categorie a {
	color: #262626;
	text-decoration: none;
	background-color: transparent;
}

.categorie a:hover{
	color: black;
	text-decoration: none;
}

#categ {
	font-weight: bold;
	font-size: 25px;
	color: #5ba835;
}


#grid {
	width: 1030px;
	position: absolute;
	left: 315px;
	height: auto;
	top: 150px;
}

.product {
	position: relative;
	width: 300px;
	height: 400px;
	float: left;
	margin-right: 25px;
	border: 1px solid black;
	margin-bottom: 20px;
}

.lista ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

.lista ul li {
	display: inline-block;
	width: 300px;
	float: left;
	margin-right: 15px;
	margin-bottom: 15px;
}

.prodotto {
	border: 1px solid #ddd;
	color: #333;
	margin-bottom: 20px;
	position: relative;
	padding-bottom: 20px;
	background-color: #f5f5f5;
}

.prodotto .picture {
	padding: 15px 0;
	background-color: #fff;
	text-align: center;
}

#img {
	/* border: 3px solid #f8f8f8; */
	-webkit-border-radius: 50%;
	border-radius: 40%;
	transition: all 0.3s ease 0s;
	margin: 0 auto;
	height: 260px;
	width: 260px;
}

.descrProd {
	padding: 10px;
	text-align: center;
	border-top: 1px solid #eee;
	
}


#titInfo{
font-size: 28px;
font-weight: bold;
}

#info {
	font-size: 22px;
	margin: 10px;
	line-height: 22px;
}

.vediInfo {
	position: absolute;
	right: 0;
	bottom: 3px;
}

.physicianModal {
	text-align: center;
}

.physicianModal .picture img {
	border: 6px solid #f8f8f8;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	transition: all 0.3s ease 0s;
	margin: 0 auto;
	height: 180px;
	width: 180px;
}

.physicianModal .info p, .physicianModal .info  {
	margin: 0;
}

.showBioBtn {
	background-color: #337ab7;
	padding: 5px 10px;
	color: #fff;
	font-size: 12px;
}

/*Pagination CSS*/
#page_navigation {
	clear: both;
	margin: 20px 0;
}

#page_navigation a {
	padding: 3px 6px;
	border: 1px solid #2e6da4;
	margin: 2px;
	color: black;
	text-decoration: none
}

.active_page {
	background: #337ab7;
	color: white !important;
}
#grid {
	width: 1030px;
	position: absolute;
	left: 315px;
	height: auto;
	top: 150px;
}
</style>
</head>
<body>
<%@ include file="navbar.jsp"%>
<div>
<p  class="titoloPagine"> Catalogo Prodotti </p>
</div>

<div id="wrapper">
		<div id="grid-selector" >
			<div id="targhetta" >
				<p>GRIGLIA</p>
			</div>
       		<div id="grid-menu">
           		<ul>           	   
               		<li class="largeGrid"><a href=""></a></li>
               		<li class="smallGrid"><a class="active" href=""></a></li>
           		</ul>
       		</div>
		</div>
	
	
	<div id="sidebar"> <!-- Barra verticale che è sulla sinistra -->
    		<h3>CATEGORIE</h3>
    	<div class=" categorie">
    		<ul>
    			<li><a href=""><span></span>Nuovi Arrivi</a></li>
    			<li><a href=""><span></span>Scontati</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    		<p id="categ">OGGETTI DA GIARDINO</p>
    		<ul>    	
	        	<li><a href=""><span></span>Attrezzi da potatura</a></li>
	            <li><a href=""><span></span>Attrecci per l'irrigazione</a></li>
	            <li><a href=""><span></span>Vasi e fioriere</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    	 <p id="categ">OGGETTI DA AGRICOLTURA</p>
    		<ul>
	            <li><a href=""><span></span>Attrezzature agricole manuali</a></li>
	            <li><a href=""><span></span>Attrezzature agricole motorizzate</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    	   <p id="categ">OGGETTI PER LA CURA DELLE PIANTE</p>
    		<ul> 
	            <li><a href=""><span></span>Concime</a></li>
	            <li><a href=""><span></span>Protezione delle piante</a></li>
        	</ul>
    	</div>
	</div>

		<div id="grid"> <!-- Inizio Catalogo -->
		
	<div class="lista">
		<input type='hidden' id='current_page' /> <input type='hidden'
			id='show_per_page' />
		<ul id="pagingBox">
			<li>
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
						<a class="showBioBtn" href="javascript:void(0)">Show BIO</a>
					</div>
				</div>
			</li>
<li>
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
						<a class="showBioBtn" href="javascript:void(0)">Show BIO</a>
					</div>
				</div>
			</li>
			<li>
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
						<a class="showBioBtn" href="javascript:void(0)">Show BIO</a>
					</div>
				</div>
			</li>
			<li>
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
						<a class="showBioBtn" href="javascript:void(0)">Show BIO</a>
					</div>
				</div>
			</li>
			<li>
		

		</ul>
	</div>
	
</div>
</div>

	<div id='page_navigation'></div>
<!-- questo è lo script della paginazione che però al momennto non mi funziona -->
	<script type="text/javascript">
	jQuery(document).ready(function () {

		//Pagination JS
		//how much items per page to show
		var show_per_page = 4; 
		//getting the amount of elements inside pagingBox div
		var number_of_items = $('#pagingBox').children().size();
		//calculate the number of pages we are going to have
		var number_of_pages = Math.ceil(number_of_items/show_per_page);
		
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
		while(number_of_pages > current_link){
			navigation_html += '<a class="page_link" href="javascript:go_to_page(' + current_link +')" longdesc="' + current_link +'">'+ (current_link + 1) +'</a>';
			current_link++;
		}
		navigation_html += '<a class="next_link" href="javascript:next();">Next</a>';
		
		$('#page_navigation').html(navigation_html);
		
		//add active_page class to the first page link
		$('#page_navigation .page_link:first').addClass('active_page');
		
		//hide all the elements inside pagingBox div
		$('#pagingBox').children().css('display', 'none');
		
		//and show the first n (show_per_page) elements
		$('#pagingBox').children().slice(0, show_per_page).css('display', 'block');
	
});



//Pagination JS

function previous(){
	
	new_page = parseInt($('#current_page').val()) - 1;
	//if there is an item before the current active link run the function
	if($('.active_page').prev('.page_link').length==true){
		go_to_page(new_page);
	}
	
}

function next(){
	new_page = parseInt($('#current_page').val()) + 1;
	//if there is an item after the current active link run the function
	if($('.active_page').next('.page_link').length==true){
		go_to_page(new_page);
	}
	
}
function go_to_page(page_num){
	//get the number of items shown per page
	var show_per_page = parseInt($('#show_per_page').val());
	
	//get the element number where to start the slice from
	start_from = page_num * show_per_page;
	
	//get the element number where to end the slice
	end_on = start_from + show_per_page;
	
	//hide all children elements of pagingBox div, get specific items and show them
	$('#pagingBox').children().css('display', 'none').slice(start_from, end_on).css('display', 'block');
	
	/*get the page link that has longdesc attribute of the current page and add active_page class to it
	and remove that class from previously active page link*/
	$('.page_link[longdesc=' + page_num +']').addClass('active_page').siblings('.active_page').removeClass('active_page');
	
	//update the current page input field
	$('#current_page').val(page_num);
}
	</script>


















</body>
</html>