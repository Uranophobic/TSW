package bean;

public class Wishlist {
	
	private String idWish;
	private String codiceProdotto;
	private String email;
	
	public Wishlist() {
		this.idWish=idWish;
		this.codiceProdotto=codiceProdotto;
		this.email = email;
	}
	
	public Wishlist(String idWish,String codiceProdotto) {
		this.idWish=idWish;
		this.codiceProdotto=codiceProdotto;
		this.email = email;
	}

	public String getIdWish() {
		return idWish;
	}

	public void setIdWish(String idWish) {
		this.idWish = idWish;
	}

	public String getCodiceProdotto() {
		return codiceProdotto;
	}

	public void setCodiceProdotto(String codiceProdotto) {
		this.codiceProdotto = codiceProdotto;
	}
	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Wishlist [idWish=" + idWish + ", codiceProdotto=" + codiceProdotto + ", email=" + email + "]";
	}


	

}
