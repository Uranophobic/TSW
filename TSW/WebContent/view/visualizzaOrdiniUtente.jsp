<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="../css/stilesito.css">
<title> Visualizza i tuoi ordini</title>

</head>
<body>
<%@ include file="navbar.jsp"%>
<div>
<p  class="titoloPagine"> Visualizza i tuoi ordini </p>

 </div>

<div class="w3-container"> <!-- PER FARE STA COSA SUPER FAIGA ABBIAMO UTILIZZATO UNA TABBED NAVIGATION o NAVIGATION TABS (W3S) -->
 
  <div class="w3-bar w3-black">

  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Left')">Ordini in arrivo</button>
  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Right')">Ordini acquistati in precedenza</button>
  </div>
  <div style="margin-left:200px">



  <div id="Left" class="w3-container city w3-animate-left" style="display:block">
    <h2>Slide in from left</h2>
    <p>Paris is the capital of France.</p> 
    <p>ESEMPIO</p>
    <p>ESEMPIO</p>
    <p>ESEMPIO</p>
    <p>ESEMPIO</p>
    <p>ESEMPIO</p>
  </div>

 

  <div id="Right" class="w3-container city w3-animate-right" style="display:none">
    <h2>Slide in from right</h2>
    <p>London is the capital city of England.</p>
   <p>ESEMPIO</p>
   <p>ESEMPIO</p>
   <p>ESEMPIO</p>
   <p>ESEMPIO</p>
   <p>ESEMPIO</p>
   <p>ESEMPIO</p>
  </div>

 

</div>
</div>

<%@ include file="footer.jsp"%>

		

<script>
function openLink(evt, animName) {
  var i, x;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" color: #a6ec84", "");
  }
  document.getElementById(animName).style.display = "block";
  evt.currentTarget.className += " color: #a6ec84";
}
</script>

</body>
</html>







