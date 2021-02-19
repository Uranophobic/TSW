package control;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Ordine;
import bean.Prodotto;
import model.OrdineModel;
import model.ProdottoModel;
import modelDS.OrdineModelDS;
import modelDS.ProdottoModelDS;

/**
 * Servlet implementation class amministratoreServlet
 */
@WebServlet("/amministratore")
public class amministratoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProdottoModel prodModel=new ProdottoModelDS();
	OrdineModel ordiniModel = new OrdineModelDS();
       
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
			try {
			String idProdotto = request.getParameter("idProdotto");
			String immaginePath = request.getParameter("immaginePath");
			String nome = request.getParameter("nome");
			String descrizione = request.getParameter("descrizione");
			String categoria = request.getParameter("categoria");
			double prezzo = Double.parseDouble(request.getParameter("prezzo"));
			double sconto = Double.parseDouble(request.getParameter("sconto"));
			double iva = Double.parseDouble(request.getParameter("iva"));
			
			Prodotto p = new Prodotto();
			p.setCategoria(categoria);
			p.setDescrizione(descrizione);
			p.setIdProdotto(idProdotto);
			p.setImmaginePath(immaginePath);
			p.setIva(iva);
			p.setNome(nome);
			p.setIdProdotto(idProdotto);
			p.setPrezzo(prezzo);
			p.setSconto(sconto);
		
			
			prodModel.doSave(p);
			System.out.println("prod aggiunto " + p );
			
			ArrayList<Prodotto>catalogoPostAdd=prodModel.doRetrieveAll("idProdotto");
			System.out.println("catalogoPostModifica:\n "+catalogoPostAdd);
			request.getSession().setAttribute("catalogoSessione", catalogoPostAdd);
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("amministratore.jsp");
			dispatcher.forward(request, response);
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
					
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("ammModificaProd.jsp");
			dispatcher.forward(request, response);
			
			
			}
		if(azioneCapo.equals("modificaProd")) {
			ArrayList<Prodotto> catalogo=(ArrayList<Prodotto>)request.getSession().getAttribute("catalogoSessione");
			Prodotto prodDaMod=(Prodotto)request.getSession().getAttribute("prodDaMod");
		
			System.out.println("id del prodotto da cercare e che poi e quello che andrà modificato: "+prodDaMod.getIdProdotto());
			
			try {	
			Prodotto p=prodModel.doRetrieveByKey(prodDaMod.getIdProdotto());
			
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
			request.getSession().setAttribute("prodDaMod", p);
			
			ArrayList<Prodotto>catalogoPostModifica=prodModel.doRetrieveAll("idProdotto");
			System.out.println("catalogoPostModifica:\n "+catalogoPostModifica);
			request.getSession().setAttribute("catalogoSessione", catalogoPostModifica);
	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			getServletContext().getRequestDispatcher("/amministratore.jsp").forward(request, response);
		}
					
		
		if(azioneCapo.equals("eliminaProd")) {
			
			ArrayList<Prodotto> catalogo=(ArrayList<Prodotto>)request.getSession().getAttribute("catalogoSessione");
			String id=request.getParameter("id");
			System.out.println("id del prod da eliminare: "+id);
			
			try {
				prodModel.doDelete(id);
				
				for(int i=0;i<catalogo.size();i++) {
					
					if(catalogo.get(i).getIdProdotto().equals(id)) {
						catalogo.remove(i);
					}
				}
				
				request.getSession().removeAttribute("catalogoSessione");
				request.getSession().setAttribute("catalogoSessione", catalogo); //riaggiungiamo tutti i prodotti 
				System.out.println("catalogo dopo eliminazione: "+catalogo);
			
		
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
				getServletContext().getRequestDispatcher("/amministratore.jsp").forward(request, response);
			}
						
					
		if(azioneCapo.equals("visualizzaOrdini")) {
			
			try {
				ArrayList<Ordine> allOrdini = ordiniModel.doRetrieveAll("idOrdine");
				
				request.getSession().setAttribute("ordiniSessione", allOrdini);
				
				System.out.println("ordini nella servlet: " + allOrdini);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("ammVisOrdini.jsp");
			dispatcher.forward(request, response);
		}
		
		
		if(azioneCapo.equals("cercaPerEmail")) {
			String emailCercata = request.getParameter("emailCercata");
			System.out.println("email che ho cercato: " + emailCercata);
			try {
				ArrayList<Ordine> allOrdini = ordiniModel.doRetrieveAll("emailUtente");
				ArrayList<Ordine> ordiniUtente = new ArrayList<Ordine>();
				
				for(int i=0; i<allOrdini.size(); i++) {
					if(allOrdini.get(i).getEmailUtente().equals(emailCercata)) {
						System.out.println("le email combaciano");
						
						Ordine o = new Ordine(); //setto l'ordine dell'utente
						
						o.setDataOrdine(allOrdini.get(i).getDataOrdine());
						o.setEmailUtente(allOrdini.get(i).getEmailUtente());
						o.setIdOrdine(allOrdini.get(i).getIdOrdine());
						o.setImportoTot(allOrdini.get(i).getImportoTot());
						
						ordiniUtente.add(o);
						System.out.println("ordine aggiunto" + o);
					}
				
				
				}
				request.getSession().setAttribute("ordiniCercati", ordiniUtente);	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("risultatiRicerca.jsp");
			dispatcher.forward(request, response);
		}
		
		if(azioneCapo.equals("cercaPerData")) {
			String dataInizio = request.getParameter("dataInizio");
			String dataFine = request.getParameter("dataFine");
			
			String giorno="",mese="",anno="";
			int uno=dataInizio.indexOf("-");
			anno=dataInizio.substring(0,uno);
			String runo=dataInizio.substring(uno+1);
			
			int due=runo.indexOf("-");
			mese=runo.substring(0,due);
			String rdue=runo.substring(due+1);
			
			int tre=rdue.indexOf("-");
			giorno=rdue.substring(0);
			
			String data1=giorno+"-"+mese+"-"+anno;
			System.out.println("data inizio: giorno-mese-anno (substring)"+giorno+mese+anno);
			
			String giorno2="",mese2="",anno2="";
			int uno2=dataFine.indexOf("-");
			anno2=dataFine.substring(0,uno2);
			String runo2=dataFine.substring(uno2+1);
			
			int due2=runo2.indexOf("-");
			mese2=runo2.substring(0,due2);
			String rdue2=runo2.substring(due2+1);
			
			int tre2=rdue2.indexOf("-");
			giorno2=rdue2.substring(0);
			
			String data2=giorno2+"-"+mese2+"-"+anno2;
			System.out.println("data fine: giorno-mese-anno (substring)"+giorno2+mese2+anno);
			
			System.out.println("data inizio " + dataInizio);
			System.out.println("data fine" + dataFine);
			
			Date dataIn = new Date(); // Data di oggi
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			
			Date dataEnd = new Date();
			
			SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
			try {
				dataIn=sdf.parse(data1);
				dataEnd=sdf2.parse(data2);
				
			
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
			//System.out.println("data inizio dopo di conversione (dataIn)" + dataIn);
			//System.out.println("data inizio dopo di conversione (dataFine)" + dataEnd);
			
		
			try {
				ArrayList<Ordine> allOrdini = ordiniModel.doRetrieveAll("dataOrdine");
				System.out.println("\n\nallOrdini per data:\n "+allOrdini);
				ArrayList<Ordine> ordiniData = new ArrayList<Ordine>();
				
				for(int i=0; i<allOrdini.size(); i++) {
					
					Date dataOrd = new Date(); 
					SimpleDateFormat sdf3 = new SimpleDateFormat("dd-MM-yyyy");
				
					try {
						dataOrd = sdf3.parse(allOrdini.get(i).getDataOrdine());
						//System.out.println("DATA FORMATTATA:" + dataOrd);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
					/*
					 * int resultDataInd=dataIn.compareTo(dataOrd);
					int resutlDataEnd=dataOrd.compareTo(dataEnd);
					
					if(resultDataInd<0) {
						System.out.println("la data trovata e precendente alla data di inizio");
					}else if(resutlDataEnd>0) {
						System.out.println("la data trovata e successiva alla data di fine");
					}
					 */
					
					
					if((dataOrd.equals(dataIn)) || (dataOrd.after(dataIn))) {
						if((dataOrd.equals(dataEnd)) || (dataOrd.before(dataEnd))) {	
					
							Ordine o = new Ordine(); //setto l'ordine dell'utente
							System.out.println("setto l'ordine");
							o.setDataOrdine(allOrdini.get(i).getDataOrdine());
							o.setEmailUtente(allOrdini.get(i).getEmailUtente());
							o.setIdOrdine(allOrdini.get(i).getIdOrdine());
							o.setImportoTot(allOrdini.get(i).getImportoTot());
							ordiniData.add(o);
							System.out.println("ordine settato");
						}
					}
					
				}
				
				request.getSession().setAttribute("ordiniCercatiData", ordiniData);	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("risultatiRicerca2.jsp");
			dispatcher.forward(request, response);
			
		}
	
	}

}
