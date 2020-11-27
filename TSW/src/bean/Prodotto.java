package bean;

public class Prodotto {
	private String idProdotto;
	private String immaginePath;
	private String nome;
	private String descrizione;
	private String categoria;
	private double prezzo;
	/*
	 * su prodotto e composizione o solo composizione
	 */
	private double iva;
	private double sconto;//CAMBIA SU DATABASE DA VARCHAR A DOUBLE MA PIU LUNGO BISOGNA MODIFICARE I VALORI




	public Prodotto() {
		this.idProdotto = idProdotto;
		this.immaginePath=immaginePath;
		this.nome = nome;
		this.descrizione = descrizione;
		this.categoria = categoria;
		this.prezzo = prezzo;
		this.iva=iva;
		this.sconto = sconto;

	}



	public Prodotto(String idProdotto,String immaginePath, String nomw, String descrizione,String categoria,double prezzo,double iva, 
			double sconto) {
		this.idProdotto = idProdotto;
		this.immaginePath=immaginePath;
		this.nome = nome;
		this.descrizione = descrizione;
		this.categoria = categoria;
		this.prezzo = prezzo;
		this.iva=iva;
		this.sconto = sconto;

	}


	public String getImmaginePath() {
		return immaginePath;
	}

	public void setImmaginePath(String immaginePath) {
		this.immaginePath=immaginePath;
	}

	public String getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(String idProdotto) {
		this.idProdotto = idProdotto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
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

	public void setCategoria(String categoria) {
		this.categoria= categoria;
	}

	public double getSconto() {
		return sconto;
	}

	public void setSconto(double sconto) {
		this.sconto = sconto;
	}

	public double getIva() {
		return iva;
	}

	public void setIva(double iva) {
		this.iva = iva;
	}

	public String toString() {
		return "Prodotto [idProdotto=" + idProdotto + ", immaginePath=" + immaginePath + ", nome=" + nome
				+ ", descrizione=" + descrizione + ", categoria=" + categoria + ", prezzo=" + prezzo + ", iva=" + iva
				+ ", sconto=" + sconto + "]";
	}
}
