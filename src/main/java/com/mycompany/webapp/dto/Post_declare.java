package com.mycompany.webapp.dto;

//게시물 신고하기
public class Post_declare {
	private int dnumber;
	
	private String dcontent;
	
	
	//Member의 memail을 참조
	private String mwriter;
	
	
	//신고할 게시물 번호.
	private int pnumber;
		
		
	public int getDnumber() {
		return dnumber;
	}


	public void setDnumber(int dnumber) {
		this.dnumber = dnumber;
	}


	public String getDcontent() {
		return dcontent;
	}


	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}


	public String getMwriter() {
		return mwriter;
	}


	public void setMwriter(String mwriter) {
		this.mwriter = mwriter;
	}


	public int getPnumber() {
		return pnumber;
	}


	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}


	
}
