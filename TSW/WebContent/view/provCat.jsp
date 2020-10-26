<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/stilesito.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="menu.js"></script>

<title>Insert title here</title>
<style>
.menuSx {
	/* float: left; */
	background: #fff;
	width: 300px;
	height: 1300px;
	border-right: 1px solid #eee;
	/* position: absolute; */
}

#titSx {
	font-family: 'treeftrregular';
	font-size: 48px;
	color: #626262;
	font-weight: bold;
	text-align: center;
	padding: 15px;
}
.categorie ul{
	margin-right: 10px;
	font-size: 22px; 
	color: #262626;
}

.sottoCateg {
	color: #262626;
	text-decoration: none;
	background-color: transparent;
}

.sottoCateg:hover{
	color: black;
	text-decoration: none;
}

#categ {
	font-family: 'treeftrregular';
	font-weight: bold;
	font-size: 35px;
	color: #5ba835;
	text-align: center;
	width: 70%;
	margin: auto;
}
</style>
</head>
<body>
<%@ include file="navbar.jsp"%>
<div>
<p  class="titoloPagine"> CATALOGO </p>
</div>
<div class="menuSx">
	<h3 id="titSx"> CATEGORIE </h3>

<div class=" categorie">
    		<ul>
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



<%@ include file="footer.jsp"%>
</body>
</html>