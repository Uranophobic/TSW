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
@WebServlet("/procedi")
public class ProcediOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProdottoModel prodottoModel = new ProdottoModelDS();
	static OrdineModel ordineModel = new OrdineModelDS();
	static FatturaModel fatturaModel = new FatturaModelDS();
	static ComposizioneModel composizioneModel = new ComposizioneModelDS();

	//Utente utente = new Utente();
	//Ordine ordine = new Ordine();
	Prodotto prod = new Prodotto();

	double prezzoTot = 0;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stu
		//test per vedere se stampava la data
		String data = dataOggi();
		System.out.println(data);
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
						prezzo = prezzo - ( prezzo * sconto / 100) ; 
						prezzoTot = prezzo * carrello.get(i).getQuantità();
					} else {
						prezzoTot = prezzoTot + carrello.get(i).getPrezzoUnitario() * carrello.get(i).getQuantità();
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
				System.out.println("composizione: "+compo.toString());
				carrello.add(compo);
				composizioneModel.doSave(compo);
				}
				
				
				
				ordini.add(ordine);
				ordineModel.doSave(ordine);
				
				
				request.getSession().setAttribute("ordiniSessione", ordini);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(" fatturajsp.jsp ");  
			dispatcher.forward(request, response);



		}

		/*
			//una volta finito di settare l'ordine bisogna visualizzare fattura 
			dispatcher = request.getRequestDispatcher("fattura.jsp");
			dispatcher.forward(request, response);
		}

*/
		if(azioneOrdine.equals("visualizzaFattura")) {
			//passo tutto alla jsp con la sessione
			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione"); 
			
			

			RequestDispatcher dispatcher = request.getRequestDispatcher(" fatturajsp.jsp ");  
			dispatcher.forward(request, response);
		}

		 

	}







	private String dataOggi(){
		Date oggi = new Date(); // Data di oggi
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); // Qui decido il formato di visualizzazione
		String dataOggi = sdf.format( oggi );
		return dataOggi;		
	} 

	public String newId(ArrayList<Ordine>allOrdini) {
		String idCorrente="";
			ArrayList<Ordine> all=allOrdini;
			
			System.out.println("Array list ALL: \n"+all);
			
			if(all.size()!=0) {
				System.out.println("sono nell'if di new id\n");
				for(int i=0; i<all.size();i++) {
					System.out.println("sono nel for di new id\n");
					if(i==all.size()-1) {
						System.out.println("sono nell if che cerco l'ultimo elemento\n");
						String ultimoid=all.get(i).getIdOrdine();
						/*
						String k="",numero="";
						int valentina=0;

						int uno=ultimoid.indexOf("K");
						k=ultimoid.substring(0,uno);
						String runo=ultimoid.substring(uno+1);
						//abbiamo solo diviso la k
						numero=runo.substring(0);
						//abbiamo preso il numero
						System.out.println("k: "+k);
						System.out.println("numero: "+numero);
						valentina=Integer.parseInt(numero);
						valentina=valentina+1;
						idCorrente="K"+(valentina);
						System.out.println("idCorrente: "+idCorrente);
*/

					}
				}
			}else {

				idCorrente="K1";
			}
		
		return idCorrente;
	


	}



}