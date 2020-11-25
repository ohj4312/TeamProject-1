package com.mycompany.webapp.dto;

import java.util.Date;

public class Qna {
	private int qnumber;
	private String qtitle;
	private Date	qdate;
	private String qcontet;
	private String qnickname;
	
	public int getQnumber() {
		return qnumber;
	}
	public void setQnumber(int qnumber) {
		this.qnumber = qnumber;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	public String getQcontet() {
		return qcontet;
	}
	public void setQcontet(String qcontet) {
		this.qcontet = qcontet;
	}
	public String getQnickname() {
		return qnickname;
	}
	public void setQnickname(String qnickname) {
		this.qnickname = qnickname;
	}
}
