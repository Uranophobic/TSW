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
<style>
.grid-container {
	display: grid;
	grid-template-columns: auto auto auto;
	grid-gap: 10px;
	padding: 2px;
	margin-left: 40px;
	margin-right: 10px;
}

.grid-container > div {
	background-color: white;
	text-align: center;
	padding: 20px 0;
	font-size: 30px;
	height: 480px;
	width: 350px;
	border: 1px solid #d2d2d2;
	border-radius: 5px;
}

/*
.ombra:hover{
	background: grey;
	opacity: 0.9;

}*/

.imgProdotto{
	width: 280px;
	height: 280px;
}

.nomeProdotto {
	font-size: 20px;
	margin-bottom: 0;
}
.bottoneAddCarrello {
	margin: auto;
	width: 100%;
	color: ghostwhite;
	margin-top: 5px;
}

.bottoneAddCarrello a {
	font-size: 15px;

}
/*style sidebar*/
.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #394a3c;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}


.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}













/**********************da qui *************************/
.hovereffect {
	width: 100%;
	/* float: left; */
	overflow: hidden;
	position: relative;
	text-align: center;
	cursor: default;
}

.hovereffect .overlay {
	position: absolute;
	overflow: hidden;
	width: 100%;
	height: 250px;
	/* left: 10%; */
	top: 10%;
	border-bottom: 1px solid #FFF;
	border-top: 1px solid #FFF;
	-webkit-transition: opacity 0.50s, -webkit-transform 0.5s;
	transition: opacity 0.50s, transform 0.50s;
	-webkit-transform: scale(0,1);
	-ms-transform: scale(0,1);
	transform: scale(0,1);
}
.hovereffect:hover .overlay {
  opacity: 1;
  filter: alpha(opacity=100);
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  transform: scale(1);
}

.hovereffect img {
  display: block;
  position: relative;
  -webkit-transition: all 0.35s;
  transition: all 0.35s;
}

.hovereffect:hover img {
  filter: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg"><filter id="filter"><feComponentTransfer color-interpolation-filters="sRGB"><feFuncR type="linear" slope="0.6" /><feFuncG type="linear" slope="0.6" /><feFuncB type="linear" slope="0.6" /></feComponentTransfer></filter></svg>#filter');
  filter: brightness(0.6);
  -webkit-filter: brightness(0.6);
}

.hovereffect h2 {
  text-transform: uppercase;
  text-align: center;
  position: relative;
  font-size: 17px;
  background-color: transparent;
  color: #FFF;
  padding: 1em 0;
  opacity: 0;
  filter: alpha(opacity=0);
  -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
  transition: opacity 0.35s, transform 0.35s;
  -webkit-transform: translate3d(0,-100%,0);
  transform: translate3d(0,-100%,0);
}

.hovereffect a, .hovereffect p {
	color: #FFF;
	padding: 1em 0;
	opacity: 0;
	filter: alpha(opacity=0);
	-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
	transition: opacity 0.35s, transform 0.35s;
	-webkit-transform: translate3d(0,100%,0);
	transform: translate3d(0,100%,0);
	width: 100%;
	font-size: 18px;
}

.hovereffect:hover a, .hovereffect:hover p, .hovereffect:hover h2 {
  opacity: 1;
  filter: alpha(opacity=100);
  -webkit-transform: translate3d(0,0,0);
  transform: translate3d(0,0,0);
}

.imgProdotto{

width: 350px;
height:300px;
}

.addWishlist {
	display: flex;
	margin: auto;
	width: 50%;
}

#scopri {
	width: 50%;
	margin-top: 110px;
	font-size: 18px;
}

</style>
</head>
<body>
<%@ include file="navbar.jsp"%>

<div>
<p  class="titoloPagine"> Catalogo </p>
</div>






<div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; CATEGORIE</span>

