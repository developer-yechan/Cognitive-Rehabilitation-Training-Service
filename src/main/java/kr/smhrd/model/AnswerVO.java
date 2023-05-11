package kr.smhrd.model;

import java.io.Serializable;

public class AnswerVO implements Serializable{
	
	
	
	private int ans_id;
	private String ans_correct;
	private int ans_num;
	private int ans_round;
	private String ans_content;
	private String ans_image;
	private String ans_sound;
	private String ans_category;
	private String ans_label;
	
	


	public AnswerVO() {}

	



	public String getAns_label() {
		return ans_label;
	}





	public void setAns_label(String ans_label) {
		this.ans_label = ans_label;
	}





	public int getAns_id() {
		return ans_id;
	}





	public void setAns_id(int ans_id) {
		this.ans_id = ans_id;
	}





	public String getAns_correct() {
		return ans_correct;
	}





	public void setAns_correct(String ans_correct) {
		this.ans_correct = ans_correct;
	}





	public int getAns_num() {
		return ans_num;
	}





	public void setAns_num(int ans_num) {
		this.ans_num = ans_num;
	}





	public int getAns_round() {
		return ans_round;
	}





	public void setAns_round(int ans_round) {
		this.ans_round = ans_round;
	}





	public String getAns_content() {
		return ans_content;
	}





	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}





	public String getAns_image() {
		return ans_image;
	}





	public void setAns_image(String ans_image) {
		this.ans_image = ans_image;
	}





	public String getAns_sound() {
		return ans_sound;
	}





	public void setAns_sound(String ans_sound) {
		this.ans_sound = ans_sound;
	}





	public String getAns_category() {
		return ans_category;
	}





	public void setAns_category(String ans_category) {
		this.ans_category = ans_category;
	}





	
	
	
		
	
}
