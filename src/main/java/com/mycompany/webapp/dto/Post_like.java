package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

public class Post_like {

	
	private String memail;
	private int pnumber;
	private int likenumber;
	private String aimage;
	


	public String getAimage() {
		return aimage;
	}

	public void setAimage(String aimage) {
		this.aimage = aimage;
	}

	// Getter , Setter
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
