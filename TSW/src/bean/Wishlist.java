package bean;

public class Wishlist {
	
	private String idWish;
	private String codiceProdotto;
	
	public Wishlist() {
		this.idWish=idWish;
		this.codiceProdotto=codiceProdotto;
	}
	
	public Wishlist(String idWish,String codiceProdotto) {
		this.idWish=idWish;
		this.codiceProdotto=codiceProdotto;
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

	@Override
	public String toString() {
		return "Wishlist [idWish=" + idWish + ", codiceProdotto=" + codiceProdotto + "]";
	}
	

}
