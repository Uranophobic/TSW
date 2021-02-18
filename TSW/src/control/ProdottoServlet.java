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

import bean.Composizione;
import bean.Prodotto;
import bean.Utente;
import modelDS.ProdottoModelDS;
/**
 * Servlet implementation class prodottoServlete
 */
@WebServlet("/prodotto")
public class ProdottoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProdottoModelDS prodottoModel=new ProdottoModelDS();
	Utente utente = new Utente();
	Prodotto prodotto=new Prodotto();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneP = request.getParameter("azioneP");
		System.out.println("Azione selezionata: " + azioneP);

		if(azioneP.equals("visualizzaCatalogo")) {
			System.out.println("sono in visualizzaCatalogo");
			try {
				ArrayList<Prodotto> catalogo=new ArrayList<Prodotto>();
				catalogo=prodottoModel.doRetrieveAll("idProdotto");
				request.getSession().setAttribute("catalogoSessione", catalogo);
				getServletContext().getRequestDispatcher("/catalogo.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}	

		}

		if(azioneP.equals("visualizzaProdotto")) {
			System.out.println("sono in visualizzaProdotto");
			String idProdotto= request.getParameter("idProdotto");
			System.out.println("CODICE PRODOTTO CLICCATO: " + idProdotto );
			try {
				Prodotto prodottoVisualizzato=prodottoModel.doRetrieveByKey(idProdotto);

				request.getSession().setAttribute("prodottoVisualizzato", prodottoVisualizzato);
				RequestDispatcher view=request.getRequestDispatcher("visualizzaProdotto.jsp");
				view.forward(request, response);

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}





		if(azioneP.equals("ricerca")) {
			String insProd=request.getParameter("insProd");
			System.out.println("prodotto inserito: " + insProd);
			try {
				ArrayList<Prodotto> AllProdotti=prodottoModel.doRetrieveAll("nome");//essere sicuri
				ArrayList<Prodotto>risultatiRicerca=new ArrayList<Prodotto>();

				for(Prodotto prodotto: AllProdotti) {
					if(prodotto.getNome().equals(insProd)) {
						Prodotto p = new Prodotto();
						p.setCategoria(prodotto.getCategoria());
						p.setDescrizione(prodotto.getDescrizione());
						p.setIdProdotto(prodotto.getIdProdotto());
						p.setImmaginePath(prodotto.getImmaginePath());
						p.setNome(prodotto.getNome());
						p.setPrezzo(prodotto.getPrezzo());
						p.setSconto(prodotto.getSconto());
						p.setIva(prodotto.getIva());
						System.out.println("PRODOTTO CHE ABBIAMO SETTATO "+ p);
						AllProdotti.add(p);

					}

				}

				if(risultatiRicerca.size()!=0) {
					/*	
					 * Questo if va a controllare che l'array risultati ricerca non sia vuoto
					 * Quindi in risultatiricerca ci sta il risultato o meglio i prodotti che l'utente ha ricercato
					 * se è vuoto vuol dire che quel prodotto non è presente. 
					 * Ma se così non fosse procediamo
					 * 
					 */
					System.out.println("prodotto trovato");
					request.getSession().setAttribute("risultatiRicerca",risultatiRicerca);
					System.out.println("risultati ricerca : " + risultatiRicerca);
					RequestDispatcher dispatcher=request.getRequestDispatcher("catalogo.jsp");//controlla nome jsp
					dispatcher.forward(request, response);

				}else {//se cosi non fosse..., cioè se risultatiRicerca è vuoto 
					System.out.println("prodotto non trovato");
					//RequestDispatcher dispatcher=request.getRequestDispatcher("404Error.jsp");//controllare nome jsp
					//dispatcher.forward(request, response);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}

		}


		if(azioneP.equals("agricoltura")) {

			System.out.println("sono in agricoltura");
			try {
				//String categoria=request.getParameter("categoria");
				ArrayList<Prodotto> allCategoria=new ArrayList<Prodotto>();
				ArrayList<Prodotto> prodottiCategoria=new ArrayList<Prodotto>();


				allCategoria=prodottoModel.doRetrieveAll("categoria");
				for(int i=0;i<allCategoria.size();i++) {

					if(allCategoria.get(i).getCategoria().equals("Agricoltura")) {



						Prodotto prod=new Prodotto();
						prod.setCategoria(allCategoria.get(i).getCategoria());
						prod.setDescrizione(allCategoria.get(i).getDescrizione());
						prod.setIdProdotto(allCategoria.get(i).getIdProdotto());
						prod.setImmaginePath(allCategoria.get(i).getImmaginePath());
						prod.setIva(allCategoria.get(i).getIva());
						prod.setNome(allCategoria.get(i).getNome());
						prod.setPrezzo(allCategoria.get(i).getPrezzo());
						prod.setSconto(allCategoria.get(i).getSconto());

						prodottiCategoria.add(prod);
					}


				}
				System.out.println("prodotti categoria servlet"+prodottiCategoria);

				request.getSession().setAttribute("menuSessione", prodottiCategoria);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			RequestDispatcher view=request.getRequestDispatcher("catalogo2.jsp");
			view.forward(request, response);
		}

		//cura
		if(azioneP.equals("cura")) {

			System.out.println("sono in cura");
			try {
				//String categoria=request.getParameter("categoria");
				ArrayList<Prodotto> allCategoria=new ArrayList<Prodotto>();
				ArrayList<Prodotto> prodottiCategoria=new ArrayList<Prodotto>();


				allCategoria=prodottoModel.doRetrieveAll("categoria");
				for(int i=0;i<allCategoria.size();i++) {

					if(allCategoria.get(i).getCategoria().equals("Cura")) {



						Prodotto prod=new Prodotto();
						prod.setCategoria(allCategoria.get(i).getCategoria());
						prod.setDescrizione(allCategoria.get(i).getDescrizione());
						prod.setIdProdotto(allCategoria.get(i).getIdProdotto());
						prod.setImmaginePath(allCategoria.get(i).getImmaginePath());
						prod.setIva(allCategoria.get(i).getIva());
						prod.setNome(allCategoria.get(i).getNome());
						prod.setPrezzo(allCategoria.get(i).getPrezzo());
						prod.setSconto(allCategoria.get(i).getSconto());

						prodottiCategoria.add(prod);
					}


				}
				System.out.println("prodotti categoria servlet"+prodottiCategoria);

				request.getSession().setAttribute("menuSessione", prodottiCategoria);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			RequestDispatcher view=request.getRequestDispatcher("catalogo2.jsp");
			view.forward(request, response);
		}



		//giardinaggio
		if(azioneP.equals("giardinaggio")) {

			System.out.println("sono in giardinaggio");
			try {
				//String categoria=request.getParameter("categoria");
				ArrayList<Prodotto> allCategoria=new ArrayList<Prodotto>();
				ArrayList<Prodotto> prodottiCategoria=new ArrayList<Prodotto>();


				allCategoria=prodottoModel.doRetrieveAll("categoria");
				for(int i=0;i<allCategoria.size();i++) {

					if(allCategoria.get(i).getCategoria().equals("Giardinaggio")) {



						Prodotto prod=new Prodotto();
						prod.setCategoria(allCategoria.get(i).getCategoria());
						prod.setDescrizione(allCategoria.get(i).getDescrizione());
						prod.setIdProdotto(allCategoria.get(i).getIdProdotto());
						prod.setImmaginePath(allCategoria.get(i).getImmaginePath());
						prod.setIva(allCategoria.get(i).getIva());
						prod.setNome(allCategoria.get(i).getNome());
						prod.setPrezzo(allCategoria.get(i).getPrezzo());
						prod.setSconto(allCategoria.get(i).getSconto());

						prodottiCategoria.add(prod);
					}


				}
				System.out.println("prodotti categoria servlet"+prodottiCategoria);

				request.getSession().setAttribute("menuSessione", prodottiCategoria);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			RequestDispatcher view=request.getRequestDispatcher("catalogo2.jsp");
			view.forward(request, response);
		}


		//sconto
		if(azioneP.equals("sconto")) {
			try {
				ArrayList<Prodotto> allCategoria=new ArrayList<Prodotto>();
				ArrayList<Prodotto> prodottiCategoria=new ArrayList<Prodotto>();
				
				allCategoria=prodottoModel.doRetrieveAll("sconto");
				for(int i=0;i<allCategoria.size();i++) {
					if(allCategoria.get(i).getSconto() > 0 ) {
						
						Prodotto prod=new Prodotto();
						prod.setCategoria(allCategoria.get(i).getCategoria());
						prod.setDescrizione(allCategoria.get(i).getDescrizione());
						prod.setIdProdotto(allCategoria.get(i).getIdProdotto());
						prod.setImmaginePath(allCategoria.get(i).getImmaginePath());
						prod.setIva(allCategoria.get(i).getIva());
						prod.setNome(allCategoria.get(i).getNome());
						prod.setPrezzo(allCategoria.get(i).getPrezzo());
						prod.setSconto(allCategoria.get(i).getSconto());

						prodottiCategoria.add(prod);
					}
				}
				
				System.out.println("prodotti SCONTATI"+prodottiCategoria);
				request.getSession().setAttribute("menuSessione", prodottiCategoria);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			RequestDispatcher view=request.getRequestDispatcher("catalogo2.jsp");
			view.forward(request, response);
		}



	}
}
