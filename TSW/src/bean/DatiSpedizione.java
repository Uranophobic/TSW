package bean;

public class DatiSpedizione {

	private String via;
	private String citta;
	private int cap;
	private String provincia;
	private String email;

	public DatiSpedizione() {
		this.via=via;
		this.citta=citta;
		this.cap=cap;
		this.provincia=provincia;
		this.email=email;
	}

	public DatiSpedizione(String via,String citta,int cap,String provincia,String email) {
		this.via=via;
		this.citta=citta;
		this.cap=cap;
		this.provincia=provincia;
		this.email=email;
	}

	

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email=email;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public int getCap() {
		return cap;
	}

	public void setCap(int cap) {
		this.cap = cap;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	@Override
	public String toString() {
		return "DatiSpedizione [via=" + via + ", citta=" + citta + ", cap=" + cap + ", provincia=" + provincia
				+ ", email=" + email + "]";
	}


	



}
