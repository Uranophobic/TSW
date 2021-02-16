<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList, bean.Composizione, bean.Prodotto, bean.Utente"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>Gestione Amministratore</title>
<style>
.botAmm{
	margin:auto;
	width: 40%;
	margin-bottom: 20px;
}


/*GRANDEZZE large, medium, small, extra-large e extra-small*/
@media all and (max-width: 1690px)and (min-width : 990px) {
}

@media all and (max-width: 991px) and (min-width: 768px) {
}

/*small devices*/
@media all and (max-width: 767px) and (min-width: 601px) {
}

/*extra-small devices*/
@media all and (max-width: 600px) {
.colonnaSx {
	display: grid;
	grid-template-columns: 25% 75%;
}

.headTab{
display: none;
}
}


</style>
</head>
<body>
<%@include file = "navbar.jsp" %>
<% ArrayList<Prodotto> catalogo=(ArrayList<Prodotto>) request.getSession().getAttribute("catalogoSessione");
	System.out.println("catalogo lato jsp admin: "+catalogo);%>
	
	
	<!-- 	OPERAZIONI CATALOGO:
		  dobbiamo prendere tutti i prodotti del catalogo dal db
		  dobbiamo poter aggiungere un prodotto (e vedere dopo la lista aggiornata)
		  dobbiao poter selezionare un prodotto da modificare (e vederlo modificato successivamente, lista aggiornata)
		  dobbiamo poter selezionare un prodotto per eliminarlo (e vedere la lista aggiornata senza il prodotto che abbiamo cancellato)
		  
		  	OPERAZIONI ORDINI:
		  dobbiamo prendere tutti gli ordini dal db
		  dobbiamo visualizzarli in ordine data-data
		  dobbiamo visualizzarli pr utente A-Z
	 -->
	 
	 
	 <div>
<p  class="titoloPagine"> Gestione Amministratore </p>
</div>
<div class="botAmm">
<a href="ammAddProd.jsp"><button class="bottoni bottoni-colori"> AGGIUNGI UN PRODOTTO </button></a>
<a href="amministratore?azioneCapo=visualizzaOrdini"><button class="bottoni bottoni-colori"> LISTA DEGLI ORDINI </button></a>
</div>
<p class="titColonne text-center"> I prodotti del Catalogo</p>


<div class="container">
  <div class="table-responsive-sm">          
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Id Prodotto</th>
        <th>Immagine</th>
        <th>Nome</th>
        <th>Descrizione</th>
        <th>Categoria</th>
        <th>Prezzo</th>
        <th>Sconto</th>
        <th>Iva</th>
        <th>Operazioni</th>
      </tr>
    </thead>
    <tbody>
    <%for(int i=0;i<catalogo.size();i++){%>
      <tr>
        <td><%=catalogo.get(i).getIdProdotto() %></td>
        <td><img src=" <%=catalogo.get(i).getImmaginePath() %>" style="width:30%"></td>
        <td> <%=catalogo.get(i).getNome() %></td>
        <td> <%=catalogo.get(i).getDescrizione() %></td>
        <td><%=catalogo.get(i).getCategoria() %></td>
        <td><%=catalogo.get(i).getPrezzo() %></td>
        <td><%=catalogo.get(i).getIva() %></td>
        <td><%=catalogo.get(i).getSconto() %></td>
        <td>
					<a href="amministratore?azioneCapo=prendiProd&idProdCapo=<%=catalogo.get(i).getIdProdotto()%>"><button class=" bottoni bottoni-colori " name="azioneCapo" value="prendiProd">Modifica</button></a>
					<a href="amministratore?azioneCapo=eliminaProd&id=<%=catalogo.get(i).getIdProdotto()%>"><button class=" bottoni bottoni-colori " name="azioneCapo" value="prendiProd">Elimina</button></a>
				   </td>
      </tr>
      <% } %>
    </tbody>
  </table>
  </div>
</div>



<%@include file = "footer.jsp" %>
</body>
</html>