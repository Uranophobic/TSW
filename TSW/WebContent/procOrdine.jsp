<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.ArrayList, bean.Prodotto, java.text.*, bean.Composizione"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Procedi Ordine </title>
<style>
.immagineProd{
width: 50%;
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
<p  class="titoloPagine"> Procedi all'acquisto </p>
</div>

<div class="procediOrdine" >
	<div  class="colonnaSx ">
		<p class="titColonne text-center"> Stai acquistando: </p>
				<table id="carrelloOrdine">
					  <tr style="text-align: left;">
						    <th id="colonna1">Immagine</th>
						    <th id="colonna2">Nome</th>
						    <th id="colonna3">Quantità</th>
						    <th id="colonna4">Prezzo</th>
						    <th id="colonna5">Sconto</th>
						    <th id="colonna6">Prezzo Totale</th>
				  	</tr>
				<% 		
				double prezzo=0, totSingProd=0, sconto=0; 
		 			int quantità = 0;
		 			
		 			
		 			for(int i=0; i < carrello.size(); i++){
		 				int prova = carrello.get(i).getQuantità();
		 				System.out.println("\n Quantita che mi prendo dal carrello:  " + prova);
		 		%>
		 		
		 		
		 		<!-- ELEMENTI -->
				  <tr id="specificheTab">
				    <td class="immagineProd"><img style="width:50%;"src="<%= prodottiCarrello.get(i).getImmaginePath() %>" alt="immagine-prod"/></td>
				    <td class="nomeProd"><%= prodottiCarrello.get(i).getNome() %></td>
				    <td class="quantProd"><%=carrello.get(i).getQuantità() %></td>
				    <td class="prezzoProd"> 
				    <% prezzo = prodottiCarrello.get(i).getPrezzo(); 
				    prezzo = prezzo + (prezzo * prodottiCarrello.get(i).getIva());
				    %>
				    <%= prezzo %>
				    </td>
					<td class="scontoProd">
					<%= prodottiCarrello.get(i).getSconto() %>
				</td>

					<td class ="prezzoTot">
			
     				<%if(prodottiCarrello.get(i).getSconto()!=0){
        	
        			sconto=prodottiCarrello.get(i).getSconto();
        			//iva=prodottiCarrello.get(i).getIva();
        			 prezzo=prodottiCarrello.get(i).getPrezzo();
        			 totSingProd=0;//totale singolo prodotto prezzo*quantita
        			
        			totSingProd=prezzo-(prezzo*sconto/100);
        			totSingProd=totSingProd*carrello.get(i).getQuantità()*prodottiCarrello.get(i).getIva();
        			totSingProd=totSingProd+prodottiCarrello.get(i).getPrezzo();
        			totaleCarrello=totaleCarrello+totSingProd;
        	
			        }else{
			        	
			        	prezzo=prodottiCarrello.get(i).getPrezzo();
			        	//System.out.println("\nPrezzo senzo niente: " + prezzo);
			        	//System.out.println("Calcolo l'iva");
			        	totSingProd = prezzo + (prezzo * prodottiCarrello.get(i).getIva());
			        	//System.out.println("Prezzo prod + iva : " + totSingProd);
			        	totSingProd = totSingProd * carrello.get(i).getQuantità();
			        	//System.out.println("Prezzo prod(con iva) * quantità  : " + totSingProd);
			        	totaleCarrello=totaleCarrello+totSingProd;
			        	
						//totSingProd=prezzo*carrello.get(i).getQuantità()*prodottiCarrello.get(i).getIva();
						//totSingProd=totSingProd+prodottiCarrello.get(i).getPrezzo();
						//totaleCarrello=totaleCarrello+totSingProd;
			        }
        	%>
        	<%=totSingProd %>
					</td> 
				   
				  </tr>
		 		
				<% } %> <!--  chiusura for -->
				</table><!-- chiusura tabella -->
				
				<div class="totaleCol">
				<a> Totale complessivo: <%= totaleCarrello %> </a>
				</div>	
				
	</div> <!-- chiusura div colonna sx -->
	
	<div  class="colonnaDx1 ">
		<p class="titColonne text-center" > Spedisci all'indirizzo: </p>
					<label id="inputData"> Via</label> <input type="text" name="via" id="via" class="inputProfilo" value="<%=via%>" readonly>
					<label id="inputData"> Citta</label><input type="text" name="citta" id="citta" class="inputProfilo" value="<%=citta%>" readonly>
					<label id="inputData"> Cap</label><input type="text" name="cap" id="cap" class="inputProfilo" value="<%=cap%>" readonly> 
					<label id="inputData"> Provincia</label><input type="text" name="provincia" id="provincia" class="inputProfilo" value="<%=provincia%>" readonly> 
	</div> <!-- chiusura div colonna dx -->

	<div  class="colonnaDx2 ">
		<p class="titColonne text-center"> Paghi con: </p>
					<label id=""> Numero</label> <input type="text" name="numeroCarta" id="numeroCarta" class="inputProfilo" value="<%=numeroCarta%>" readonly>
					<label id=""> Scadenza</label><input type="text" name="scadenza" id="scadenza" class="inputProfilo" value="<%=scadenza%>" readonly>
					<label id=""> Circuito</label><input type="text" name="circuito" id="circuito" class="inputProfilo" value="<%=circuito%>" readonly> 
					<label id=""> CVV</label><input type="text" name="CVV" id="CVV" class="inputProfilo" value="<%=CVV%>" readonly> 
	</div> <!-- chiusura div colonna dx2 -->

</div> <!-- chiusura div procedi ordine -->

<div class="opBtn2">
		<a class=" bottoni bottoni-colori " href="procedi?azioneOrdine=compra">Acquista
	
		</a>	
  	</div>
  				
</body>
</html>