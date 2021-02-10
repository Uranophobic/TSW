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

import bean.Prodotto;
import model.ProdottoModel;
import modelDS.ProdottoModelDS;

/**
 * Servlet implementation class amministratoreServlet
 */
@WebServlet("/amministratore")
public class amministratoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProdottoModel prodModel=new ProdottoModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public amministratoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneCapo = request.getParameter("azioneCapo");
		System.out.println("Azione capo selezionata: " + azioneCapo);
		
		if(azioneCapo.equals("visualizzaProd")) {
			
			ArrayList<Prodotto> catalogo= (ArrayList<Prodotto>) request.getSession().getAttribute("catalogoSessione");
			ArrayList<Prodotto> allProdotti= new ArrayList<Prodotto>();
			
			try {
				allProdotti=prodModel.doRetrieveAll("idProdotto");
				request.getSession().setAttribute("catalogoSessione", allProdotti);
				System.out.println("catalogo (allProdotti): "+allProdotti);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher =request.getRequestDispatcher("amministratore.jsp");
			dispatcher.forward(request, response);
			
		}
		
		if(azioneCapo.equals("aggiungiProd")) {
			
			
		}
	
		if(azioneCapo.equals("prendiProd")) {
			System.out.println("sono in modifica prodotto");
			
			ArrayList<Prodotto> catalogo= (ArrayList<Prodotto>) request.getSession().getAttribute("catalogoSessione");
			String idProdCapo=request.getParameter("idProdCapo");
			System.out.println("id del prodotto passato: "+idProdCapo);
		
			
			try {
				Prodotto prodotto=prodModel.doRetrieveByKey(idProdCapo);
				System.out.println("prodotto cercato: "+prodotto);
			
				request.getSession().setAttribute("prodDaMod", prodotto);
					/*
					String idProdotto=request.getParameter("idProdotto");
					String immaginePath=request.getParameter("imgProd");
					String nome=request.getParameter("nome");
					String descrizione=request.getParameter("descrizione");
					String categoria=request.getParameter("categoria");
					double prezzo=Double.parseDouble(request.getParameter("prezzo"));
					double iva=Double.parseDouble(request.getParameter("iva"));
					double sconto=Double.parseDouble(request.getParameter("sconto"));
					
					System.out.println("prodotto e nome: "+idProdotto+nome);
					
					
					Prodotto p=new Prodotto();
					p.setIdProdotto(idProdotto);
					p.setImmaginePath(immaginePath);
					p.setNome(nome);
					p.setDescrizione(descrizione);
					p.setCategoria(categoria);
					p.setPrezzo(prezzo);
					p.setSconto(sconto);
					p.setIva(iva);
					
					System.out.println("prodottoModificato: "+p);
						prodModel.doUpdate(p);
				
			*/
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			RequestDispatcher dispatcher=request.getRequestDispatcher("modificaProdAmm.jsp");
			dispatcher.forward(request, response);
			
			
			}
		if(azioneCapo.equals("modificaProd")) {
			
			Prodotto prodDaMod=(Prodotto)request.getSession().getAttribute("prodDaMod");
			try {
			Prodotto p=prodModel.doRetrieveByKey(prodDaMod.getIdProdotto());
			//String idProdotto=request.getParameter("idProdotto");
			String immaginePath=request.getParameter("imgProd");
			String nome=request.getParameter("nome");
			String descrizione=request.getParameter("descrizione");
			String categoria=request.getParameter("categoria");
			double prezzo=Double.parseDouble(request.getParameter("prezzo"));
			double iva=Double.parseDouble(request.getParameter("iva"));
			double sconto=Double.parseDouble(request.getParameter("sconto"));
			
			System.out.println("prodotto e nome: "+nome);
			
			
			
			//p.setIdProdotto(idProdotto);
			p.setImmaginePath(immaginePath);
			p.setNome(nome);
			p.setDescrizione(descrizione);
			p.setCategoria(categoria);
			p.setPrezzo(prezzo);
			p.setSconto(sconto);
			p.setIva(iva);
			
			System.out.println("prodottoModificato: "+p);
				prodModel.doUpdate(p);
		
	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			getServletContext().getRequestDispatcher("/amministratore.jsp").forward(request, response);
		}
					
				
			
			
			

		
		if(azioneCapo.equals("eliminaProd")) {
			
		}
		
		if(azioneCapo.equals("visualizzaOrdini")) {
			
		}
	
	}

}
