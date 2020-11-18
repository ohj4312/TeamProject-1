package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String memail;
	
	private String mpassword;
	
	private String mnickname;
	
	private MultipartFile mimage;
	
	private int mgender;
	
	@DateTimeFormat(pattern="yyyy-MM-dd") private Date mbirthday;
	
	//
	
	public Member(String memail, 
			String mpassword, 
			String mnickname, 
			MultipartFile mimage, 
			int mgender,
			Date mbirthday)
	{
		super();
		this.memail = memail;
		this.mpassword = mpassword;
		this.mnickname = mnickname;
		this.mimage = mimage;
		this.mgender = mgender;
		this.mbirthday = mbirthday;
	}
	
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

	public MultipartFile getMimage() {
		return mimage;
	}

	public void setMimage(MultipartFile mimage) {
		this.mimage = mimage;
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

	
}
