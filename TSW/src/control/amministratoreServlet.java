package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class amministratoreServlet
 */
@WebServlet("/amministratoreServlet")
public class amministratoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
			
		}
		
		if(azioneCapo.equals("aggiungiProd")) {
			
		}
	
		if(azioneCapo.equals("modificaProd")) {
			
		}
		
		if(azioneCapo.equals("eliminaProd")) {
			
		}
		
		if(azioneCapo.equals("visualizzaOrdini")) {
			
		}
	
	}

}
