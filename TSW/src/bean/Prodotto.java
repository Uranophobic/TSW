package bean;

public class Prodotto {
	private String codiceProdotto;
	private String nomeProdotto;
	private String descrizione;
	private double prezzo;
	private String tipo;
	private double percentualeSconto;
	private String immaginePath;



	public Prodotto() {
		this.codiceProdotto = codiceProdotto;
		this.nomeProdotto = nomeProdotto;
		this.descrizione = descrizione;
		this.prezzo = prezzo;
		this.tipo = tipo;
		this.percentualeSconto = percentualeSconto;
		this.immaginePath=immaginePath;
	}



	public Prodotto(String codiceProdotto, String nomeProdotto, String descrizione, double prezzo, String tipo,
			double percentualeSconto,String immaginePath) {
		this.codiceProdotto = codiceProdotto;
		this.nomeProdotto = nomeProdotto;
		this.descrizione = descrizione;
		this.prezzo = prezzo;
		this.tipo = tipo;
		this.percentualeSconto = percentualeSconto;
		this.immaginePath=immaginePath;
	}



	public String getImmaginePath() {
		return immaginePath;
	}


	public void setImmaginePath(String immaginePath) {
		this.immaginePath=immaginePath;
	}


	public String getCodiceProdotto() {
		return codiceProdotto;
	}



	public void setCodiceProdotto(String codiceProdotto) {
		this.codiceProdotto = codiceProdotto;
	}



	public String getNomeProdotto() {
		return nomeProdotto;
	}



	public void setNomeProdotto(String nomeProdotto) {
		this.nomeProdotto = nomeProdotto;
	}



	public String getDescrizione() {
		return descrizione;
	}



	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}



	public double getPrezzo() {
		return prezzo;
	}



	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}



	public String getTipo() {
		return tipo;
	}



	public void setTipo(String tipo) {
		this.tipo = tipo;
	}



	public double getPercentualeSconto() {
		return percentualeSconto;
	}



	public void setPercentualeSconto(double percentualeSconto) {
		this.percentualeSconto = percentualeSconto;
	}




	public String toString() {
		return "Prodotto [codiceProdotto=" + codiceProdotto + ", nomeProdotto=" + nomeProdotto + ", descrizione="
				+ descrizione + ", prezzo=" + prezzo + ", tipo=" + tipo + ", percentualeSconto=" + percentualeSconto
				+ "]";
	}




}
