package bean;

public class Composizione {
	
	private String codiceOrdine; 
	private String codiceProd;
	private int quantità;
	
	public Composizione() {
		this.codiceOrdine = codiceOrdine;
		this.codiceProd = codiceProd;
		this.quantità=quantità;
	}

	
	public Composizione(String codiceOrdine, String codiceProd, int quantità) {
		this.codiceOrdine = codiceOrdine;
		this.codiceProd = codiceProd;
		this.quantità=quantità;
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
	
	
	public int getQuantità() {
		return quantità;
	}


	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}


	public String toString() {
		return "Composizione [codiceOrdine=" + codiceOrdine + ", codiceProd=" + codiceProd + "]";
	}

	
	
	
	
}
