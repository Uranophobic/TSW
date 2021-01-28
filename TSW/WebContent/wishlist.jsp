<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import= "java.util.ArrayList, bean.Wishlist, bean.Utente, bean.Prodotto "%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/stilesito.css">
<title>WishList!</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div>
		<p class="titoloPagine">WishList!</p>

	</div>
	<div>
		<h2 class="sottotitoloWish">Qui potrai trovare tutti gli elementi
			che ti piacerebbe acquistare !</h2>
	</div>
<%	ArrayList<Prodotto> wishlist = (ArrayList<Prodotto>) request.getSession().getAttribute("prova");

	for (int i=0; i<wishlist.size(); i++){
		System.out.println(wishlist.get(i).toString());
	}

%>
	<div id="area-utente">


		<div class="item-b">
	
			<div class="prodotto">
				<img src="images/imm4042.jpg" class="fotoProdottoWish"> <label
					class="descrizioneProdotto">Questa immagine è una pianta
					morta <a class="buttonCarrello" href="../view/carrello.jsp"><img
						src="images/carrello.png" class="immagineCarrello"></a> <a
					class="buttonCestino" href="../view/prodottoEliminato.jsp"><img
						src="images/cestino.png" class="immagineCarrello"></a>
				</label>
				<div class="riga1" class="hr"></div>
			</div>




		<!-- chiusura item-b -->
	</div>
	<!-- chiusura div area utente -->
</div>
	<div align="center">
		<button type="submit" class="indietro">Indietro</button>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>