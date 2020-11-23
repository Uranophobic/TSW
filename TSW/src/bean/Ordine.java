package model.bean;

public class Ordine {

	private String codiceOrdine;
	private String emailUtente;
	private double importoTot;
	private String dataOrdine;  


	public Ordine() {

		this.codiceOrdine = codiceOrdine;
		this.emailUtente = emailUtente;
		this.importoTot = importoTot;
		this.dataOrdine = dataOrdine;
	}


	public Ordine(String codiceOrdine, String emailUtente, double importoTot, String dataOrdine) {
		this.codiceOrdine = codiceOrdine;
		this.emailUtente = emailUtente;
		this.importoTot = importoTot;
		this.dataOrdine = dataOrdine;
	}


	public String getCodiceOrdine() {
		return codiceOrdine;
	}


	public void setCodiceOrdine(String codiceOrdine) {
		this.codiceOrdine = codiceOrdine;
	}


	public String getEmailUtente() {
		return emailUtente;
	}


	public void setEmailUtente(String emailUtente) {
		this.emailUtente = emailUtente;
	}


	public double getImportoTot() {
		return importoTot;
	}


	public void setImportoTot(double importoTot) {
		this.importoTot = importoTot;
	}


	public String getDataOrdine() {
		return dataOrdine;
	}


	public void setDataOrdine(String dataOrdine) {
		this.dataOrdine = dataOrdine;
	}



	public String toString() {
		return "Ordine [codiceOrdine=" + codiceOrdine + ", emailUtente=" + emailUtente + ", importoTot=" + importoTot
				+ ", dataOrdine=" + dataOrdine + "]";
	}



}
