package bean;

public class Composizione {
	
	private String codiceOrdine; 
	private String codiceProd;
	private int quantit�;
	
	public Composizione() {
		this.codiceOrdine = codiceOrdine;
		this.codiceProd = codiceProd;
		this.quantit�=quantit�;
	}

	
	public Composizione(String codiceOrdine, String codiceProd, int quantit�) {
		this.codiceOrdine = codiceOrdine;
		this.codiceProd = codiceProd;
		this.quantit�=quantit�;
	}


	public String getCodiceOrdine() {
		return codiceOrdine;
	}


	public void setCodiceOrdine(String codiceOrdine) {
		this.codiceOrdine = codiceOrdine;
	}


	public String getCodiceProd() {
		return codiceProd;
	}


	public void setCodiceProd(String codiceProd) {
		this.codiceProd = codiceProd;
	}
	
	
	public int getQuantit�() {
		return quantit�;
	}


	public void setQuantit�(int quantit�) {
		this.quantit� = quantit�;
	}


	public String toString() {
		return "Composizione [codiceOrdine=" + codiceOrdine + ", codiceProd=" + codiceProd + "]";
	}

	
	
	
	
}
