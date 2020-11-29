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
	height: 440px;
	width: 380px;
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
.opBtn5 {
	margin: auto;
	width: 100%;
	color: ghostwhite;

}

.opBtn5 a {
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
  	<div class="ombra">
		 <img class="imgProdotto" src="https://www.verdemax.it/prodotti/catalogo/4224.jpg" alt="forbice">
		 <p class="nomeProdotto">FORBICE IN ALLUMINIO DA POTATURA </p>
		 <p class="nomeProdotto"> Prezzo: 26,70 euro  </p>
	</div>
		   	<div class="opBtn5">
				<a class=" bottoni bottoni-colori " >
				    <span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
		  	</div>
  			
  </div>
  
  <div class="item2">
		 <img class="imgProdotto" src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/P/R/PRSFC085PRO.jpg" alt="forbice">
		 <p class="nomeProdotto">FORBICE DA POTATURA </p>
		 <p class="nomeProdotto"> Prezzo: 17,50 euro  </p>
			<div class="opBtn5">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  </div>
  
  <div class="item3">
  		  <img class="imgProdotto" src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/P/R/PRPSEC.jpg" alt="forbice">
		  <p class="nomeProdotto">TASCA PORTA FORBICE </p>
		  <p class="nomeProdotto"> Prezzo: 5,20 euro  </p>
			 <div class="opBtn5">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  </div>  
  <div class="item4">
   		  <img class="imgProdotto" src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/p/r/prcbc75_new.jpg" alt="forbice">
		  <p class="nomeProdotto">TRONCARAMI A DEMOLTIPLICAZIONE</p>
		  <p class="nomeProdotto"> Prezzo: 55,20 euro  </p>
			 <div class="opBtn5">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  
  </div>
  <div class="item5">
  		    <img class="imgProdotto" src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/p/r/prcbt98_new.jpg" alt="forbice">
		  <p class="nomeProdotto">TRONCARAMI CON CONTROLAMA DENTATA</p>
		  <p class="nomeProdotto"> Prezzo: 65,10 euro  </p>
			 <div class="opBtn5">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  </div>
  <div class="item6">
  		  <img class="imgProdotto" src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/P/R/PRCH43.jpg" alt="forbice">
		  <p class="nomeProdotto">	CESOIA DA RIFINITURA</p>
		  <p class="nomeProdotto"> Prezzo: 27,90 euro  </p>
			 <div class="opBtn5">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  
  </div>
  <div class="item7">
  		  <img class="imgProdotto" src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/P/R/PRSC170.jpg" alt="forbice">
		  <p class="nomeProdotto"> SEGHETTO PIEGHEVOLE</p>
		  <p class="nomeProdotto"> Prezzo: 14,99 euro  </p>
			 <div class="opBtn5">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  </div>
  <div class="item8">
  		  <img class="imgProdotto" src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/P/R/PRSCE380.jpg" alt="forbice">
		  <p class="nomeProdotto">SEGA DA POTATURA</p>
		  <p class="nomeProdotto"> Prezzo: 22,00 euro  </p>
			 <div class="opBtn5">
				<a class=" bottoni bottoni-colori " >
					<span>Aggiungi al carrello  <img src="../images/icons8-add-shopping-cart-16.png"> </span>
				</a>	
			</div>
  </div>  
  <div class="item9">
  		  <img class="imgProdotto" src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/P/R/PRSERP28I.jpg" alt="forbice">
		  <p class="nomeProdotto"> RANCOLA </p>
		  <p class="nomeProdotto"> Prezzo: 16,40 euro  </p>
			 <div class="opBtn5">
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