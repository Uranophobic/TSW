<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.util.ArrayList, bean.Prodotto, java.text.*, bean.Composizione"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title> Carrello - Oltre il Giardino</title>
<style>


</style>
</head>

<body>
<%@ include file="navbar.jsp"%>

<%ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
ArrayList<Prodotto> catalogo=(ArrayList<Prodotto>)request.getSession().getAttribute("catalogoSessione");
int quantita=(int) request.getSession().getAttribute("quantitaCarrello");



%>

<div>
<p  class="titoloPagine"> Carrello</p>
</div>
	
<form action="carrello" method="post">
<div class="container">                                                                                   
  <div class="table-responsive">
  <%if(prodottiCarrello.size()>0){ %>          
  <table class="table">
    <thead>
      <tr>
        <th id="numCol">#</th>
        <th id="imgCol">Immagine del prodotto</th>
        <th id="descrCol">Descrizione</th>
        <th id="priceCol">Prezzo</th>
        <th id="qntCol">Quantità</th>
        <th id="totCol">Totale</th>
      </tr>
    </thead>
    <tbody>
    <% for(int i=0; i<carrello.size();i++){    %>
    
      <tr>
        <td><%=i %></td>
        <td><img src="<%=prodottiCarrello.get(i).getImmaginePath() %>" style="width: 80%;"></td>
        <td> <p id="titDescr" ><%=prodottiCarrello.get(i).getNome() %></p>
        <p id="testoDescr"> <%=prodottiCarrello.get(i).getDescrizione() %>
         </p> </td>
        <td><%=prodottiCarrello.get(i).getPrezzo()%></td>
        <td>     
       Quantita: <input type="number" min="1" max="10" value="<%= carrello.get(i).getQuantità() %>" name="quantita" id="q">
				 <input type="hidden" name="idProd" value="<%= prodottiCarrello.get(i).getIdProdotto() %>">
        
        </td>
        <td> <button name="azioneCarrello" value="eliminaProdotto"> Elimina </button>
         <input type="hidden" name="idProd" value="<%= prodottiCarrello.get(i).getIdProdotto() %>">
        </td>
        <td> TOTALE </td>
      </tr>
     <%} %>
     
    </tbody>
  </table>
<%}else{%>
	<p> Non ci sono prodotti, registrati</p>
	<%} %>
  </div>
</div>
<div class= "riga1" class="hr"></div>
<div class="opBtn3">
		<a class=" bottoni bottoni-colori " >
		    <span class="">Indietro</span>
		</a>	
		
		<a href="procediOrdine.jsp" class=" bottoni bottoni-colori " >
		<button type="submit" name="azioneCarrello" value="modificaQuantita" >
		
		    <span class=""> Procedi all'ordine ></span>

		</button>
		</a>
		
  	</div>
	</form>	
 
<%@ include file="footer.jsp"%>
</body>
</html>
