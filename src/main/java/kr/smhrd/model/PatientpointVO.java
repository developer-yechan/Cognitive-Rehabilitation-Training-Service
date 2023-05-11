package kr.smhrd.model;

public class PatientpointVO {

	private int pp_id;
	private String pp_date;
	private int totalpoint;
	private int zinam;
	private int giuk;
	private int gesan;
	private int zipjoon;
	private int moonje;
	private int pat_id;
	
	public PatientpointVO(){
		
	}
	
	
	
	public PatientpointVO(int pp_id, String pp_date, int totalpoint, int zinam, int giuk, int gesan, int zipjoon,
			int moonje, int pat_id) {
		super();
		this.pp_id = pp_id;
		this.pp_date = pp_date;
		this.totalpoint = totalpoint;
		this.zinam = zinam;
		this.giuk = giuk;
		this.gesan = gesan;
		this.zipjoon = zipjoon;
		this.moonje = moonje;
		this.pat_id = pat_id;
	}



	public int getPp_id() {
		return pp_id;
	}
	public void setPp_id(int pp_id) {
		this.pp_id = pp_id;
	}
	public String getPp_date() {
		return pp_date;
	}
	public void setPp_date(String pp_date) {
		this.pp_date = pp_date;
	}
	public int getTotalpoint() {
		return totalpoint;
	}
	public void setTotalpoint(int totalpoint) {
		this.totalpoint = totalpoint;
	}
	public int getZinam() {
		return zinam;
	}
	public void setZinam(int zinam) {
		this.zinam = zinam;
	}
	public int getGiuk() {
		return giuk;
	}
	public void setGiuk(int giuk) {
		this.giuk = giuk;
	}
	public int getGesan() {
		return gesan;
	}
	public void setGesan(int gesan) {
		this.gesan = gesan;
	}
	public int getZipjoon() {
		return zipjoon;
	}
	public void setZipjoon(int zipjoon) {
		this.zipjoon = zipjoon;
	}
	public int getMoonje() {
		return moonje;
	}
	public void setMoonje(int moonje) {
		this.moonje = moonje;
	}
	public int getPat_id() {
		return pat_id;
	}
	public void setPat_id(int pat_id) {
		this.pat_id = pat_id;
	}
	
	
	

	
	
	
}
