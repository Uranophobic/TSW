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
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<meta charset="ISO-8859-1">
<title>navbar</title>

<style>

body{
	font-family: Dosis;
}

.navbar-expand-lg {
	-ms-flex-flow: row nowrap;
	flex-flow: row nowrap;
	-ms-flex-pack: start;
	justify-content: center;
}

 .nav-link{
	font-size: 18px;
	
}


.navbar-light .navbar-nav .nav-link {
	color: rgba(0,0,0,.7);
}

.navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover {
	font-size: 20px;
	color: rgba(0,0,0,1);
}

.titolo {
	font-size: 22px;
	font-weight: bold;
	position: absolute;
	/* right: 89%; */
	left: 1%;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #a6ec84;">

 <a class="titolo" style=" "> NATURAL SHOP</a>
 
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">COME FUNZIONA</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">VANTAGGI</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="#">CHI SIAMO</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">ASSISTENZA</a>
      </li>
    </ul> 
    
</nav>

</body>
</html>