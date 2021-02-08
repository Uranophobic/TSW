<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="bean.Utente"%>
<%@page import="java.util.ArrayList"%>
 <%@page import="bean.Ordine"%>
  <%@page import="java.util.Date"%>
  <%@page import="java.text.*"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title> Visualizza i tuoi ordini</title>

</head>
<body>
<%@ include file="navbar.jsp"%>
<div>
<p  class="titoloPagine"> Visualizza i tuoi ordini </p>

 </div>
<%
Utente utente= (Utente)request.getSession().getAttribute("utenteSessione");
System.out.println("sto prendendo la sessione dell'utente\n"+utente);
ArrayList<Ordine> ordini= (ArrayList<Ordine>)request.getSession().getAttribute("ordiniSessione");
System.out.println("sto prendendo la sessione degli ordini"+ordini);
%>
<div class="w3-container"> <!-- PER FARE STA COSA SUPER FAIGA ABBIAMO UTILIZZATO UNA TABBED NAVIGATION o NAVIGATION TABS (W3S) -->
 
  <div class="w3-bar w3-black">

  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Left')">Ordini in arrivo</button>
  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Right')">Ordini acquistati in precedenza</button>
  </div>
  <div style="margin-left:200px">

<%System.out.println("sono prima del for");
for(int i=0;i<ordini.size();i++){
	System.out.println("sono dentro il for");
	//System.out.println("tutti gli ordini utente jsp: "+ordini);		
	
	
	Date oggi = new Date(); // Data di oggi
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); // Qui decido il formato di visualizzazione
	String dataOggi = sdf.format( oggi );
	System.out.println("data di oggi: "+oggi);
	SimpleDateFormat format= new SimpleDateFormat("dd-MM-yyyy");
	String dataOrdine=ordini.get(i).getDataOrdine();
	Date data=format.parse(dataOrdine);
	System.out.println("la data dell'ordine: "+data);
	System.out.println("sono prima dell'if");
	if(oggi.compareTo(data)>0){
		
		System.out.println("sono appena entrato nell'if");
		System.out.println("data antecedente a oggi, ordine già ricevuto\n");
	}else{
		
		System.out.println("data posteriore a oggi, ordine ancora da ricevere\n");
	}
	%>


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
<%} %>
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







