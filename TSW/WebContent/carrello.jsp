<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList, bean.Composizione, bean.Prodotto, bean.Utente"%>
<%@page import="java.text.*" %>
<%
	ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
	ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="menu.js"></script>
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Carrello - Oltre il Giardino</title>
<style>

</style>
</head>
<body>

<%@include file = "navbar.jsp" %>
<div>
<p  class="titoloPagine"> Carrello </p>
</div>
<div class="container">
<div class="table-responsive-sm">
<%
	DecimalFormat df = new DecimalFormat("#,##0.00;(#,##0.00)");
	if(carrello.size()!=0){
%>
	  <table class="table">
	  <thead>
      <tr>
        <th id="">#</th>
        <th id="imgCol">Immagine</th>
        <th class="descrCol">Descrizione</th>
        <th id="">Prezzo</th>
        <th id="quantitaCol">Quantità</th>
         <th id="ivaCol">Iva</th>
         <th id="ivaCol">Sconto</th>
        <th id="rimCol"> Rimuovi </th>
        <th id="imgCol">Totale</th>
      </tr>
    </thead>
     <tbody>
      <tr>
      	<%
		double totale = 0, prezzo = 0;
		for (int i = 0; i < carrello.size(); i++) {
	    %>
      	 <td><%= i+1 %></td>
		 <td> 
		 	<h6 id="nomePicc"><%=prodottiCarrello.get(i).getNome()%></h6>
		 	<img src="<%=prodottiCarrello.get(i).getImmaginePath()%>" style="width: 70%;"></td>
			<td class="descrCol">
			<h3><%=prodottiCarrello.get(i).getNome()%></h3>
			<p><%=prodottiCarrello.get(i).getDescrizione()%></p>
			</td>
			<td> 
			<p> <%prezzo = prodottiCarrello.get(i).getPrezzo();
				df.format(prezzo);%> <%=prezzo %> &#8364</p>
			</td>	
					
			<td class = "modQ">
			<form action = "carrello" method="post">
					<input type="number" min="1" max="10" 
					value="<%=carrello.get(i).getQuantità() %>" name="quantita" id="q">
						<input type="hidden" name="idProd" value="<%=prodottiCarrello.get(i).getIdProdotto()%>">
						<button type="submit" name="azioneCarrello" value="modificaQuantita">
						<img src="https://img.icons8.com/small/16/000000/checkmark.png" alt="conferma"/></button>
						
			</form>
			</td>
			<td id="ivaCol">
			<p> <%=prodottiCarrello.get(i).getIva() %></p>
			<!-- iva -->
			</td >
			<!-- sconto -->
			
			<td id="ivaCol">
			<p><%=prodottiCarrello.get(i).getSconto() %> %</p>
			</td>
			<td class = "remove">
			<a onclick="deleteProdotto()" href="carrello?azioneCarrello=eliminaProdotto&idProdDelete=<%=prodottiCarrello.get(i).getIdProdotto()%>">
					<img src="images/cestino.png" id="cestino" alt="rimuovi"/>
			</a></td>
			<td>
			<div class="price">
						<%
							double costo = 0;
								if (prodottiCarrello.get(i).getSconto() != 0) {
									double percentuale = (prodottiCarrello.get(i).getPrezzo() * prodottiCarrello.get(i).getSconto())
											/ 100;
									costo = prodottiCarrello.get(i).getPrezzo() - percentuale;
									costo=costo+(costo*prodottiCarrello.get(i).getIva());
									costo=costo*carrello.get(i).getQuantità();
						%>
						
						<%
							} else {
						%>
						
						<%
							costo = prodottiCarrello.get(i).getPrezzo();
							costo=costo+(costo*prodottiCarrello.get(i).getIva());
							costo=costo*carrello.get(i).getQuantità();
								}
								totale=totale+costo;
						%>
						<p><%df.format(costo);%> <%=costo %> &#8364</p>
					</div>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
	</table>
	</div>
		<div class="totComplessivo2">
			<p id="scrittaTot">Totale Complessivo: 
			<%df.format(totale);%> <%=totale %> &#8364</p>
		
			<div class="botAcquisto">
				<a href="procediOrdine.jsp"><button class=" bottoni bottoni-colori " type="submit">Procedi all'acquisto</button></a>
			</div>
		</div>
	<%} else { %>
		<div>
		<p style="font-size: 28px;"> Non ci sono ancora prodotti <br> 
			Visualizza il catalogo e iniziare ad aggiungere prodotti al carrello! <img src="https://img.icons8.com/small/32/000000/add-shopping-cart.png"/></a>
		</p>
		
		
		</div>

	<% } %>
	</div>
<br>
<br>
<br>	
 
<script>
function deleteProdotto(){
  alert("Hai eliminato un prodotto dal carrello!");
  window.location.reload();
}
</script>
<%@include file = "footer.jsp" %>
</body>
</html>