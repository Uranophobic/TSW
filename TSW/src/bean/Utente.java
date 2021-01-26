package bean;

public class Utente {
	private String email; 
	private String password; 
	private String nome; 
	private String cognome; 
	private String dataDiNascita;
	private String datiPagamento;
	private String datiSpedizione;


	public Utente() {
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.dataDiNascita=dataDiNascita;
		this.datiPagamento=datiPagamento;
		this.datiSpedizione=datiSpedizione;
	}

	public Utente(String email, String password, String nome, String cognome, String dataDiNascita,String datiPagamento,String datiSpedizione)
			 {
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.dataDiNascita=dataDiNascita;
		this.datiPagamento=datiPagamento;
		this.datiSpedizione=datiSpedizione;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getDataDiNascita()
	{
		return dataDiNascita;
	}

	public void setDataDiNascita(String dataDiNascita)
	{
		this.dataDiNascita=dataDiNascita;
	}
	
	
	public String getDatiPagamento() {
		return datiPagamento;
	}

	public void setDatiPagamento(String datiPagamento) {
		this.datiPagamento = datiPagamento;
	}

	public String getDatiSpedizione() {
		return datiSpedizione;
	}

	public void setDatiSpedizione(String datiSpedizione) {
		this.datiSpedizione = datiSpedizione;
	}


	public String toString() {
		return "Utente [email=" + email + ", password=" + password + ", nome=" + nome + ", cognome=" + cognome
				+ ", dataDiNascita=" + dataDiNascita + "]";
	}
}