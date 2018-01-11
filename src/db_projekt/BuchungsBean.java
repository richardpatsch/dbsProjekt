package db_projekt;

public class BuchungsBean {
	private String SVId;
	private int Schneisennummer;
	private int Buchungsnummer;
	private String Buchungsdatum;
	private String Beginnzeit;
	private String Endzeit;
	
	public String getSVId() {
		return SVId;
	}
	public void setSVId(String sVId) {
		SVId = sVId;
	}
	public int getSchneisennummer() {
		return Schneisennummer;
	}
	public void setSchneisennummer(int schneisennummer) {
		Schneisennummer = schneisennummer;
	}
	public int getBuchungsnummer() {
		return Buchungsnummer;
	}
	public void setBuchungsnummer(int buchungsnummer) {
		Buchungsnummer = buchungsnummer;
	}
	public String getBuchungsdatum() {
		return Buchungsdatum;
	}
	public void setBuchungsdatum(String buchungsdatum) {
		Buchungsdatum = buchungsdatum;
	}
	public String getBeginnzeit() {
		return Beginnzeit;
	}
	public void setBeginnzeit(String beginnzeit) {
		Beginnzeit = beginnzeit;
	}
	public String getEndzeit() {
		return Endzeit;
	}
	public void setEndzeit(String endzeit) {
		Endzeit = endzeit;
	}
}
