package control;

import java.io.IOException;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bean.Ordine;
import bean.Prodotto;
import bean.Utente;
import bean.Composizione;

import model.ComposizioneModel;

import model.FatturaModel;
import model.OrdineModel;
import model.ProdottoModel;

import modelDS.ComposizioneModelDS;

import modelDS.FatturaModelDS;
import modelDS.OrdineModelDS;
import modelDS.ProdottoModelDS;

/**
 * Servlet implementation class ProcediOrdineServlet
 */
@WebServlet("/ProcediOrdineServlet")
public class ProcediOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProdottoModel prodottoModel = new ProdottoModelDS();
	static OrdineModel ordineModel = new OrdineModelDS();
	static FatturaModel fatturaModel = new FatturaModelDS();
	static ComposizioneModel composizioneModel = new ComposizioneModelDS();


	Utente utente = new Utente();
	Ordine ordine = new Ordine();

	Prodotto prod = new Prodotto();

	double prezzoTot = 0;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//test per vedere se stampava la data
		String data = dataOggi();
		System.out.println(data);
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneOrdine = request.getParameter("azioneOrdine");
		System.out.println("Azione selezionata procedi ordine: "+ azioneOrdine);

		
		/*
		 * 	if(azioneOrdine.equals("visualizzaProdotti")) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(" procediOrdine.jsp ");
			dispatcher.forward(request, response);
		}
		 */
	



		if(azioneOrdine.equals("procediOrdine")) {
			//in questo medoto facciamo riferimento all'array sopra che si chiama Carrello  

			utente = (Utente) request.getSession().getAttribute("utenteSessione");

			//String email = utente.getEmail();
			//	ordine.setEmailUtente(email);


			//controlliamo se un prodotto ha lo sconto, nel caso ce l'ha lo calcoliamo
			for (int i=0; i<carrello.size(); i++) {
				if(carrello.get(i).getScontoAttuale()!=0) {
					double sconto = carrello.get(i).getScontoAttuale();
					double prezzo = carrello.get(i).getPrezzoUnitario();
					prezzo = prezzo - ( prezzo * sconto / 100) ; 
					prezzoTot = prezzo * carrello.get(i).getQuantità();
				} else {
					prezzoTot = prezzoTot + carrello.get(i).getPrezzoUnitario() * carrello.get(i).getQuantità();
				}
			}

			ordine.setImportoTot(prezzoTot);

			String data = dataOggi();
			ordine.setDataOrdine(data);
			//System.out.println(data);

			// BISOGNA SETTARE IL CODICE / ID ORDINE!s
			//funzione genera codice ordine amministratore
			try {
				ordineModel.doSave(ordine);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			//una volta finito di settare l'ordine bisogna visualizzare fattura 
			dispatcher = request.getRequestDispatcher("fattura.jsp");
			dispatcher.forward(request, response);
		}


		if(azioneOrdine.equals("visualizzaFattura")) {
			//passo tutto alla jsp con la sessione
			utente = (Utente) request.getSession().getAttribute("utenteSessione"); 
			//datiSped = (DatiSpedizione) request.getSession().getAttribute("datiSpedSessione");
			//	datiPag = (DatiPagamento) request.getSession().getAttribute("datiPagSessione");

			prezzoTot =  (double) request.getSession().getAttribute("prezzoTot");  //prezzo totale dell'ordine 

			dispatcher = request.getRequestDispatcher(" fattura.jsp ");  
			dispatcher.forward(request, response);
		}



	}







	private String dataOggi(){
		Date oggi = new Date(); // Data di oggi
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); // Qui decido il formato di visualizzazione
		String dataOggi = sdf.format( oggi );
		return dataOggi;		
	} 



}