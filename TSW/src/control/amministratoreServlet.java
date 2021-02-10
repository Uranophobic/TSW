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
	
		if(azioneCapo.equals("modificaProd")) {
			System.out.println("sono in modifica prodotto");
			
			ArrayList<Prodotto> catalogo= (ArrayList<Prodotto>) request.getSession().getAttribute("catalogoSessione");
			String idProdCapo=request.getParameter("idProdCapo");
			System.out.println("id del prodotto passato: "+idProdCapo);
			
			
			for(int i=0;i<catalogo.size();i++) {
				if(catalogo.get(i).getIdProdotto().equals(idProdCapo)) {
					System.out.println("gli id combaciano");
					
					
					

					
					
				}
			}
			
			
		}
		
		if(azioneCapo.equals("eliminaProd")) {
			
		}
		
		if(azioneCapo.equals("visualizzaOrdini")) {
			
		}
	
	}

}
