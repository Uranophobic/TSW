package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InformazioniServlet
 */
@WebServlet("/InformazioniServlet")
public class InformazioniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String f= request.getParameter("informazioni");
		
		if(f.equals("assistenza")) {
			getServletContext().getRequestDispatcher("/assistenza.jsp").forward(request, response);

	

		}else if(f.equals("chisiamo")) {
			getServletContext().getRequestDispatcher("/chiSiamo.jsp").forward(request, response);

		}else if(f.equals("comefunziona")) {
			getServletContext().getRequestDispatcher("/comeFunziona.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
