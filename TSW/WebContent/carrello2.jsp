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
</head>
<body>

<%@include file = "navbar.jsp" %>
<br>
	<%
		double totale = 0;
		for (int i = 0; i < carrello.size(); i++) {
	%>
	<table>
		<tr>
			<td class="foto">
				<figure class="product-figure">
					<div class="images">
						<img src="<%=prodottiCarrello.get(i).getImmaginePath()%>"
							alt="images-product" />
					</div>
				</figure>
			</td>
			<td class="descrizione">
				<figcaption>
					<h3><%=prodottiCarrello.get(i).getNome()%></h3>
					<p><%=prodottiCarrello.get(i).getDescrizione()%></p>
					<div class="price">
						<%
							double costo = 0;
								if (prodottiCarrello.get(i).getSconto() != 0) {
									double percentuale = (prodottiCarrello.get(i).getPrezzo() * prodottiCarrello.get(i).getSconto())
											/ 100;
									costo = prodottiCarrello.get(i).getPrezzo() - percentuale;
						%>
						<s><%=prodottiCarrello.get(i).getPrezzo()%></s>
						<%
							} else {
						%>
						$<%=prodottiCarrello.get(i).getPrezzo()%>
						<%
							costo = prodottiCarrello.get(i).getPrezzo();
								}
								totale += carrello.get(i).getQuantità() * costo;
						%>
					</div>
				</figcaption>
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
			<a href="carrello?azioneCarrello=removeFromCart&idProd=<%=prodottiCarrello.get(i).getIdProdotto()%>">
					<img src="images/cestino.png" alt="rimuovi"/></button>
			</a></td>
		</tr>
		<%
			}
		%>

	</table>
	<div>
		<br>
		<br>
		<h1>RIEPILOGO</h1>
		<p class="pt">Totale</p>
		<p class="pt">
			<%=totale%>
		</p>
		<a href="procOrdine.jsp">
			<button type="submit" id="ac">Procedi all'acquisto</button>
		</a>
	</div>

<%@include file = "footer.jsp" %>
</body>
</html>