<div class="grid-container">

    <div class="item1"> <!-- prodotto 1  -->
    <div class="hovereffect">
		 <img class="imgProdotto" src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/P/R/PRSFC085PRO.jpg" alt="forbice">
            <div class="overlay">
				<button id="scopri" class="  bottoni bottoni-colori"> Scopri di più</button>
            </div>
    </div>
		<div class="prova">
		<div class="addWishlist"><img class="size" src="https://img.icons8.com/small/20/000000/like.png"/> <a style="font-size: 16px;">  Aggiungi alla tua wishlist </a></div>
		 <p class="nomeProdotto"> FORBICE DA POTATURA  </p>
		 <p class="nomeProdotto"> Prezzo: 17,50 euro   </p>
		 </div>
			<div class="bottoneAddCarrello">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
		  
  			
  </div>
  
  
    <div class="item2"> <!-- prodotto 2  -->
    <div class="hovereffect">
		 <img class="imgProdotto" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbice">
            <div class="overlay">
				<button  id="scopri" class="  bottoni bottoni-colori"> Scopri di più</button>
            </div>
    </div>
		<div class="prova">
		<div class="addWishlist"><img class="size" src="https://img.icons8.com/small/20/000000/like.png"/> <a style="font-size: 16px;">  Aggiungi alla tua wishlist </a></div>
		 <p class="nomeProdotto">FORBICE IN ALLUMINIO DA POTATURA   </p>
		 <p class="nomeProdotto"> Prezzo: 26,70 euro  </p>
		 </div>
			<div class="bottoneAddCarrello">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
		  
  			
  </div>
  
  
  
    <div class="item3"> <!-- prodotto 3  -->
    <div class="hovereffect">
		 <img class="imgProdotto"  src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/P/R/PRPSEC.jpg" alt="forbice">
            <div class="overlay">
				<button  id="scopri" class="  bottoni bottoni-colori"> Scopri di più</button>
            </div>
    </div>
		<div class="prova">
		<div class="addWishlist"><img class="size" src="https://img.icons8.com/small/20/000000/like.png"/> <a style="font-size: 16px;">  Aggiungi alla tua wishlist </a></div>
		 <p class="nomeProdotto">TASCA PORTA FORBICE  </p>
		 <p class="nomeProdotto"> Prezzo: 5,20 euro   </p>
		 </div>
			<div class="bottoneAddCarrello">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  </div>
  
      <div class="item4"> <!-- prodotto 4  -->
    <div class="hovereffect">
		 <img class="imgProdotto" src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/p/r/prcbc75_new.jpg" alt="forbice">
            <div class="overlay">
				<button id="scopri" class="  bottoni bottoni-colori"> Scopri di più</button>
            </div>
    </div>
		<div class="prova">
		<div class="addWishlist"><img class="size" src="https://img.icons8.com/small/20/000000/like.png"/> <a style="font-size: 16px;">  Aggiungi alla tua wishlist </a></div>
		 <p class="nomeProdotto">TRONCARAMI A DEMOLTIPLICAZIONE </p>
		 <p class="nomeProdotto"> Prezzo: 55,20 euro    </p>
		 </div>
			<div class="bottoneAddCarrello">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  </div>
  
   <div class="item5"> <!-- prodotto 5  -->
    <div class="hovereffect">
		 <img class="imgProdotto"  src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/p/r/prcbt98_new.jpg" alt="forbice">
            <div class="overlay">
				<button id="scopri" class="  bottoni bottoni-colori"> Scopri di più</button>
            </div>
    </div>
		<div class="prova">
		<div class="addWishlist"><img class="size" src="https://img.icons8.com/small/20/000000/like.png"/> <a style="font-size: 16px;">  Aggiungi alla tua wishlist </a></div>
		 <p class="nomeProdotto">TRONCARAMI CON CONTROLAMA DENTATA </p>
		 <p class="nomeProdotto"> Prezzo: 65,10 euro  </p>
		 </div>
			<div class="bottoneAddCarrello">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  </div>
  
   <div class="item6"> <!-- prodotto 6 -->
    <div class="hovereffect">
		 <img class="imgProdotto"  src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/P/R/PRCH43.jpg" alt="forbice">
            <div class="overlay">
				<button id="scopri" class="  bottoni bottoni-colori"> Scopri di più</button>
            </div>
    </div>
		<div class="prova">
		<div class="addWishlist"><img class="size" src="https://img.icons8.com/small/20/000000/like.png"/> <a style="font-size: 16px;">  Aggiungi alla tua wishlist </a></div>
		 <p class="nomeProdotto">CESOIA DA RIFINITURA </p>
		 <p class="nomeProdotto"> Prezzo: 27,90 euro  </p>
		 </div>
			<div class="bottoneAddCarrello">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  </div>
  
  
  
  
  
  
  
  
</div>

</div>



<!-- sidebar -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  
  
 <div class="menuSx">




<div class=" categorie">
	<h3 id="titSx"> Categorie </h3>
    		<ul class="sottoList">
    			<li><a class="sottoCateg" href="">Nuovi Arrivi</a></li>
    			<li><a  class="sottoCateg" href="">Scontati</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    		<p id="categ">Giardinaggio</p>
    		<ul class="sottoList">    	
	        	<li><a  class="sottoCateg" href="">Attrezzi da potatura</a></li>
	            <li><a class="sottoCateg"  href="">Attrecci per l'irrigazione</a></li>
	            <li><a  class="sottoCateg" href="">Vasi e fioriere</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    	 <p id="categ">Agricoltura</p>
    		<ul class="sottoList">
	            <li><a  class="sottoCateg" href="">Attrezzature agricole manuali</a></li>
	            <li><a class="sottoCateg"  href="">Attrezzature agricole motorizzate</a></li>
        	</ul>
    	</div>
    	<div class=" categorie">
    	   <p id="categ">Cura delle piante</p>
    		<ul class="sottoList"> 
	            <li><a class="sottoCateg"  href="">Concime</a></li>
	            <li><a class="sottoCateg"  href="">Protezione delle piante</a></li>
        	</ul>
    	</div>
</div>
</div>



<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "325px";
  document.getElementById("main").style.marginLeft = "325px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}
</script>




<%@ include file="footer.jsp"%>


	
</body>
</html>