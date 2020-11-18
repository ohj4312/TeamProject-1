package com.mycompany.webapp.dto;


//게시물 북마크 클래스
public class Post_bookmark {
	
	
	private String memail;	  //member의 이메일
	
	private int bnumber;
	
	private int pnumber;  //register photo의 번호.
	
	public int getBnumber() {
		return bnumber;
	}

	public void setBnumber(int bnumber) {
		this.bnumber = bnumber;
	}

	public int getPnumber() {
		return pnumber;
	}

	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	
	
}
