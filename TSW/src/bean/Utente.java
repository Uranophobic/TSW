package model.bean;
/*
 * Aggiungi toString e metodi get e set per dataDiNascita
 */

public class Utente {
	private String email; 
	private String password; 
	private String nome; 
	private String cognome; 
	private String dataDiNascita;
	private String telefono; 
	private int numeroCarta; 
	private String indirizzo;


	public Utente(String email, String password) {
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.telefono = telefono;
		this.numeroCarta = numeroCarta;
		this.indirizzo = indirizzo;
	}


	public Utente(String email, String password, String nome, String cognome, String telefono, String datiPagamento,
			String datiSpedizione) {
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.telefono = telefono;
		this.numeroCarta = numeroCarta;
		this.indirizzo = indirizzo;
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


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public int getNumeroCarta() {
		return numeroCarta;
	}


	public void setNumeroCarta(int numeroCarta) {
		this.numeroCarta = numeroCarta;
	}


	public String getIndirzzo() {
		return indirizzo;
	}


	public void setIndirizzo(String datiSpedizione) {
		this.indirizzo = datiSpedizione;
	}

	public String getDataDiNascita()
	{
		return dataDiNascita;
	}

	public void setDataDiNascita(String dataDiNascita)
	{
		this.dataDiNascita=dataDiNascita;
	}



	public String toString() {
		return "Utente [email=" + email + ", password=" + password + ", nome=" + nome + ", cognome=" + cognome
				+ ", dataDiNascita=" + dataDiNascita + ", telefono=" + telefono + ", numeroCarta=" + numeroCarta
				+ ", indirizzo=" + indirizzo + "]";
	}



}

