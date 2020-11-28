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
  grid-gap: 2px;
  background-color: grey;
  padding: 2px;
}

.grid-container > div {
  background-color: white;
  text-align: center;
  padding: 20px 0;
  font-size: 30px;
}


/*style sidebar*/
.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
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

<div class="item1">1</div>
  <div class="item2">2</div>
  <div class="item3">3</div>  
  <div class="item4">4</div>
  <div class="item5">5</div>
  <div class="item6">6</div>
  <div class="item7">7</div>
  <div class="item8">8</div>  
  <div class="item9">9</div>


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