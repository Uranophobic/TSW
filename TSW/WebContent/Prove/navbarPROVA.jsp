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
<link rel="stylesheet" href="../css/stilesito.css">

<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"
  />
  
	<meta charset="UTF-8">
	<title>Agricolàrio - Navbar</title>
	
	<style> 
	

.row {
	margin-left: -10px;
	margin-right: -10px;
}



.navContenitore {
	height: 160px;
	background-color: ghostwhite;
	border-bottom: 1px solid #e8e8e8;
}





.barraRicerca {
	width: 100%;
	position: relative;
}

.input-group {
	/* width: 85%; */
	/* margin: 120px 20px 20px 50px; */
	margin-top: 100px;
	margin-left: 20px;
}


.btnRicerca {
	height: 38px;
	background-color: #ffffff;
	border: none;
	border-bottom-right-radius: 5px;
	border-top-right-radius: 5px;
	border: 2px solid #aced8c;

}

.form-control {
	color: #394a3c;
	border: 2px solid #a6ec84;
	border-right-color: white;
}

.fa {
	color: #394a3c;
}


#nav {
	width: 90%;
	position: absolute;
	top: 180px;
	/* left: 70px; */
	background-color: #a6ec84;
	border-radius: 5px;
	color: #394a3e;
	line-height: 30px;
}

.item {
	list-style-type: none;
	width: 100%;
	position: relative;
	float: left;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	padding: 6px;
	margin-left: 70px;
	margin-right: 70px;
}

.group-menu {
	vertical-align: top;
	width: 100%;
	display: inline-block;
	padding: 0;
	margin: auto;
}

#categMenu {
	font-size: 18px;
	font-weight: bold;
	background-color: #a6ec84;
	text-align: center;
	padding: 6px;
	border-radius: 5px;
}

.icone-gruppo {
	margin-top: 100px;
	width: auto;
	/* margin: auto; */
	/* margin-left: 65px; */
	margin-right: 50px;
}

#icona {
	text-decoration: none;
	font-size: 20px;
	color: #394a3c;
}

.primo {
	background: #CBFFC0ED;
	color: black;
	padding: 7px 15px;
	border: none;
	cursor: pointer;
	width: 20%;
	border-radius: 5px;
	font-weight: bold;
	border: 1px solid green;
	position: absolute; 
	right: 50px;
}

 .nav-link{
	font-size: 22px;
	
}





.titolo {
	font-size: 25px;
	font-weight: bold;
	position: absolute;
	left: 1%;
	margin-top: 16px;
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
<script type="text/javascript">
$( document ).ready( resizeNavBar() );

function resizeNavBar(){

	var width= $(window).width();
	console.log(width);
	if(width<=988){
		$("#logo").remove()
	}

$(window).resize(function(){
	var width= $(window).width();
	console.log(width);
	if(width<=988){
		
		
		$("#logo").hide()
		$("#logoResponsive").show()

	}else{
		
		$("#logo").show()
		
		
		$("#logoResponsive").hide()
		
		
	}
});
}

</script>
<body>

<nav class="navbar navbar-expand-lg navbar-light" id="navbar">


  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <a class="navbar-brand " href="showHome" id="logoResponsive" style="display:none;">
  	<img alt="" src="../logo/PICCOLO.png" width="100" height="75" class="d-inline-block align-top">
  </a>
  <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
  <div  class="navbar" >
  
   <div id="icone" class="icone-gruppo align-baseline icon-bar-vertical">
  	<!-- homepage -->
	<a id="icona" href="../view/HomePage2.jsp"> 
	<img src="https://img.icons8.com/small/32/000000/home.png"/> Homepage
	</a>
	
	
	<!-- wish list -->  
	<a id="icona" href="../view/WishList.jsp"> 
	<img src="https://img.icons8.com/small/32/000000/like.png"/> Lista dei Desideri
	</a>
	
	
	
	<!-- carrello -->
	<a id="icona" href="../view/carrello.jsp"> 
	<img src="https://img.icons8.com/small/32/000000/shopping-cart.png"/> Carrello
	</a>
	</div>
	
	<div class= "col-sm-3 col-md-4 col-lg-3">
	<a class="logo navbar-brand mr-5" href="showHome" id="logo">
  	<img  class="d-inline-block align-top" alt="logo.png" src="../logo/logo_small.png" width="290" >
  	</a> </div>

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
	

	</div>
	  <div id="nav" class="col-sm-24">
<div class="row">
 	<div class="col-sm-8 col-md-4 col-lg-9 ">
					<ul class="navbar-nav ">
					<li class="nav-item active mr-5  dropdown    "> <a class=""> <span> CATEGORIE </span> </a></li>
						<li class="nav-item active mr-5  dropdown    "> <a class=""> <span> COME FUNZIONA </span> </a></li>
						<li class="nav-item active mr-5  navbar-element" > <a class=""> <span> ASSISTENZA </span> </a></li>
						<li class="nav-item active mr-5 " ><a class=""> <span> CHI SIAMO </span> </a> </li>
					</ul>
     </div>

</div>
   
</div>	
		
</div>
</nav>
	
	







</body>
</html>