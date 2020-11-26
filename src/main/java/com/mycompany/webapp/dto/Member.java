package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String memail;
	
	private String mpassword;
	
	private String mnickname;
	private String mimage;
	private MultipartFile mimageAttach;
	private boolean menabled;
	private String mrole;
	
	private int mgender;
	
	private boolean loginResult;
	
	@DateTimeFormat(pattern="yyyy-MM-dd") private Date mbirthday;
	
	
	
	//Getter   ,   Setter,
	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMpassword() {
		return mpassword;
	}

	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}

	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}

	

	public int getMgender() {
		return mgender;
	}

	public void setMgender(int mgender) {
		this.mgender = mgender;
	}

	public Date getMbirthday() {
		return mbirthday;
	}

	public void setMbirthday(Date mbirthday) {
		this.mbirthday = mbirthday;
	}

	public boolean isLoginResult() {
		return loginResult;
	}

	public void setLoginResult(boolean loginResult) {
		this.loginResult = loginResult;
	}

	public String getMimage() {
		return mimage;
	}

	public void setMimage(String mimage) {
		this.mimage = mimage;
	}

	public MultipartFile getMimageAttach() {
		return mimageAttach;
	}

	public void setMimageAttach(MultipartFile mimageAttach) {
		this.mimageAttach = mimageAttach;
	}

	public boolean isMenabled() {
		return menabled;
	}

	public void setMenabled(boolean menabled) {
		this.menabled = menabled;
	}

	public String getMrole() {
		return mrole;
	}

	public void setMrole(String mrole) {
		this.mrole = mrole;
	}
	
	

	
	
	
}
