package com.mycompany.webapp.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class SelfGuide {
	
	private int snumber;
	@DateTimeFormat(pattern="yyyy-MM-dd")private Date register_date;
	private int hit_count;
	
	private String swriter;
	private String stitle;
	private String scontent;
	private String stype;
	private String simage;
	private int startRowNo;
	private int endRowNo;
	private int bnumber;
	private int likenumber;
	private int bookcount;
	private int likecount;
	private MultipartFile simageAttach;
	List<SelfGuide> list;
	
	
	public int getSnumber() {
		return snumber;
	}
	public void setSnumber(int snumber) {
		this.snumber = snumber;
	}

	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public List<SelfGuide> getList() {
		return list;
	}
	public void setList(List<SelfGuide> list) {
		this.list = list;
	}
	public int getHit_count() {
		return hit_count;
	}
	public void setHit_count(int hit_count) {
		this.hit_count = hit_count;
	}
	public String getSwriter() {
		return swriter;
	}
	public void setSwriter(String swriter) {
		this.swriter = swriter;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getScontent() {
		return scontent;
	}
	public void setScontent(String scontent) {
		this.scontent = scontent;
	}
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	public String getSimage() {
		return simage;
	}
	public void setSimage(String simage) {
		this.simage = simage;
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
	public MultipartFile getSimageAttach() {
		return simageAttach;
	}
	public void setSimageAttach(MultipartFile simageAttach) {
		this.simageAttach = simageAttach;
	}
	public int getBnumber() {
		return bnumber;
	}
	public void setBnumber(int bnumber) {
		this.bnumber = bnumber;
	}
	public int getLikenumber() {
		return likenumber;
	}
	public void setLikenumber(int likenumber) {
		this.likenumber = likenumber;
	}
	public int getBookcount() {
		return bookcount;
	}
	public void setBookcount(int bookcount) {
		this.bookcount = bookcount;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	
	
	
}
