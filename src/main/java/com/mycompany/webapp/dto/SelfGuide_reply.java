package com.mycompany.webapp.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class SelfGuide_reply {
	private int rnumber;
	
	private String rcontent;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")private Date register_date;
	
	private int snumber;
	
	private String rwriter;	//댓글쓴이
	
	private String rimage;
	private MultipartFile rimageAttach;
	
	private String mnickname;
	private int startRowNo;
	private int endRowNo;
	private int count;
	private String mimage;
	List<SelfGuide_reply> list;
	
	public String getRwriter() {
		return rwriter;
	}

	
	
	public String getMimage() {
		return mimage;
	}



	public void setMimage(String mimage) {
		this.mimage = mimage;
	}



	public List<SelfGuide_reply> getList() {
		return list;
	}



	public void setList(List<SelfGuide_reply> list) {
		this.list = list;
	}



	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public String getRimage() {
		return rimage;
	}

	public void setRimage(String rimage) {
		this.rimage = rimage;
	}

	public MultipartFile getRimageAttach() {
		return rimageAttach;
	}

	public void setRimageAttach(MultipartFile rimageAttach) {
		this.rimageAttach = rimageAttach;
	}

	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}

	public int getStartRowNo() {
		return startRowNo;
	}

	public void setStartRowNo(int startRowNo) {
		this.startRowNo = startRowNo;
	}

	public int getEndRowNo() {
		return endRowNo;
	}

	public void setEndRowNo(int endRowNo) {
		this.endRowNo = endRowNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
	
	

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
