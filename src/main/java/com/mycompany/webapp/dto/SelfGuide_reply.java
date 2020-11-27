package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SelfGuide_reply {
	private int rnumber;
	
	private String rcontent;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")private Date register_date;
	
	private int snumber;

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}

	public int getRnumber() {
		return rnumber;
	}

	public void setRnumber(int rnumber) {
		this.rnumber = rnumber;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}



	public int getSnumber() {
		return snumber;
	}

	public void setSnumber(int snumber) {
		this.snumber = snumber;
	}
}
