package bean;

public class Composizione {
	
	private String codiceOrdine; 
	private String codiceProdotto;
	private int quantita;
	private double prezzoUnitario;
	private double scontoAttuale; // cambia su workbench 
	private double iva;
	
	public Composizione() {
		this.codiceOrdine = codiceOrdine;
		this.codiceProdotto = codiceProdotto;
		this.quantita=quantita;
		this.prezzoUnitario=prezzoUnitario;
		this.scontoAttuale=scontoAttuale;
		this.iva=iva;
	}

	
	public Composizione(String codiceOrdine, String codiceProd, int quantita,double prezzoUnitario,double scontoAttuale,double iva) {
		this.codiceOrdine = codiceOrdine;
		this.codiceProdotto = codiceProdotto;
		this.quantita=quantita;
		this.prezzoUnitario=prezzoUnitario;
		this.scontoAttuale=scontoAttuale;
		this.iva=iva;
	}


	public String getCodiceOrdine() {
		return codiceOrdine;
	}


	public void setCodiceOrdine(String codiceOrdine) {
		this.codiceOrdine = codiceOrdine;
	}


	public String getCodiceProdotto() {
		return codiceProdotto;
	}


	public void setCodiceProdotto(String codiceProdotto) {
		this.codiceProdotto = codiceProdotto;
	}


	public int getQuantità() {
		return quantita;
	}


	public void setQuantità(int quantita) {
		this.quantita = quantita;
	}


	public double getPrezzoUnitario() {
		return prezzoUnitario;
	}


	public void setPrezzoUnitario(double prezzoUnitario) {
		this.prezzoUnitario = prezzoUnitario;
	}


	public double getScontoAttuale() {
		return scontoAttuale;
	}


	public void setScontoAttuale(double scontoAttuale) {
		this.scontoAttuale = scontoAttuale;
	}


	public double getIva() {
		return iva;
	}


	public void setIva(double iva) {
		this.iva = iva;
	}


	@Override
	public String toString() {
		return "Composizione [codiceOrdine=" + codiceOrdine + ", codiceProdotto=" + codiceProdotto + ", quantità="
				+ quantita + ", prezzoUnitario=" + prezzoUnitario + ", scontoAttuale=" + scontoAttuale + ", iva=" + iva
				+ "]";
	}

	

}