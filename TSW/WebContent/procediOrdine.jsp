<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.ArrayList, bean.Prodotto, java.text.*, bean.Composizione"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Procedi Ordine</title>
<style>
.immagineProd {
	width: 25%;
}

#specificheTab {
	text-align: left;
	border-bottom: 1px solid #dddd;
}

.datiUt {
	margin: auto;
	width: 80%;
}

#datiIn {
	border: none;
	border-bottom: 1px solid #dddd;
}

#datiLab {
	font-weight: bold;
	font-size: 18px;
	margin-right: 10px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%

	ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
    ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
    int quantitaCar = (int) request.getSession().getAttribute("quantitaCarrello");
    System.out.println("                    QUANTITA' NEL PROCEDI ORDINE: " + quantitaCar);
    double totaleCarrello=0;

    for(int i =0; i<prodottiCarrello.size(); i++){
    	System.out.println("PRODOTTO NUMERO " + i + ":" + prodottiCarrello.get(i).toString());
    }
    System.out.println("SECONDO FOR NEL PROCEDI ORDINE");
    for(int i =0; i<carrello.size(); i++){
    	System.out.println("CARRELLO NUMERO " + i + ":" + carrello.get(i).toString());
    }
    
    Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
	   String datiSped = utente.getDatiSpedizione();
	   String datiPag = utente.getDatiPagamento();
	  
	   String via="", citta="", cap="", provincia=""; 
	   
	   if(utente.getDatiSpedizione()!=null){
		   
		   int uno = datiSped.indexOf("&"); //uno inteso come prima divisione della stringa(via)
		   via = datiSped.substring(0, uno);
		   String runo = datiSped.substring(uno+1); //r sta per resto quindi resto uno =runo
		   
		   int due = runo.indexOf("&");
		   citta = runo.substring(0, due);
		   String rdue = runo.substring(due+1);
		   
		   int tre = rdue.indexOf("&");
		   cap = rdue.substring(0, tre);
		   String rtre = rdue.substring(tre+1);
		   
		   int quattro = rtre.indexOf("&");
		   provincia = rtre.substring(0);
	   }
	   
	   String numeroCarta="", scadenza="", circuito="", CVV="";
	   
	   if(utente.getDatiPagamento()!=null){
		   int uno = datiPag.indexOf("&"); //uno inteso come prima divisione della stringa(via)
		   numeroCarta = datiPag.substring(0, uno);
		   String runo = datiPag.substring(uno+1); //r sta per resto quindi resto uno =runo
				   
		   int due = runo.indexOf("&");
		   scadenza = runo.substring(0, due);
		   String rdue = runo.substring(due+1);
		   
		   int tre = rdue.indexOf("&");
		   circuito = rdue.substring(0, tre);
		   String rtre = rdue.substring(tre+1);	
		   
		   int quattro = rtre.indexOf("&");
		   CVV = rtre.substring(0);
	   }
%>
	<div>
		<p class="titoloPagine">Procedi all'acquisto</p>
	</div>

	<div class="procediOrdine">
		<div class="colonnaSx ">
			<p class="titColonne text-center">Stai acquistando:</p>
			<table id="carrelloOrdine">
				<tr id="specificheTab" style="text-align: left;">
					<th id="colonna1">Immagine</th>
					<th id="colonna2">Nome</th>
					<th id="colonna3">Quantità</th>
					<th id="colonna4">Prezzo</th>
					<th id="colonna5">Sconto</th>
					<th id="colonna5">Iva</th>
					<th id="colonna6">Totale</th>
				</tr>
				<% 		
				double prezzo=0, totale=0, sconto=0; 
		 			int quantità = 0;
		 			
		 			
		 			for(int i=0; i < carrello.size(); i++){
		 				int prova = carrello.get(i).getQuantità();
		 				System.out.println("\n Quantita che mi prendo dal carrello:  " + prova);
		 		%>


				<!-- ELEMENTI -->
				<tr id="specificheTab">
					<td class="immagineProd"><img style="width: 50%;"
						src="<%= prodottiCarrello.get(i).getImmaginePath() %>"
						alt="immagine-prod" /></td>
					<td class="nomeProd"><%= prodottiCarrello.get(i).getNome() %></td>
					<td class="quantProd"><%=carrello.get(i).getQuantità() %></td>
					<td class="prezzoProd">
						<% prezzo = prodottiCarrello.get(i).getPrezzo(); 
				    prezzo = prezzo + (prezzo * prodottiCarrello.get(i).getIva());
				    %> <%= prezzo %>
					</td>
					<td class="scontoProd"><%= prodottiCarrello.get(i).getSconto() %>
					</td>
					<td><%=prodottiCarrello.get(i).getIva() %></td>

					<td class="prezzoTot">

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
							<p>&#8364</p><%=costo%>
						</div>
					</td>

				</tr>

				<% } %>
				<!--  chiusura for -->
			</table>
			<!-- chiusura tabella -->
			<div class="totComplessivo">
				<p class="tot">
					Totale Complessivo:
					<%=totale%></p>
			</div>

		</div>
		<!-- chiusura div colonna sx -->

		<div class="colonnaDx1 ">
			<p class="titColonne text-center">Spedisci all'indirizzo:</p>
			<div class="datiUt">
				<label id="datiLab"> Via </label> <input type="text" name="via"
					id="datiIn" value="<%=via%>" readonly><br> <label
					id="datiLab"> Citta </label> <input type="text" name="citta"
					id="datiIn" value="<%=citta%>" readonly><br> <label
					id="datiLab"> Cap </label> <input type="text" name="cap"
					id="datiIn" value="<%=cap%>" readonly><br> <label
					id="datiLab"> Provincia </label> <input type="text"
					name="provincia" id="datiIn" value="<%=provincia%>" readonly><br>
			</div>
		</div>
		<!-- chiusura div colonna dx -->

		<div class="colonnaDx2 ">
			<p class="titColonne text-center">Paghi con:</p>
			<div class="datiUt">
				<label id="datiLab"> Numero</label> <input type="text"
					name="numeroCarta" id="datiIn" value="<%=numeroCarta%>" readonly><br>
				<label id="datiLab">Scadenza</label> <input type="text"
					name="scadenza" id="datiIn" value="<%=scadenza%>" readonly><br>
				<label id="datiLab"> Circuito</label> <input type="text"
					name="circuito" id="datiIn" value="<%=circuito%>" readonly>
				<br> <label id="datiLab"> CVV</label> <input type="text"
					name="CVV" id="datiIn" value="<%=CVV%>" readonly> <br>
			</div>
		</div>
		<!-- chiusura div colonna dx2 -->

	</div>
	<!-- chiusura div procedi ordine -->

	<div class="opBtn2">
		<a class=" bottoni bottoni-colori " href="procedi?azioneOrdine=compra">Acquista</a>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>