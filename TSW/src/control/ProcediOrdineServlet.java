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

import bean.DatiPagamento;
import bean.DatiSpedizione;
import bean.Ordine;
import bean.Prodotto;
import bean.Utente;
import bean.Composizione;

import model.ComposizioneModel;
import model.DatiPagamentoModel;
import model.DatiSpedizioneModel;
import model.FatturaModel;
import model.OrdineModel;
import model.ProdottoModel;

import modelDS.ComposizioneModelDS;
import modelDS.DatiPagamentoModelDS;
import modelDS.DatiSpedizioneModelDS;
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
		static DatiSpedizioneModel datiSpedModel = new DatiSpedizioneModelDS();
		static DatiPagamentoModel datiPagModel = new DatiPagamentoModelDS();
		
		Utente utente = new Utente();
		Ordine ordine = new Ordine();
		DatiSpedizione datiSped = new DatiSpedizione();
		DatiPagamento datiPag = new DatiPagamento();
		Prodotto prod = new Prodotto();
		
		double prezzoTot = 0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcediOrdineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//test per vedere se stampava la data
		String data = dataOggi();
		System.out.println(data);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneOrdine = request.getParameter("azioneOrdine");
		
		if(!azioneOrdine.equals(null)) {
			ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");

			switch(azioneOrdine) {
			
				case "visualizzaProdotti":
					/*
					 * mi prendo tutti i prodotti dalla sessione che l'utente ha aggiunto al carrello, li metto all'interno di un
					 * Arraylist e lo passo alla jsp che provvederà a stampare tutti i prodotti all'interno dell'arraylist 
					 * (vedi array list sopra)
					 */
					
					request.getSession().setAttribute("carrelloSessione", carrello);
					request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
					RequestDispatcher dispatcher = request.getRequestDispatcher(" procediOrdine.jsp ");
					dispatcher.forward(request, response);
					break;
				
				
				case "addIndirizzoSped":
					
					utente = (Utente) request.getSession().getAttribute("utenteSessione");
					try {
						String via = request.getParameter("via");
						String citta = request.getParameter("citta");
						int cap = Integer.parseInt(request.getParameter("cap"));
						String provincia = request.getParameter("provincia");
						String email = request.getParameter(utente.getEmail());
						//email utente dovrebbe prenderla dalla sessione perchè l'utente è gia loggato, 
						//altrimenti nel form per inserire l'indirizzo di spedizione dovrei fargli mettere anche l'email? Eh no 
						
						datiSped.setVia(via);
						datiSped.setCitta(citta);
						datiSped.setCap(cap);
						datiSped.setProvincia(provincia);
						datiSped.setEmail(email);
						
						datiSpedModel.doSave(datiSped);
						
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}	
					break;
					
				case "scegliIndirizzoSped":
					utente = (Utente) request.getSession().getAttribute("utenteSessione");
					ArrayList<DatiSpedizione> datiSpedUtente = new ArrayList<DatiSpedizione>();
					ArrayList<DatiSpedizione> indirizziTutti = new ArrayList<DatiSpedizione>();
					
					try {
						indirizziTutti= datiSpedModel.doRetrieveAll("email");  //prendi tutti gli indirizzi
						
						for ( int i = 0; i < indirizziTutti.size(); i++) {
							if( indirizziTutti.get(i).getEmail().equals(utente.getEmail())) { //per ogni indirizzo vedi se l'emai è quella dell'utente in questione 
								//se si metti questo indirizzo all'interno di dati sped utente 
								datiSpedUtente.add(indirizziTutti.get(i));
							}
						}
						
						//dopo aver fatto tutti i controlli vedi se questo array è vuoto
						if(datiSpedUtente.size() != 0 ) {
							//se non lo è lo passi alla jsp 
							request.getSession().setAttribute("datiSpedSessione", datiSpedUtente);
							dispatcher = request.getRequestDispatcher(" procediOrdine.jsp ");
							dispatcher.forward(request, response);
						}else {
							//bro non hai alcun indirizzo già messo !!
						}
						
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					break;
				
				case "addMetodoPag":
					
					utente = (Utente) request.getSession().getAttribute("utenteSessione");
					
					try {
						
						String numCarta = request.getParameter("numCarta");
						String email = request.getParameter(utente.getEmail());
						String circuito = request.getParameter("circuito");
						String scadenzaCarta = request.getParameter("scadenzaCarta");
						int cvv = Integer.parseInt(request.getParameter("cvv"));
						
						datiPag.setNumeroCarta(numCarta);
						datiPag.setEmail(email);
						datiPag.setCircuito(circuito);
						datiPag.setScadenzaCarta(scadenzaCarta);
						datiPag.setCVV(cvv);
						
						datiPagModel.doSave(datiPag);
						
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					
					
					break;
				
				case "scegliMetodoPag":
					utente = (Utente) request.getSession().getAttribute("utenteSessione");
					ArrayList<DatiPagamento> datiPagUtente = new ArrayList<DatiPagamento>();
					ArrayList<DatiPagamento> tuttiDatiPag = new ArrayList<DatiPagamento>();
					
					try {
						tuttiDatiPag = datiPagModel.doRetrieveAll("email");
						//in realtà prima del for ci vorrebbe un altro controllo
						//ovvero controllare PER ASSURDO che dentro a questo array c'è almeno un dato 
						
						for(int i=0; i<tuttiDatiPag.size(); i++) {
							if(tuttiDatiPag.get(i).getEmail().equals(utente.getEmail())) {
								datiPagUtente.add(tuttiDatiPag.get(i));
							}
						}
						
						if(datiPagUtente.size() !=0) {
							//ci sono degli elementi e li pssi alla jsp per visualizzarli 
							request.getSession().setAttribute("datiPagSessione", datiPagUtente);
							dispatcher = request.getRequestDispatcher(" procediOrdine.jsp ");
							dispatcher.forward(request, response);
						} else {
							//non ci sono dati bro!!
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
						
					break;
				
					
					
					
					/* B O Z Z A */
				case "procediAcquisto":
					
					//in questo medoto facciamo riferimento all'array sopra che si chiama Carrello  
					
					utente = (Utente) request.getSession().getAttribute("utenteSessione");
					
					String email = utente.getEmail();
					ordine.setEmailUtente(email);
					
					
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
					break;
					
					
				case "visualizzaFattura":  
					//passo tutto alla jsp con la sessione
					utente = (Utente) request.getSession().getAttribute("utenteSessione"); 
					datiSped = (DatiSpedizione) request.getSession().getAttribute("datiSpedSessione");
					datiPag = (DatiPagamento) request.getSession().getAttribute("datiPagSessione");
					
					prezzoTot =  (double) request.getSession().getAttribute("prezzoTot");  //prezzo totale dell'ordine 
					
					dispatcher = request.getRequestDispatcher(" fattura.jsp ");  
					dispatcher.forward(request, response);
					break;
			}
		}
		
	}




private String dataOggi(){
	Date oggi = new Date(); // Data di oggi
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); // Qui decido il formato di visualizzazione
	String dataOggi = sdf.format( oggi );
	return dataOggi;		
} 



}