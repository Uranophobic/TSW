<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.util.ArrayList, bean.Prodotto, java.text.*, bean.Composizione, bean.DatiSpedizione, bean.DatiPagamento"%>
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
<link rel="stylesheet" type="text/css" href="../css/stilesito.css">
<title> Carrello - Oltre il Giardino</title>
</head>

<style>
.table{
font-size: 20px;
}
#numCol{
width: auto;
}

#imgCol{
width: 20%;
}

#descrCol{
width: auto;
}

#priceCol{
width: 10%;
}

#qntCol{
width: 10%;
}

#totCol{
width: auto;
}

#titDescr{
font-weight: bold; 

}
</style>
<body>
<%@ include file="navbar.jsp"%>

<%ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");%>
<div>
<p  class="titoloPagine"> Carrello</p>
</div>
<%if(carrello.size()!=0){ %>
	
	

<div class="container">                                                                                   
  <div class="table-responsive">          
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
      <tr>
        <td>1</td>
        <td><img src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/p/r/prcbt98_new.jpg" style="width: 80%;"></td>
        <td> <p id="titDescr"> Troncarami con contro lama dentata 95cm</p>
        <p id="testoDescr"> Appositamente studiata per rami secchi e legno duro, grazie al suo sistema a contro-lama dentata.
 Lama spessore 4 mm. in acciaio al carbonio #S55C temperato
 Rivestimento antiruggine.
 Contro-lama spessore 4 mm in acciaio al carbonio # 50 temperato.
 Sistema di apertura della lama disassato per applicare maggiore forza.
 Manici telescopici da 500 a 750 mm.
 Impugnature ergonomiche bimateriale antiscivolo.
 Ø max. di taglio 33 mm.
         </p> </td>
        <td>55,50 euro</td>
        <td>1</td>
        <td>55,50 euro</td>
      </tr>
      
      <tr>
        <td>1</td>
        <td><img src="https://www.ribimex.it/media/catalog/product/cache/3/thumbnail/1000x1000/9df78eab33525d08d6e5fb8d27136e95/P/R/PRCH43.jpg" style="width: 80%;"></td>
        <td> <p id="titDescr"> Cesoia da rifinitura 43 cm</p>
        <p id="testoDescr"> Specialmente concepita per tagliare e scolpire con precisione le siepi, le siepi decorative e gli arbusti.

Ideale per delle finiture pulite e nette.
  Lame 160 mm spess 4 mm in acciaio al carbonio #50 temperato,
  Rivestimento antiruggine.
  Sistema di blocco in posizione chiusa.
  Fermi di ammortizzazione del taglio.
  Manici ergonomici 230 mm incurvati con rivestimento antiscivolo.
  Impugnature incurvate ergonomiche bimateriale antiscivolo.

         </p> </td>
        <td>25,00 euro</td>
        <td>1</td>
        <td>25,00 euro</td>
      </tr>
    </tbody>
  </table>
<%  }else{//se invece è diverso da 0%>
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
