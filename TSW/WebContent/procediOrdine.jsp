<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.ArrayList, bean.Prodotto, java.text.*, bean.Composizione"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Procedi Ordine - Oltre il Giardino</title>
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

.totComp {
	border: 2px solid #a6ec84;
	grid-row-start: 3;
	grid-row-end: 4;
	width: 103%;
	border-radius: 5px;
}

.regProcOrdine {
	width: 100%;
	display: grid;
	grid-template-columns: 50% 50%;
	height: 504px;
	justify-content: center;
	grid-column-gap: 2%;
	margin-left: 40px;
	/* grid-row-gap: 0px; */
	/* margin: auto; */
}

.oggCompra {
	grid-row-start: 1;
	grid-row-end: 3;
	width: 100%;
	height: 400px;
	width: 103%;
	border: 2px solid #a6ec84;
	background-color: white;
	border-radius: 5px;
	overflow-x: clip;
	overflow-y: scroll;
}

.ordSped {
	height: auto;
	width: 90%;
	border: 2px solid #a6ec84;
	background-color: white;
	border-radius: 5px;
	/* grid-row-gap: 5%; */
	margin-bottom: 5px;
}

.ordPag {
	height: auto;
	width: 90%;
	border: 2px solid #a6ec84;
	background-color: white;
	border-radius: 5px;
	grid-row-gap: 0;
	grid-row-start: 2;
	grid-row-end: 4;
}

.tot2 {
	/* float: left; */
	width: 7%;
	margin: auto;
	/* float: right; */
	font-size: 24px;
	font-weight: bold;
}

.tot2 {
	/* float: left; */
	width: 7%;
	margin: auto;
	/* float: right; */
	font-size: 24px;
	font-weight: bold;
}

/*********** grandezze monitor per il responsive ***********/
/*GRANDEZZE large, medium, small, extra-large e extra-small*/
@media all and (max-width: 1690px)and (min-width : 990px) {
}

@media all and (max-width: 991px) and (min-width: 768px) {
.regProcOrdine {
	width: 95%;
	display: grid;
	grid-template-columns: 50% 50%;
	height: 504px;
	justify-content: center;
	grid-column-gap: 4%;
	margin-left: 40px;
	/* grid-row-gap: 0px; */
	/* margin: auto; */
}
.tot2 {
	/* float: left; */
	width: 15%;
	margin: auto;
	float: right;
	font-size: 24px;
	font-weight: bold;
}
#ivaCol{
display: none;
}
}

/*small devices*/
@media all and (max-width: 767px) and (min-width: 601px) {
.regProcOrdine {
	width: 90%;
	display: block;
	height: auto;
	justify-content: center;
	grid-column-gap: 2%;
	margin-left: 20px;
}
.totComp {
	margin-top: 15px;
	margin-bottom: 15px;
	width: 103%;
	height: 100px;
}
.tot2 {
	/* float: left; */
	width: 15%;
	/* margin: auto; */
	float: right;
	font-size: 24px;
	font-weight: bold;
	/* margin-bottom: 81px; */
}
.tot {
	font-size: 24px;
	width: 50%;
	/* margin: auto; */
	margin-left: 15px;
	font-weight: bold;
	color: red;
}
.ordSped {
	margin-top: 15px;
	margin-bottom: 15px;
	width: 103%;
}
.ordPag {
	margin-top: 15px;
	margin-bottom: 15px;
	width: 103%;
}
}

/*extra-small devices*/
@media all and (max-width: 600px) {
.regProcOrdine {
	width: 90%;
	display: block;
	height: auto;
	justify-content: center;
	grid-column-gap: 2%;
	margin-left: 20px;
}
.totComp {
	margin-top: 15px;
	margin-bottom: 15px;
	width: 103%;
	height: 100px;
}
.tot2 {
	/* float: left; */
	width: 15%;
	/* margin: auto; */
	float: right;
	font-size: 24px;
	font-weight: bold;
	/* margin-bottom: 81px; */
}
.tot {
	font-size: 24px;
	width: 50%;
	/* margin: auto; */
	margin-left: 15px;
	font-weight: bold;
	color: red;
}
.totComp {
	margin-top: 15px;
	margin-bottom: 15px;
}
.ordSped {
	margin-top: 15px;
	margin-bottom: 15px;
	width: 103%;
}
.ordPag {
	margin-top: 15px;
	margin-bottom: 15px;
	width: 103%;
}
.opBtn2 {	width: 32%;

}
}

</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%

	ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
    ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
    int quantitaCar = (int) request.getSession().getAttribute("quantitaCarrello");
    double totaleCarrello=0;

   
    
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

	<div class="regProcOrdine" >
		<div  class="text-center oggCompra"> 
			<p class="titColonne text-center">Stai acquistando:</p>
			<table id="carrelloOrdine">
				<tr id="specificheTab" style="text-align: left;">
					<th id="imgCol">Immagine</th>
					<th id="colonna2">Nome</th>
					<th id="quantitaCol">Quantità</th>
					<th id="colonna4">Prezzo</th>
					<th id="ivaCol">Sconto</th>
					<th id="ivaCol">Iva</th>
					<th id="imgCol">Totale</th>
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
					<td id="imgCol"><img style="width: 50%;"
						src="<%= prodottiCarrello.get(i).getImmaginePath() %>"
						alt="immagine-prod" /></td>
					<td class="nomeProd"><p><%= prodottiCarrello.get(i).getNome() %></p></td>
					<td id="quantitaCol"><p><%=carrello.get(i).getQuantità() %></p></td>
					<td>
						<% prezzo = prodottiCarrello.get(i).getPrezzo(); 
				    prezzo = prezzo + (prezzo * prodottiCarrello.get(i).getIva());
				    %><p><%=prezzo%> &#8364</p>
					</td>
					<td id="ivaCol"><p><%= prodottiCarrello.get(i).getSconto() %>%</p>
					</td>
					<td id="ivaCol"><p><%=prodottiCarrello.get(i).getIva() %></p></td>

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
							<p><%=costo%> &#8364</p>
						</div>
					</td>

				</tr>

				<% } %>
				<!--  chiusura for -->
			</table>
			<!-- chiusura tabella -->
			

		</div>
		<!-- chiusura div colonna sx -->

<div style=""class="totComp">
				<p class="tot">Totale Complessivo:</p><p class="tot2"><%=totale%></p>
			</div>
			<div  class="text-center ordSped">
			<p class="titColonne text-center">Spedisci all'indirizzo:</p>

				<label id="datiLab"> Via </label> <input type="text" name="via" class="inputLogin2"  value="<%=via%>" readonly><br> 
				<label id="datiLab"> Citta </label> <input type="text" name="citta"  class="inputLogin2"  value="<%=citta%>" readonly><br> 
				<label id="datiLab"> Cap </label> <input type="text" name="cap"  class="inputLogin2"  value="<%=cap%>" readonly><br>
				 <label id="datiLab"> Provincia </label> <input type="text" name="provincia"  class="inputLogin2"  value="<%=provincia%>" readonly><br>
	
		</div>
		<!-- chiusura div colonna dx -->

	
						<div  class="text-center ordPag">
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
			<br>
		<div class="opBtn2">
		<a class=" bottoni bottoni-colori " href="procedi?azioneOrdine=compra">Acquista</a>
	</div>
	
		<!-- chiusura div colonna dx2 -->


	<!-- chiusura div procedi ordine -->

	
		
	</div>

	<br>
	<br>
	<%@include file="footer.jsp"%>
</body>
</html>