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
	
	private String mimage;
	private MultipartFile rimageAttach;
	
	private String mnickname;
	private int startRowNo; 	//페이지의 시작 행 번호
	private int endRowNo; 		//페이지의 끝 행 번호
	
	private int count;
	

	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
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

	
	public String getMimage() {
		return mimage;
	}

	public void setMimage(String mimage) {
		this.mimage = mimage;
	}

	public MultipartFile getRimageAttach() {
		return rimageAttach;
	}

	public void setRimageAttach(MultipartFile rimageAttach) {
		this.rimageAttach = rimageAttach;
	}

	
}
