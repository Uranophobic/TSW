package bean;

public class DatiPagamento {

	private int numeroCarta;
	private String email;
	private String circuito;
	private String scadenzaCarta;
	private int CVV;


	public DatiPagamento(String email,int numeroCarta)
	{
		this.email=email;
		this.numeroCarta=numeroCarta;
		this.circuito=circuito;
		this.scadenzaCarta=scadenzaCarta;
		this.CVV=CVV;
	}

	public DatiPagamento(int numeroCarta, String email, String circuito, String scadenzaCarta,int CVV)
	{
		this.numeroCarta=numeroCarta;
		this.email=email;
		this.circuito=circuito;
		this.scadenzaCarta=scadenzaCarta;
		this.CVV=CVV;
	}


	public int getNumeroCarta()
	{
		return numeroCarta;
	}

	public void setNumeroCarta(int numeroCarta)
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

	public void Circuito(String circuito)
	{
		this.circuito=circuito;
	}

	public String getScadenzaCarta() {
		return scadenzaCarta;
	}

	public void setScadenzaCarta() {
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

