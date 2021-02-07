<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList, bean.Composizione, bean.Prodotto, bean.Utente"%>
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
<title>Visualizza Carrello</title>
<style>
.containerCarrello {
	width: 70%;
	height: auto;
	text-align: center;
	border: 1px solid rgba(40, 150, 5, 0.2);
	border-radius: 5px;
	margin-top: 15px;
	margin: auto;
}
.table{
	width: 90%;
	margin-bottom: 1rem;
	color: #212529;
	margin: auto;
}
.totComplessivo {
	/* float: right; */
	width: 13%;
	margin: auto;
}

.tot{
	font-size: 18px;
}

.botAcquisto {
	position: relative;
	margin: auto;
	width: 17%;
}
</style>
</head>
<body>

<%@include file = "navbar.jsp" %>
<br>

<div class="containerCarrello">
<%
	if(carrello.size()!=0){
		
	
%>
	  <table class="table">
	  <thead>
      <tr>
        <th id="numCol">#</th>
        <th id="imgCol">Immagine del prodotto</th>
        <th id="descrCol">Descrizione</th>
        <th id="priceCol">Prezzo</th>
        <th id="qntCol">Quantità</th>
        <th id="elimina"> Rimuovi </th>
        <th id="totCol">Totale</th>
      </tr>
    </thead>
     <tbody>
      <tr>
      	<%
		double totale = 0;
		for (int i = 0; i < carrello.size(); i++) {
	    %>
      	 <td><%= i+1 %></td>
		 <td> <img src="<%=prodottiCarrello.get(i).getImmaginePath()%>" style="width: 80%;"></td>
			<td class="descrizione">
			<h3><%=prodottiCarrello.get(i).getNome()%></h3>
			<p><%=prodottiCarrello.get(i).getDescrizione()%></p>
			</td>
			<td> 
			<div class="price">
						<%
							double costo = 0;
								if (prodottiCarrello.get(i).getSconto() != 0) {
									double percentuale = (prodottiCarrello.get(i).getPrezzo() * prodottiCarrello.get(i).getSconto())
											/ 100;
									costo = prodottiCarrello.get(i).getPrezzo() - percentuale;
						%>
						<%=prodottiCarrello.get(i).getPrezzo()%>
						<%
							} else {
						%>
						<p>&#8364 <%=prodottiCarrello.get(i).getPrezzo()%></p>
						<%
							costo = prodottiCarrello.get(i).getPrezzo();
								}
								totale += carrello.get(i).getQuantità() * costo;
						%>
					</div>
			</td>	
					
			<td class = "modQ">
			<form action = "carrello" method="post">
					Quantit&agrave: <input type="number" min="1" max="10" 
					value="<%=carrello.get(i).getQuantità() %>" name="quantita" id="q">
						<input type="hidden" name="idProd" value="<%=prodottiCarrello.get(i).getIdProdotto()%>">
						<button type="submit" name="azioneCarrello" value="modificaQuantita">
						<img src="images/check-icon.png" alt="conferma"/></button>
			</form>
			</td>
			<td class = "remove">
			<a href="carrello?azioneCarrello=eliminaProdotto&idProdDelete=<%=prodottiCarrello.get(i).getIdProdotto()%>">
					<img src="images/cestino.png" style="width: 40%"alt="rimuovi"/>
			</a></td>
			<td>
			TOTALE
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
	</table>
	 </div>
	<div>
		<div class="totComplessivo">
		<p class="tot">Totale Complessivo: <%=totale%></p>
		</div>
		
	<div class="botAcquisto">
		<a href="procediOrdine.jsp">
			<button class=" bottoni bottoni-colori " type="submit" id="ac">Procedi all'acquisto</button>
		</a>
		</div>
	</div>
	<%} else { %>
		<div>
		<p> Non ci sono prodotti nel carrello.</p>
		</div>
	<% } %>
<br>
<br>
<br>	
<%@include file = "footer.jsp" %>
</body>
</html>