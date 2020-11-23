package bean;

public class Fattura {

	private String  codiceFattura;
	private String codiceOrdine;

	public Fattura() {
		this.codiceFattura=codiceFattura;
		this.codiceOrdine=codiceOrdine;
	}


	public Fattura(String codiceFattura,String codiceOrdine) {
		this.codiceFattura=codiceFattura;
		this.codiceOrdine=codiceOrdine;
	}


	public String getCodiceFattura() {
		return codiceFattura;
	}

	public void setCodiceFattura(String codiceFattura) {
		this.codiceFattura = codiceFattura;
	}

	public String getCodiceOrdine() {
		return codiceOrdine;
	}

	public void setCodiceOrdine(String codiceOrdine) {
		this.codiceOrdine = codiceOrdine;
	}



	public String toString() {
		return "Fattura [codiceFattura=" + codiceFattura + ", codiceOrdine=" + codiceOrdine + "]";
	}












}
