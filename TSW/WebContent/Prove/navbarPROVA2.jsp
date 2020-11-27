<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/stilesito.css">

<title>NAVBAR PROVA 2</title>
	
<style> 
@media all and (max-width: 1690px)and (min-width : 990px) { 
	.iconaTxt {
	font-size: 18px;
	display: block;
	margin-left: 10px;
}

.size{
	margin-left: 5px;

}
}

@media all and (max-width: 991px) and (min-width: 768px) {
	.iconaTxt {
	font-size: 16px;
	display: block;
	margin-left: 10px;
}

.size{
	margin-left: 5px;

}

.barraRicerca {
	width: 80%;
	margin-left: 45px;
}

}
 
/*small devices*/
@media all and (max-width: 767px) and (min-width: 601px) {
.iconaTxt {
	font-size: 15px;
	display: block;
	margin-left: 3px;
}

.size{
	margin-left: 5px;

}

.iconNav {
margin-left: 5px;
	margin-right: 10px;
}

.logo {
	width: 220px;
}


.barraRicerca {
	width: 80%;
	margin-left: 30px;
}

.item {
	width: 20%;
}
}

 /*extra-small devices*/
@media all and (max-width: 600px) {
.iconaTxt {
	font-size: 14px;
	display: inline-block;
	margin-left: 3px;
}

.size{
	margin-left: 15px;

}
.iconNav {
	margin-left: 25px;
	margin-right: 10px;
	width: 90%;
	margin-top: 10px;
}
.logoNav {
	width: 100%;
	display: block;
}
.logo {
	width: 250px;
	margin-bottom: 15px;
	margin-top: 25px;
}

.barraRicercaNav {
	display: inline-block;
	width: 90%;
	margin: 5px;

}

.barraRicerca {
	width: 80%;
	margin-left: 50px;

}
.item {

	display: inline;

}
.bottoniNav {
	width: 90%;
	margin-top: 10px;
}
.iconeContenitore {

	margin-left: 35px;
}
}




</style>
	
</head>

<body>

<nav>
	<div class="contenutoNav">
	
		<ul class="listaNav">
			<li class="iconNav"> <!-- elemento che contiene le icone -->
				<div class="iconeContenitore">
				
				  	<!-- homepage -->
					<div class="icona" href="../view/HomePage2.jsp"> 
						<img  class="size" src="https://img.icons8.com/small/32/000000/home.png"/>
						 <a class="iconaTxt"> Homepage </a>
					</div>

					<!-- wish list -->  
					<div  class="icona" href="../view/wishlist2.jsp"> 
						<img class="size" src="https://img.icons8.com/small/32/000000/like.png"/> 
						<a class="iconaTxt"> Lista dei Desideri </a>
					</div>
		
					<!-- carrello -->
					<div class="icona" href="../view/carrello.jsp"> 
						<img class="size" src="https://img.icons8.com/small/32/000000/shopping-cart.png"/> 
						<a class="iconaTxt"> Carrello </a>
					</div>
				</div>
			 </li>
		
			<!-- logo -->
			<li class="logoNav"> 
				<div class= "logoContenitore">
					<a  href="">
				  		<img  class="logo" alt="logo.png" src="../logo/logo_small.png">
				  	</a> 
			  	</div>
			</li>
		 
		 	<!-- barra di ricerca -->
			<li class="barraRicercaNav">  
				<div class="barraRicerca">
					 <form class="navbar-form " action="/action_page.php">
					      <div class="input-group">
					        <input type="text" class="form-control" placeholder="Search" name="search">
					        <div class="input-group-btn">
					         <button class="btnRicerca" type="submit"><i class="fa fa-search"></i></button>
					        </div>
					      </div>
					    </form>
				 </div>
			</li>
			
			<!-- navbar verde -->
			<li class="navbarVerde"> 
						<div class="col-sm-4 col-md-4 col-lg-12">
							<ul class="bottoniNav">
							    <li class="item"> <a> <span> CATEGORIE </span> </a></li>
								<li class="item"> <a> <span> COME FUNZIONA </span> </a></li>
								<li class="item"> <a> <span> ASSISTENZA </span> </a></li>
								<li class="item"> <a> <span> CHI SIAMO </span> </a> </li>
							</ul>
						</div>
		</li>
		
	</ul>
</div>
</nav>





</body>
</html>