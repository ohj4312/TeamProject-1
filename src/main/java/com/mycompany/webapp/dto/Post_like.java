package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

public class Post_like {

	private String first_image;
	
	private String memail;
	private int pnumber;
	private int likenumber;
	private String aimage;
	private int snumber;


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
	public String getFirst_image() {
		return first_image;
	}

	public void setFirst_image(String first_image) {
		this.first_image = first_image;
	}

	public int getSnumber() {
		return snumber;
	}

	public void setSnumber(int snumber) {
		this.snumber = snumber;
	}

}
