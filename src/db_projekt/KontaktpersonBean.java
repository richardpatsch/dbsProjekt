package db_projekt;

public class KontaktpersonBean {
	private String SVId;
	private int kundennummer;
	private String name;
	
	public String getSVId() {
		return SVId;
	}
	public void setSVId(String sVId) {
		SVId = sVId;
	}
	public int getKundennummer() {
		return kundennummer;
	}
	public void setKundennumer(int kundennummer) {
		this.kundennummer = kundennummer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
