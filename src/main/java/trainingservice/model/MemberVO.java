package trainingservice.model;

public class MemberVO {
	
	// 치료사 정보
	private String doc_id;
	private String doc_pass;
	private String doc_name;
	private String doc_phone;
	private String doc_organization;
	private String doc_email;
	
	// 환자 정보
	private int pat_id;
	private String pat_name;
	private String pat_age;
	private String pat_gender;
	private String pat_phone;
	private String pat_address;
	private String pp_date;
	private String totalpoint;
	
	
	
	
	public MemberVO() {	}
	
	

	
	

	





	public MemberVO(String doc_id, String doc_pass, String doc_name, String doc_phone, String doc_organization,
			String doc_email, int pat_id, String pat_name, String pat_age, String pat_gender, String pat_phone,
			String pat_address, String pp_date, String totalpoint) {
		super();
		this.doc_id = doc_id;
		this.doc_pass = doc_pass;
		this.doc_name = doc_name;
		this.doc_phone = doc_phone;
		this.doc_organization = doc_organization;
		this.doc_email = doc_email;
		this.pat_id = pat_id;
		this.pat_name = pat_name;
		this.pat_age = pat_age;
		this.pat_gender = pat_gender;
		this.pat_phone = pat_phone;
		this.pat_address = pat_address;
		this.pp_date = pp_date;
		this.totalpoint = totalpoint;
	}












	public String getTotalpoint() {
		return totalpoint;
	}












	public void setTotalpoint(String totalpoint) {
		this.totalpoint = totalpoint;
	}












	public MemberVO(String doc_id, String doc_pass, String doc_name, String doc_phone, String doc_organization,
			String doc_email) {
		super();
		this.doc_id = doc_id;
		this.doc_pass = doc_pass;
		this.doc_name = doc_name;
		this.doc_phone = doc_phone;
		this.doc_organization = doc_organization;
		this.doc_email = doc_email;
	}


	



	





	public int getPat_id() {
		return pat_id;
	}






	public void setPat_id(int pat_id) {
		this.pat_id = pat_id;
	}






	public String getPat_name() {
		return pat_name;
	}






	public void setPat_name(String pat_name) {
		this.pat_name = pat_name;
	}






	public String getPat_age() {
		return pat_age;
	}






	public void setPat_age(String pat_age) {
		this.pat_age = pat_age;
	}






	public String getPat_gender() {
		return pat_gender;
	}






	public void setPat_gender(String pat_gender) {
		this.pat_gender = pat_gender;
	}






	public String getPat_phone() {
		return pat_phone;
	}






	public void setPat_phone(String pat_phone) {
		this.pat_phone = pat_phone;
	}






	public String getPat_address() {
		return pat_address;
	}






	public void setPat_address(String pat_address) {
		this.pat_address = pat_address;
	}






	public String getPp_date() {
		return pp_date;
	}






	public void setPp_date(String pp_date) {
		this.pp_date = pp_date;
	}






	public String getDoc_id() {
		return doc_id;
	}






	public void setDoc_id(String doc_id) {
		this.doc_id = doc_id;
	}






	public String getDoc_pass() {
		return doc_pass;
	}






	public void setDoc_pass(String doc_pass) {
		this.doc_pass = doc_pass;
	}






	public String getDoc_name() {
		return doc_name;
	}






	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}






	public String getDoc_phone() {
		return doc_phone;
	}






	public void setDoc_phone(String doc_phone) {
		this.doc_phone = doc_phone;
	}






	public String getDoc_organization() {
		return doc_organization;
	}






	public void setDoc_organization(String doc_organization) {
		this.doc_organization = doc_organization;
	}






	public String getDoc_email() {
		return doc_email;
	}






	public void setDoc_email(String doc_email) {
		this.doc_email = doc_email;
	}


	/*this.doc_id = doc_id;
	this.doc_pass = doc_pass;
	this.doc_name = doc_name;
	this.doc_phone = doc_phone;
	this.doc_organization = doc_organization;
	this.doc_email = doc_email;*/

	/*private int pat_id;
	private String pat_name;
	private String pat_age;
	private String pat_gender;
	private String pat_phone;
	private String pat_address;
	private String pp_date;
	private String pp_totalpoint;*/

	@Override
	public String toString() {
		return "MemberVO [doc_id=" + doc_id + ", doc_pass=" + doc_pass + ", doc_name=" + doc_name + ", doc_phone=" + doc_phone + ", doc_organization=" + doc_organization + ", doc_email="
				+ doc_email +", pat_id=" + pat_id +", pat_name=" + pat_name +"]";
	}
	
	
	

}
