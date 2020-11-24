package bean;

public class Prodotto {
	private String codiceProdotto;
	private String nomeProdotto;
	private String descrizione;
	private double prezzo;
	private String categoria;
	private double percentualeSconto;
	private String immaginePath;



	public Prodotto() {
		this.codiceProdotto = codiceProdotto;
		this.nomeProdotto = nomeProdotto;
		this.descrizione = descrizione;
		this.prezzo = prezzo;
		this.categoria = categoria;
		this.percentualeSconto = percentualeSconto;
		this.immaginePath=immaginePath;
	}



	public Prodotto(String codiceProdotto, String nomeProdotto, String descrizione, double prezzo, String categoria,
			double percentualeSconto,String immaginePath) {
		this.codiceProdotto = codiceProdotto;
		this.nomeProdotto = nomeProdotto;
		this.descrizione = descrizione;
		this.prezzo = prezzo;
		this.categoria = categoria;
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



	public String getCategoria() {
		return categoria;
	}



	public void setTipo(String categoria) {
		this.categoria= categoria;
	}



	public double getPercentualeSconto() {
		return percentualeSconto;
	}



	public void setPercentualeSconto(double percentualeSconto) {
		this.percentualeSconto = percentualeSconto;
	}




	public String toString() {
		return "Prodotto [codiceProdotto=" + codiceProdotto + ", nomeProdotto=" + nomeProdotto + ", descrizione="
				+ descrizione + ", prezzo=" + prezzo + ", categoria=" + categoria + ", percentualeSconto=" + percentualeSconto
				+ "]";
	}




}
