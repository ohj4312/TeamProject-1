package com.mycompany.webapp.dto;

public class Community {

//Community_reply
	private int CR_CNUMBER;	//Community넘버	 //커뮤니티 넘버 참조 
	private int CR_RDATE;	//리플시간
	private int CR_RNUMBER; // 리플 넘버
	private String CR_RCONTENT; // 리플 내용
	private String CR_MIMAGE;// 리플 이미지 //멤버이미지 참조
	private String CR_RMNIKNAME; // 리플 작성자 //멤머닉네임 참조

//Community	
	private String C_MNICKNAME; //작성자 // 멤버 닉네임 참조
	private String C_CONTENT; // 커뮤니티 내용
	private String C_TILTLE; // 커뮤니티 타이틀
	private String C_IMAGE; // 커뮤니티 사진 
	private int C_COUNT; // 조회수 
	private int C_NUMBER; //커뮤니티 넘버
	private int C_DATE; // 커뮤니티 시간 

	public String getCR_RMNIKNAME() {
		return CR_RMNIKNAME;
	}

	public void setCR_RMNIKNAME(String cR_RMNIKNAME) {
		CR_RMNIKNAME = cR_RMNIKNAME;
	}

	public int getCR_CNUMBER() {
		return CR_CNUMBER;
	}

	public void setCR_CNUMBER(int cR_CNUMBER) {
		CR_CNUMBER = cR_CNUMBER;
	}

	public String getCR_MIMAGE() {
		return CR_MIMAGE;
	}

	public void setCR_MIMAGE(String cR_MIMAGE) {
		CR_MIMAGE = cR_MIMAGE;
	}

	public int getCR_RDATE() {
		return CR_RDATE;
	}

	public void setCR_RDATE(int cR_RDATE) {
		CR_RDATE = cR_RDATE;
	}

	public String getCR_RCONTENT() {
		return CR_RCONTENT;
	}

	public void setCR_RCONTENT(String cR_RCONTENT) {
		CR_RCONTENT = cR_RCONTENT;
	}

	public int getCR_RNUMBER() {
		return CR_RNUMBER;
	}

	public void setCR_RNUMBER(int cR_RNUMBER) {
		CR_RNUMBER = cR_RNUMBER;
	}

	public String getC_MNICKNAME() {
		return C_MNICKNAME;
	}

	public void setC_MNICKNAME(String c_MNICKNAME) {
		C_MNICKNAME = c_MNICKNAME;
	}

	public String getC_CONTENT() {
		return C_CONTENT;
	}

	public void setC_CONTENT(String c_CONTENT) {
		C_CONTENT = c_CONTENT;
	}

	public int getC_COUNT() {
		return C_COUNT;
	}

	public void setC_COUNT(int c_COUNT) {
		C_COUNT = c_COUNT;
	}

	public String getC_TILTLE() {
		return C_TILTLE;
	}

	public void setC_TILTLE(String c_TILTLE) {
		C_TILTLE = c_TILTLE;
	}

	public int getC_NUMBER() {
		return C_NUMBER;
	}

	public void setC_NUMBER(int c_NUMBER) {
		C_NUMBER = c_NUMBER;
	}

	public int getC_DATE() {
		return C_DATE;
	}

	public void setC_DATE(int c_DATE) {
		C_DATE = c_DATE;
	}

	public String getC_MIMAGE() {
		return C_IMAGE;
	}

	public void setC_MIMAGE(String c_IMAGE) {
		C_IMAGE = c_IMAGE;
	}

}
