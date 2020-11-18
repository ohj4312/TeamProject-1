package com.mycompany.webapp.dto;

public class Post_like {
	//좋아요 수
	private int likenumber;
	
	
	//Member클래스의 이메일 참조
	private String memail;
	
	
	//Register_photo의 pnumber 참조.
	private int pnumber;


	public int getLikenumber() {
		return likenumber;
	}


	public void setLikenumber(int likenumber) {
		this.likenumber = likenumber;
	}


	public String getMemail() {
		return memail;
	}


	public void setMemail(String memail) {
		this.memail = memail;
	}


	public int getPnumber() {
		return pnumber;
	}


	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}
}
