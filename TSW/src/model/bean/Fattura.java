package model.bean;

public class Fattura {
	
	private int codiceFattura;
	private int codiceOrdine;
	
	public Fattura(int codiceFattura,int codiceOrdine) {
		this.codiceFattura=codiceFattura;
		this.codiceOrdine=codiceOrdine;
	}
	
	public Fattura() {
		this.codiceFattura=codiceFattura;
		this.codiceOrdine=codiceOrdine;
	}

	public int getCodiceFattura() {
		return codiceFattura;
	}

	public void setCodiceFattura(int codiceFattura) {
		this.codiceFattura = codiceFattura;
	}

	public int getCodiceOrdine() {
		return codiceOrdine;
	}

	public void setCodiceOrdine(int codiceOrdine) {
		this.codiceOrdine = codiceOrdine;
	}

	
	public String toString() {
		return "Fattura [codiceFattura=" + codiceFattura + ", codiceOrdine=" + codiceOrdine + "]";
	}
	
	
	
	
	

}
