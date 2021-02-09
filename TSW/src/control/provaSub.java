package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class provaSub
 */
@WebServlet("/provaSub")
public class provaSub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public provaSub() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ultimoId = "K711";
		String idCorrente="";
		String k="",numero="";
		int valentina=0;

		int uno=ultimoId.indexOf("K");
		k=ultimoId.substring(0,uno);
		String runo=ultimoId.substring(uno+1);
		//abbiamo solo diviso la k
		numero=runo.substring(0);
		//abbiamo preso il numero
		System.out.println("k: "+k);
		System.out.println("numero: "+numero);
		valentina=Integer.parseInt(numero);
		valentina=valentina+1;
		idCorrente="K"+(valentina);
		System.out.println("idCorrente: "+idCorrente);
		
		// SECONDA PARTE ////////////////////////////////////////////////////////////////////////////////////////
		
		String k2="", numero2="";
		k2 = ultimoId.substring(0,1);
		System.out.println(" K2 " + k2);
		int[] idNoK = new int[5];
		idNoK[0]=10;//initialization  
		idNoK[1]=20;  
		idNoK[2]=70;  
		idNoK[3]=400;  
		int y=0;
		int size =idNoK.length;
		numero2 = ultimoId.substring(1);
		int n = Integer.parseInt(numero2);
		while(idNoK[y]!=0) {
			System.out.println(idNoK[y]);
			idNoK[y]=n;
			y++;
		}
		
		n = n+1;
		System.out.println("numero2 : " + numero2);
	
		int max = idNoK[0];
		for ( int i=0; i<idNoK.length; i++) {
			if(idNoK[i]>max) {
				max = idNoK[i];
			}
		}
		 System.out.println("max"+ max);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
