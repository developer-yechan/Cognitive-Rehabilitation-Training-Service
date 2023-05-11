package kr.smhrd.model;

import java.io.Serializable;

public class PatientsVO implements Serializable{
	private int pat_id;
	private String pat_name;
	private int pat_age;
	private int pat_gender;
	private String pat_phone;
	private String pat_address;
	private String doc_id;
	private int pat_round;
	private int pat_num;
	private String pp_date;
	private String totalpoint;
	
	
	public PatientsVO() {}
	
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

	public int getPat_age() {
		return pat_age;
	}

	public void setPat_age(int pat_age) {
		this.pat_age = pat_age;
	}

	public int getPat_gender() {
		return pat_gender;
	}

	public void setPat_gender(int pat_gender) {
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

	public String getDoc_id() {
		return doc_id;
	}

	public void setDoc_id(String doc_id) {
		this.doc_id = doc_id;
	}

	public int getPat_round() {
		return pat_round;
	}

	public void setPat_round(int pat_round) {
		this.pat_round = pat_round;
	}

	public int getPat_num() {
		return pat_num;
	}

	public void setPat_num(int pat_num) {
		this.pat_num = pat_num;
	}

	public String getPp_date() {
		return pp_date;
	}

	public void setPp_date(String pp_date) {
		this.pp_date = pp_date;
	}

	public String getTotalpoint() {
		return totalpoint;
	}

	public void setTotalpoint(String totalpoint) {
		this.totalpoint = totalpoint;
	}
	
	
	

}
