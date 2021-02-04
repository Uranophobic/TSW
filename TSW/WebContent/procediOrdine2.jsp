
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.ArrayList, bean.Prodotto, java.text.*, bean.Composizione"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="">
<title>Visualizza prodotto - Oltre il Giardino </title>

</head>
<body>
<%@ include file="navbar.jsp"%>
<%

	ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
    ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
    double totaleCarrello=0;
    
    Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
	   String datiSped = utente.getDatiSpedizione();
	   System.out.println("Sono i dati spedizione: " + datiSped);
	   String datiPag = utente.getDatiPagamento();
	   System.out.println("Sono i dati pagamento: " + datiPag);
	   
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
		 			double calcSconto = 0, prezzo = 0, prezzoTotProd = 0;
		 			int quantità = 0;
		 			for(int i=0; i < carrello.size(); i++){
		 		%>
		 		
				  <!-- ELEMENTI -->
				  <tr id="specificheTab">
				    <td class="immagineProd"><img src="<%= prodottiCarrello.get(i).getImmaginePath() %>" alt="immagine-prod"/></td>
				    <td class="nomeProd"><%= prodottiCarrello.get(i).getNome() %></td>
				    <td class="quantProd"><%= quantità = carrello.get(i).getQuantità() %></td>
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
				 		<% double sconto=0, prezzo=0, totSingProd=0;
        if(prodottiCarrello.get(i).getSconto()!=0){
        	
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
			        	System.out.println("\nPrezzo senzo niente: " + prezzo);
			        	System.out.println("Calcolo l'iva");
			        	totSingProd = prezzo + (prezzo * prodottiCarrello.get(i).getIva());
			        	System.out.println("Prezzo prod + iva : " + totSingProd);
			        	totSingProd = totSingProd * carrello.get(i).getQuantità();
			        	System.out.println("Prezzo prod(con iva) * quantità  : " + totSingProd);
			        	totaleCarrello=totaleCarrello+totSingProd;
			        	
						//totSingProd=prezzo*carrello.get(i).getQuantità()*prodottiCarrello.get(i).getIva();
						//totSingProd=totSingProd+prodottiCarrello.get(i).getPrezzo();
						//totaleCarrello=totaleCarrello+totSingProd;
			        }
        	%>
        	<%=totSingProd %>
					</td> 
				   
				  </tr>

				</table>
				<%} %>
			<div class="totaleCol">
					<!-- <a> Totale prodotti: <%= totaleCarrello %> </a> <br>
			 <a> Costi spedizione: 5,99   </a> <br>   INVENTIAMO UN COSTO FISSO TIPO 5,99 -->
				<a> Totale complessivo: <%= totaleCarrello %> </a>
			</div>	
	</div>
	
	<div  class="colonnaDx1 ">
		<p class="titColonne text-center" > Spedisci all'indirizzo: </p>
			<div class="row justify-content-center">
			<div class="col-6 form-goup">
			<label class="cose">Via:</label>
      		<input type="text" placeholder="Strada/Vicolo/Piazza"  name="via" id="via" value="<%=via%>">
      		</div>
      		<div class="col-6 form-goup">
			<label class="cose">Citta:</label>
      		<input type="text" placeholder="Numero dell'abitazione" name="citta" id="citta" value="<%=citta%>">
      		</div>
      		</div>
      		
      		
      		<div class="row justify-content-center">
      		<div class="col-6 form-goup">
			<label class="cose">Provincia:</label>
      		<input type="text" placeholder="Provincia" name="provincia" id="provincia" >
      		</div>
      		<div class="col-6 form-goup">
			<label class="cose">CAP:</label>
      		<input type="text" placeholder="Codice postale" name="cap" id="cap">
      		</div>
      		</div>
   
			<div class="oppure text-center"><div class= "rigaSx" class="hr"></div><a id="oppure"> oppure </a><div class= "rigaDx" class="hr"></div></div>
			
			<div class="col-12 form-group">
				<label class="">
				  <input type="radio" checked="checked" name="radio">
				  <span class="checkmark"></span>
				  Scegli un indirizzo già salvati
				</label>
				
				<!-- praticamente qui sta facendo la combo box con tutti gli indirizzi utente che abbiamo trovato  -->
	
 				
    	</div>			
	</div>
	
	<div  class="colonnaDx2 ">
		<p class="titColonne text-center"> Paghi con: </p>
		
		<fieldset>
				<label class="">
		  <input type="radio" checked="checked" name="radio" onClick="clickYes()" id="contrassegno">
		  <span class="checkmark"></span>
		 	Contrassegno
		</label><br>
				<label class="">
		  <input type="radio" checked="checked" name="radio" onClick="clickNo()" id="carta">
		  <span class="checkmark"></span>
		  	Aggiungi una nuova carta:
		</label>
		
		<div id="cartaUtente">
		<div class="row justify-content-center">
			<div class="col-6 form-goup">
			<label class="cose">Nome:</label>
      		<input type="text" placeholder="Nome"  name="nome" id="nome">
      		</div>
      		<div class="col-6 form-goup">
			<label class="cose">Cognome:</label>
      		<input type="text" placeholder="Cognome" name="cognome" id="cognome">
      		</div>
      		</div>
      		
      		
      		<div class="row justify-content-center">
      		<div class="col-12 form-goup">
						<label class="cose">Numero carta:</label>
			      		<input type="text" placeholder="8 - 16 cifre " name="numeroCarta" id="numCarta">
      		</div>
      	
      		</div>
      		
      		<div class="row justify-content-center">
					    <div class="col-6">
					   	 <label class="cose">Scadenza</label>
    						<input type="date" placeholder="dd mm yyyy" name="scadenza" id="scadenza" data-date-format="DD MM YYYY">
    					</div>
    					<div class="col-6 form-goup">
							<label class="cose">Cvv:</label>
				      		<input type="text" placeholder="3 cifre" name="cvv" id="cvv">
      					</div>
      		</div>
      		</div>
      		
      		
      		
			
			<div class="oppure text-center"><div class= "rigaSx" class="hr"></div><a id="oppure"> oppure </a><div class= "rigaDx" class="hr"></div></div>
			
			<div class="col-12 form-group">
			     	<label >
					    <input type="radio" checked="checked" name="radio">
					    <span class="checkmark"></span>
					    Scegli una carta già salvata:
					</label>	
 				
				<select class="select"  name="carte" id="carte">
			<!--  <option>---</option> 
					//if(datiPagUtente.size()!=0){%>
						<!-- for(int i = 0; i < datiPagUtente.size(); i++){ %>
							<!--	<option value="pag">  <%=// datiPagUtente.get(i).toString() %> </option>	-->
						<!-- 	//} -->
				<!-- 	//} else {%> -->
							<!-- <option> Amico non hai inserito/salvato nessuna carta precedentemente! :*  </option>		 -->		 	
 				</select> 
    	</div>					 
		</fieldset>	
	</div>
	
</div>


	<div class="opBtn2">
		<a class=" bottoni bottoni-colori " >
		    <span class="">Procedi all'acquisto ></span>
		</a>	
  	</div>
  				
  				

<script>
  
  function clickYes() {
		if (document.getElementById("contrassegno").checked) {
			$("#cartaUtente").addClass("disabledbutton");
			
		}
	}

	function clickNo() {
		if (document.getElementById("carta").checked) {
			$("#cartaUtente").addClass("abledbutton");
			
		}
	}



  </script>
 	
       
       
<%@ include file="footer.jsp"%>
</body>
</html>