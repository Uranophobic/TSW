package bean;

public class DatiPagamento {

	private String numeroCarta;
	private String email;
	private String circuito;
	private String scadenzaCarta;
	private int CVV;


	public DatiPagamento()
	{
		this.email=email;
		this.numeroCarta=numeroCarta;
		this.circuito=circuito;
		this.scadenzaCarta=scadenzaCarta;
		this.CVV=CVV;
	}

	public DatiPagamento(String numeroCarta, String email, String circuito, String scadenzaCarta,int CVV)
	{
		this.numeroCarta=numeroCarta;
		this.email=email;
		this.circuito=circuito;
		this.scadenzaCarta=scadenzaCarta;
		this.CVV=CVV;
	}


	public String getNumeroCarta()
	{
		return numeroCarta;
	}

	public void setNumeroCarta(String numeroCarta)
	{
		this.numeroCarta=numeroCarta;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email=email;
	}


	public String getCircuito() {
		return circuito;
	}

	public void setCircuito(String circuito)
	{
		this.circuito=circuito;
	}

	public String getScadenzaCarta() {
		return scadenzaCarta;
	}

	public void setScadenzaCarta(String scadenzaCarta) {
		this.scadenzaCarta=scadenzaCarta;
	}

	public int getCVV() {
		return CVV;
	}

	public void setCVV(int CVV) {
		this.CVV=CVV;
	}


	public String toString() {
		return "DatiPagamento [numeroCarta=" + numeroCarta + ", email=" + email + ", circuito=" + circuito
				+ ", scadenzaCarta=" + scadenzaCarta + ", CVV=" + CVV + "]";
	}


}

