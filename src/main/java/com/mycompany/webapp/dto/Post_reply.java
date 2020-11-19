package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;


//게시물 댓글 
public class Post_reply {
	private int rnumber;
	
	private String rcontent;
	
	@DateTimeFormat(pattern="yyyy-MM-dd") private Date register_date;
	
	//register_photo  pnumber; 
	private int pnumber; 
	
	private String rwriter;
	
	private String rimage;
	private MultipartFile rimageAttach;
	
	

	

	public Post_reply(int rnumber, String rcontent, Date register_date, int pnumber, String rwriter, String rimage,
			MultipartFile rimageAttach) {
		super();
		this.rnumber = rnumber;
		this.rcontent = rcontent;
		this.register_date = register_date;
		this.pnumber = pnumber;
		this.rwriter = rwriter;
		this.rimage = rimage;
		this.rimageAttach = rimageAttach;
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

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}

	public int getPnumber() {
		return pnumber;
	}

	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}

	public String getRwriter() {
		return rwriter;
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

	
}
