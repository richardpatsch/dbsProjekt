package db_projekt;

public class PersonenBean {
	private String SVId;
	private String vorname;
	private String nachname;
	private int PLZ;
	private String Ort;
	private String Strasse;
	private int HNr;
	private String Telefonnummer_a;
	private String Telefonnummer_b;
	private String password;
	private Boolean valid;
	
	public Boolean isValid() {
		return valid;
	}
	public void setValid(Boolean valid) {
		this.valid = valid;
	}
	public String getSVId() {
		return SVId;
	}
	public void setSVId(String sVId) {
		SVId = sVId;
	}
	public String getVorname() {
		return vorname;
	}
	public void setVorname(String vorname) {
		this.vorname = vorname;
	}
	public String getNachname() {
		return nachname;
	}
	public void setNachname(String nachname) {
		this.nachname = nachname;
	}
	public int getPLZ() {
		return PLZ;
	}
	public void setPLZ(int pLZ) {
		PLZ = pLZ;
	}
	public String getOrt() {
		return Ort;
	}
	public void setOrt(String ort) {
		Ort = ort;
	}
	public String getStrasse() {
		return Strasse;
	}
	public void setStrasse(String strasse) {
		Strasse = strasse;
	}
	public int getHNr() {
		return HNr;
	}
	public void setHNr(int hNr) {
		HNr = hNr;
	}
	public String getTelefonnummer_a() {
		return Telefonnummer_a;
	}
	public void setTelefonnummer_a(String telefonnummer_a) {
		Telefonnummer_a = telefonnummer_a;
	}
	public String getTelefonnummer_b() {
		return Telefonnummer_b;
	}
	public void setTelefonnummer_b(String telefonnummer_b) {
		Telefonnummer_b = telefonnummer_b;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
