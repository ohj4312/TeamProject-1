package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

public class Post_like {
	
	private int likenumber;
	private String memail;
	private int pnumber;

	
	
	
	
	
	
	public Post_like(int likenumber) {
		super();
		this.likenumber = likenumber;
	}


	//Getter  ,  Setter
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
