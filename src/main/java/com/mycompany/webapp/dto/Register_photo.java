package com.mycompany.webapp.dto;


import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;




public class Register_photo {
	
	private int pnumber;
	private int phit_count;
	private String pwriter;
	//등록일
	@DateTimeFormat(pattern="yyyy-MM-dd") private Date register_pdate;
	private int psize;
	private int ptype;
	private int pstyle;
	
	List<A_photo> list;

	public int getPnumber() {
		return pnumber;
	}

	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}

	public int getPhit_count() {
		return phit_count;
	}

	public void setPhit_count(int phit_count) {
		this.phit_count = phit_count;
	}

	public String getPwriter() {
		return pwriter;
	}

	public void setPwriter(String pwriter) {
		this.pwriter = pwriter;
	}

	public Date getRegister_pdate() {
		return register_pdate;
	}

	public void setRegister_pdate(Date register_pdate) {
		this.register_pdate = register_pdate;
	}

	public int getPsize() {
		return psize;
	}

	public void setPsize(int psize) {
		this.psize = psize;
	}

	public int getPtype() {
		return ptype;
	}

	public void setPtype(int ptype) {
		this.ptype = ptype;
	}

	public int getPstyle() {
		return pstyle;
	}

	public void setPstyle(int pstyle) {
		this.pstyle = pstyle;
	}

	public List<A_photo> getList() {
		return list;
	}

	public void setList(List<A_photo> list) {
		this.list = list;
	}

	
}
