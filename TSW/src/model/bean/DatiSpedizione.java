package model.bean;

public class DatiSpedizione {

	private String indirizzo;
	private String email;

	public DatiSpedizione() {
		this.indirizzo=indirizzo;
		this.email=email;
	}

	public DatiSpedizione(String indirizzo,String email) {
		this.indirizzo=indirizzo;
		this.email=email;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo=indirizzo;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email=email;
	}


	public String toString() {
		return "DatiSpedizione [indirizzo=" + indirizzo + ", email=" + email + "]";
	}



}
