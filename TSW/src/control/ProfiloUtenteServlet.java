package control;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Utente;
import bean.DatiSpedizione;
import bean.DatiPagamento;
import bean.Ordine;
import model.DatiPagamentoModel;
import model.DatiSpedizioneModel;
import model.OrdineModel;
import model.UtenteModel;
import modelDS.DatiPagamentoModelDS;
import modelDS.DatiSpedizioneModelDS;
import modelDS.OrdineModelDS;
import modelDS.UtenteModelDS;

/**
 * Servlet implementation class ProfiloUtenteServlet
 */
@WebServlet("/profilo")
public class ProfiloUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static OrdineModel ordineModel = new OrdineModelDS();
	static UtenteModel utenteModel = new UtenteModelDS();
	static DatiPagamentoModel datiPagModel=new DatiPagamentoModelDS();
	static DatiSpedizioneModel datiSpedModel=new DatiSpedizioneModelDS();
	Utente utente = new Utente();
	DatiSpedizione datiSped=new DatiSpedizione();
	DatiPagamento datiPag=new DatiPagamento();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
		

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("sono del dopost di profilo utente");
		String azioneProfilo = request.getParameter("azioneProfilo");


		if(azioneProfilo.equals("visualizzaWishList")) {

			RequestDispatcher dispatcher = request.getRequestDispatcher("wishlist.jsp");

		}

		if(azioneProfilo.equals("visualizzaOrdini")) {
			utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Ordine> ordiniUtente = new ArrayList<Ordine>();
			try {
				ArrayList<Ordine> ordiniTotali = ordineModel.doRetrieveAll("idOrdine");

				for (Ordine o: ordiniTotali) {
					if(o.getEmailUtente().equals(utente.getEmail())) {
						ordiniUtente.add(o);
					}
				}
				if(ordiniUtente.size()!=0) {
					//setti la sessione e gli fai vedere la jsp degli ordini 
				}else {
					//caso in cui non c'è ancora un ordine effettuato. gli fai vedere la jsp vuota/alert
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if(azioneProfilo.equals("visualizzaDatiIndirizzo")) {

			utente= (Utente)request.getSession().getAttribute("utenteSessione");
			ArrayList<DatiSpedizione> indirizzi= cercaIndirizzi(utente.getEmail());
			HttpSession spedizioneSessione = request.getSession();
			spedizioneSessione.setAttribute("spedizioneSessione", indirizzi);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/modificaDati.jsp");
			dispatcher.forward(request, response);

		}

		if(azioneProfilo.equals("modificaDatiIndirizzo")) {
			utente= (Utente)request.getSession().getAttribute("utenteSessione");
			ArrayList<DatiSpedizione> indirizzi= cercaIndirizzi(utente.getEmail());
			//	HttpSession spedizioneSessione = request.getSession();
			//	spedizioneSessione.setAttribute("spedizioneSessione", indirizzi);

			String viaModifica=request.getParameter("viaModifica");
			String cittaModifica=request.getParameter("cittaModifica");
			int capModifica=Integer.parseInt(request.getParameter("capModifica"));
			String provinciaModifica=request.getParameter("provinciaModifica");

			for(int i=0;i<indirizzi.size();i++) {

				//if((indirizzi.get(i).getVia().equals("viaModifica"))&&(indirizzi.get(i).getCitta().equals("cittaModifica"))&&(indirizzi.get(i).getCap()==capModifica)&&(indirizzi.get(i).getProvincia().equals("provinciaModifica"))) {
					String viaModificata=request.getParameter("viaModificata");
					String cittaModificata=request.getParameter("cittaModificata");
					int capModificata=Integer.parseInt(request.getParameter("capModificata"));
					String provinciaModificata=request.getParameter("provinciaModificata");

					datiSped.setVia(viaModificata);
					datiSped.setCitta(cittaModificata);
					datiSped.setProvincia(provinciaModificata);
					datiSped.setCap(capModificata);

					try {
						datiSpedModel.doUpdate(datiSped);
						System.out.println("indirizzo modificato");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				//}
			}



		}

	}



	public ArrayList<DatiSpedizione> cercaIndirizzi(String email) {
		ArrayList<DatiSpedizione> indirizzi = new ArrayList<DatiSpedizione>(); //tutti gli indirizzi
		ArrayList<DatiSpedizione> indirizziUtente = new ArrayList<DatiSpedizione>();

		try {
			indirizzi = datiSpedModel.doRetrieveAll("email");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (int i=0; i<indirizzi.size(); i++) {
			if(indirizzi.get(i).getEmail().equals(utente.getEmail())) {
				indirizziUtente.add(indirizzi.get(i));
				System.out.println("Questo è l'indirizzo dell'utente: " + indirizzi.get(i).toString());
			}
		}

		return indirizziUtente;
	}



	public ArrayList<DatiPagamento>cercaPagamento(String email){
		ArrayList<DatiPagamento> tuttiPagamenti=new ArrayList<DatiPagamento>();//tutti i dati di pagamento di tutti gli utenti
		ArrayList<DatiPagamento> pagamentoUtente=new ArrayList<DatiPagamento>();//dati pagametno di quell'utente

		try {
			tuttiPagamenti=datiPagModel.doRetrieveAll("emailUtente");
		}catch(SQLException e) {

			e.printStackTrace();
		}

		for(int i=0;i<tuttiPagamenti.size();i++) {

			if(tuttiPagamenti.get(i).getEmail().equals(utente.getEmail())) {
				pagamentoUtente.add(tuttiPagamenti.get(i));
				System.out.println("Tutte le carte: "+tuttiPagamenti.get(i).toString());
			}
		}
		return pagamentoUtente;
	}
}



