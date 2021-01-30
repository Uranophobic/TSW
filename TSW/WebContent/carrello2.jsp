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
</head>

<body>
<%@ include file="navbar.jsp"%>

<%ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
ArrayList<Prodotto> catalogo=(ArrayList<Prodotto>)request.getSession().getAttribute("catalogoSessione");

for(int i=0;i<catalogo.size();i++){
	for(int j=0; j<carrello.size();j++){
		String codiceCarrello=carrello.get(j).getCodiceProdotto();
		String codiceCatalogo=catalogo.get(i).getIdProdotto();
		System.out.println(codiceCarrello);
		System.out.println(codiceCatalogo);
		
	if(codiceCarrello.equals(codiceCatalogo)){
		
		prodottiCarrello.add(catalogo.get(i));
	}
}
}

%>

<div>
<p  class="titoloPagine"> Carrello</p>
</div>
	

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
    <% for(int i=0; i<prodottiCarrello.size();i++){    %>
    
      <tr>
        <td>1</td>
        <td><img src="<%=prodottiCarrello.get(i).getImmaginePath() %>" style="width: 80%;"></td>
        <td> <p id="titDescr" ><%=prodottiCarrello.get(i).getNome() %></p>
        <p id="testoDescr"> <%=prodottiCarrello.get(i).getDescrizione() %>
         </p> </td>
        <td><%=prodottiCarrello.get(i).getPrezzo()%></td>
        <td><%=carrello.get(i).getQuantità() %></td>
        <td>0</td>
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
		<a class=" bottoni bottoni-colori " >
		    <span class=""> Procedi all'ordine ></span>
		</a>	
  	</div>
<%@ include file="footer.jsp"%>
</body>
</html>
