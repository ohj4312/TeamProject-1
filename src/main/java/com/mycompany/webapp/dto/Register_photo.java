package com.mycompany.webapp.dto;


import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;




public class Register_photo {
	
	private int pnumber;
	
	//스타일(현대, antic, 빈티지)
	private int pstyle;
	private String pstyle_name;
	
	//등록일
	@DateTimeFormat(pattern="yyyy-MM-dd") private Date register_pdate;
	
	
	private int phit_count;
	
	
	private String pwriter;
	
	
	private int psize;
	private int psize_min;
	private int psize_max;
	
	private int ptype;
	private String ptype_name;
	
	List<A_photo> list;
	
	




	//----------------Getter  ,  Setter Method()-------------------//
	
	public List<A_photo> getList() {
		return list;
	}

	public void setList(List<A_photo> list) {
		this.list = list;
	}
	
	
	
	
	public int getPnumber() {
		return pnumber;
	}
	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}
	public int getPstyle() {
		return pstyle;
	}
	public void setPstyle(int pstyle) {
		this.pstyle = pstyle;
	}
	public String getPstyle_name() {
		return pstyle_name;
	}
	public void setPstyle_name(String pstyle_name) {
		this.pstyle_name = pstyle_name;
	}
	public Date getRegister_pdate() {
		return register_pdate;
	}
	public void setRegister_pdate(Date register_pdate) {
		this.register_pdate = register_pdate;
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
	public int getPsize() {
		return psize;
	}
	public void setPsize(int psize) {
		this.psize = psize;
	}
	public int getPsize_min() {
		return psize_min;
	}
	public void setPsize_min(int psize_min) {
		this.psize_min = psize_min;
	}
	public int getPsize_max() {
		return psize_max;
	}
	public void setPsize_max(int psize_max) {
		this.psize_max = psize_max;
	}
	public int getPtype() {
		return ptype;
	}
	public void setPtype(int ptype) {
		this.ptype = ptype;
	}
	public String getPtype_name() {
		return ptype_name;
	}
	public void setPtype_name(String ptype_name) {
		this.ptype_name = ptype_name;
	}
	
	
}
