package com.mycompany.webapp.dto;

import java.util.Date;

public class Qna {
	private int qnumber;
	private String qtitle;
	private Date	qdate;
	private String qcontent;
	private String mnickname;
	private String answer;
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
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
		return qcontent;
	}
	public void setQcontet(String qcontet) {
		this.qcontent = qcontet;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	
}
