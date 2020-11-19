package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

//register_photo는 게시물 등록과 상세조회 페이지
//A_photo 클래스는  사진 한 세트(등록 시 최대 10개) 
public class A_photo {
	//register_photo의 pnumber를 참조하는 것과 동시에 기본키
	
	private int pnumber;
	private int anumber;
	private String aimage;
	private MultipartFile aimageAttach;
	private String acontent;
	private String alocation;
	private int register_number;
	
	
	public int getPnumber() {
		return pnumber;
	}
	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}
	public int getAnumber() {
		return anumber;
	}
	public void setAnumber(int anumber) {
		this.anumber = anumber;
	}
	public String getAimage() {
		return aimage;
	}
	public void setAimage(String aimage) {
		this.aimage = aimage;
	}
	public MultipartFile getAimageAttach() {
		return aimageAttach;
	}
	public void setAimageAttach(MultipartFile aimageAttach) {
		this.aimageAttach = aimageAttach;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getAlocation() {
		return alocation;
	}
	public void setAlocation(String alocation) {
		this.alocation = alocation;
	}
	public int getRegister_number() {
		return register_number;
	}
	public void setRegister_number(int register_number) {
		this.register_number = register_number;
	}


	
}
