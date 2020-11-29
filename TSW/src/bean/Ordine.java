package bean;

public class Ordine {

	private String idOrdine;
	private String emailUtente;
	private String dataOrdine; 
	private double importoTot;
	 


	public Ordine() {

		this.idOrdine = idOrdine;
		this.emailUtente = emailUtente;
		this.importoTot = importoTot;
		this.dataOrdine = dataOrdine;
	}


	public Ordine(String idOrdine, String emailUtente, String dataOrdine,double importoTot) {
		this.idOrdine = idOrdine;
		this.emailUtente = emailUtente;
		this.dataOrdine = dataOrdine;
		this.importoTot = importoTot;
	}


	public String getIdOrdine() {
		return idOrdine;
	}


	public void setIdOrdine(String idOrdine) {
		this.idOrdine = idOrdine;
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
		return "Ordine [idOrdine=" + idOrdine + ", emailUtente=" + emailUtente + ", importoTot=" + importoTot
				+ ", dataOrdine=" + dataOrdine + "]";
	}



}
