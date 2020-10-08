package model.bean;

public class Composizione {
	
	private String codiceOrdine; 
	private String codiceProd;
	
	public Composizione() {
		this.codiceOrdine = codiceOrdine;
		this.codiceProd = codiceProd;
	}

	
	public Composizione(String codiceOrdine, String codiceProd) {
		this.codiceOrdine = codiceOrdine;
		this.codiceProd = codiceProd;
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


	
	public String toString() {
		return "Composizione [codiceOrdine=" + codiceOrdine + ", codiceProd=" + codiceProd + "]";
	}

	
	
	
	
}
