package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Community {

//Community_reply
	private int cr_cnumber;	//Community넘버	 //커뮤니티 넘버 참조 
	@DateTimeFormat(pattern="yyyy-MM-dd")private Date cr_rdate;	//리플시간
	private int cr_rnumber; // 리플 넘버
	private String cr_rcontent; // 리플 내용
	private String cr_mimage;// 리플 이미지 //멤버이미지 참조
	private String cr_rmnickname;// 리플 작성자 //멤머닉네임 참조
	private String rmimage;
	private String rmemail;
	//Community	
	private String c_mnickname; //작성자 // 멤버 닉네임 참조
	private String c_content;// 커뮤니티 내용
	private String c_title;// 커뮤니티 타이틀
	private String c_image;// 커뮤니티 사진  실질적으로 저장되는 파일 이름 
	private int c_count;// 조회수 
	private int c_number;//커뮤니티 넘버
	@DateTimeFormat(pattern="yyyy-MM-dd")private Date c_date;// 커뮤니티 시간 
	private MultipartFile cimage;//커뮤니티 사진 저장을위해 필요한 객체~ 
	private String mimage;
	private String memail;
	
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMimage() {
		return mimage;
	}
	public void setMimage(String mimage) {
		this.mimage = mimage;
	}
	public MultipartFile getCimage() {
		return cimage;
	}
	public void setCimage(MultipartFile cimage) {
		this.cimage = cimage;
	}
	
	public int getCr_cnumber() {
		return cr_cnumber;
	}
	public void setCr_cnumber(int cr_cnumber) {
		this.cr_cnumber = cr_cnumber;
	}
	
	public int getCr_rnumber() {
		return cr_rnumber;
	}
	public void setCr_rnumber(int cr_rnumber) {
		this.cr_rnumber = cr_rnumber;
	}
	public String getCr_rcontent() {
		return cr_rcontent;
	}
	public void setCr_rcontent(String cr_rcontent) {
		this.cr_rcontent = cr_rcontent;
	}
	public String getCr_mimage() {
		return cr_mimage;
	}
	public void setCr_mimage(String cr_mimage) {
		this.cr_mimage = cr_mimage;
	}
	public String getCr_rmnickname() {
		return cr_rmnickname;
	}
	public void setCr_rmnickname(String cr_rmnickname) {
		this.cr_rmnickname = cr_rmnickname;
	}
	public String getC_mnickname() {
		return c_mnickname;
	}
	public void setC_mnickname(String c_mnickname) {
		this.c_mnickname = c_mnickname;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	public int getC_number() {
		return c_number;
	}
	public void setC_number(int c_number) {
		this.c_number = c_number;
	}
	public Date getCr_rdate() {
		return cr_rdate;
	}
	public void setCr_rdate(Date cr_rdate) {
		this.cr_rdate = cr_rdate;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	
	

	

}
