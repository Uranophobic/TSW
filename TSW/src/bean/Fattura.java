package bean;

public class Fattura {

	private String idFattura;
	private String codiceOrdine;

	public Fattura() {
		this.idFattura=idFattura;
		this.codiceOrdine=codiceOrdine;
	}


	public Fattura(String idFattura,String codiceOrdine) {
		this.idFattura=idFattura;
		this.codiceOrdine=codiceOrdine;
	}


	public String getIdFattura() {
		return idFattura;
	}

	public void setIdFattura(String idFattura) {
		this.idFattura = idFattura;
	}

	public String getCodiceOrdine() {
		return codiceOrdine;
	}

	public void setCodiceOrdine(String codiceOrdine) {
		this.codiceOrdine = codiceOrdine;
	}



	public String toString() {
		return "Fattura [idFattura=" + idFattura + ", codiceOrdine=" + codiceOrdine + "]";
	}












}
