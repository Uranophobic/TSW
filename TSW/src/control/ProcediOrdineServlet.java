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
import model.OrdineModel;
import model.ProdottoModel;
import modelDS.ComposizioneModelDS;
import modelDS.OrdineModelDS;
import modelDS.ProdottoModelDS;

/**
 * Servlet implementation class ProcediOrdineServlet
 */
@WebServlet("/procedi")
public class ProcediOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProdottoModel prodottoModel = new ProdottoModelDS();
	static OrdineModel ordineModel = new OrdineModelDS();
	static ComposizioneModel composizioneModel = new ComposizioneModelDS();
	double prezzoTot = 0;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneOrdine = request.getParameter("azioneOrdine");
		System.out.println("Azione selezionata procedi ordine: "+ azioneOrdine);

		if(azioneOrdine.equals("compra")) {
			System.out.println("sono in compra");
			Ordine ordine =new Ordine();
			Composizione compo= new Composizione();
			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Composizione>carrello=(ArrayList<Composizione>)request.getSession().getAttribute("carrelloSessione");
			ArrayList<Ordine> ordini= (ArrayList<Ordine>) request.getSession().getAttribute("ordiniSessione");
			ArrayList<Prodotto> prodottiCarrello=(ArrayList<Prodotto>)request.getSession().getAttribute("prodottiCarrello");
			ArrayList<Ordine> allOrdini=new ArrayList<Ordine>();
			try {
				for (int i=0; i<carrello.size(); i++) {
					if(carrello.get(i).getScontoAttuale()!=0) {
						double sconto = carrello.get(i).getScontoAttuale();
						double prezzo = carrello.get(i).getPrezzoUnitario();
						double iva=carrello.get(i).getIva();
						prezzo = prezzo - ( prezzo * sconto / 100) ; 
						prezzo=prezzo+(prezzo*iva);
						prezzoTot = prezzoTot+(prezzo * carrello.get(i).getQuantità());
					
					} else {
						double prezzo = carrello.get(i).getPrezzoUnitario();
						double iva=carrello.get(i).getIva();
						prezzo=prezzo+(prezzo*iva);
						prezzoTot = prezzoTot+(prezzo * carrello.get(i).getQuantità());
					}
				}


				allOrdini=ordineModel.doRetrieveAll("idOrdine");
				System.out.println("tutti gli ordini della tabella ordine: \n"+allOrdini);


				//set attributi ORDINE
				String data = dataOggi();
				ordine.setDataOrdine(data);
				ordine.setEmailUtente(utente.getEmail());
				ordine.setImportoTot(prezzoTot);
				String idOrdineTemp = newId(allOrdini);
				System.out.println("idOrdineTemp: "+idOrdineTemp);
				ordine.setIdOrdine(idOrdineTemp);

				System.out.println(ordine.toString());	
				//set attributi composizione
				for(int i=0;i<prodottiCarrello.size();i++) {
					compo.setCodiceOrdine(idOrdineTemp);
					compo.setCodiceProdotto(prodottiCarrello.get(i).getIdProdotto());
					compo.setPrezzoUnitario(prodottiCarrello.get(i).getPrezzo());
					compo.setIva(prodottiCarrello.get(i).getIva());
					compo.setScontoAttuale(prodottiCarrello.get(i).getSconto());
					compo.setQuantità(carrello.get(i).getQuantità());
					//System.out.println("composizione: "+compo.toString());
					//carrello.add(compo);
					composizioneModel.doSave(compo);
				}



				ordini.add(ordine);
				ordineModel.doSave(ordine);

					prodottiCarrello.clear();
					prodottiCarrello.removeAll(prodottiCarrello);
					
					carrello.clear();
					carrello.removeAll(carrello);
					
					System.out.println("arraylist PRODOTTI dopo la remove: "+ prodottiCarrello);
					System.out.println("arraylist CARRELLO dopo la remove: "+ carrello);

					request.getSession().removeAttribute("quantitaCarrello");
					request.getSession().removeAttribute("carrelloSessione");
					request.getSession().removeAttribute("prodottiCarrello");
					request.getSession().removeAttribute("ordiniSessione");
					request.getSession().setAttribute("quantitaCarrello", 0);
					request.getSession().setAttribute("carrelloSessione", carrello);
					request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
					request.getSession().setAttribute("ordiniSessione", ordini);
					System.out.println("ho azzerato il carrello");
					request.getSession().setAttribute("ordiniSessione", ordini);
					RequestDispatcher view = request.getRequestDispatcher("/fattura.jsp");
					view.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}



		private String dataOggi(){
			Date oggi = new Date(); // Data di oggi
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); // Qui decido il formato di visualizzazione
			String dataOggi = sdf.format( oggi );
			return dataOggi;		
		} 
//metodo per generare l'id dell'ordine
		public String newId(ArrayList<Ordine>allOrdini) {
			String idCorrente="";
			int size = allOrdini.size();
			int[] idNoK = new int[size];
			System.out.println("Array list ALL: \n"+allOrdini);

			if(allOrdini.size()!=0) {
				
				for(int i=0; i<allOrdini.size();i++) {


					String id = allOrdini.get(i).getIdOrdine();
					System.out.println("INDICE " +  i +"ID TUTTI: "+ id);

					String k2="", numero2="";

					k2 = id.substring(0,1);
					//System.out.println(" K2: " + k2); //mi separo la k

					numero2 = id.substring(1); //mi separo il numero
					//	System.out.println("numero2 : " + numero2);
					int n = Integer.parseInt(numero2);


					idNoK[i]=n;
					
				}

				int max = idNoK[0];
				for ( int i=0; i<idNoK.length; i++) {
					if(idNoK[i]>max) {
						max = idNoK[i];
					}
				}
				

				int id = max + 1;

				idCorrente ="K"+id;
				
			}else {

				idCorrente="K1";
			}

			return idCorrente;



		}



	}