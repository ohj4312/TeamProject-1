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
	private String psize;
	private String ptype;
	private String pstyle;
	private String first_image;
	private String mnickname;
	private String first_content;
	private String mimage;
	private int bnumber;
	private int likenumber;
	private int startRowNo; 	//페이지의 시작 행 번호
	private int endRowNo; 		//페이지의 끝 행 번호
	private String following;
	private int bookcount;
	private int likecount;
	
	List<A_photo> list;
	
	
	
	
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

	public String getFollowing() {
		return following;
	}

	public void setFollowing(String following) {
		this.following = following;
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

	public String getMimage() {
		return mimage;
	}

	public void setMimage(String mimage) {
		this.mimage = mimage;
	}

	public String getFirst_content() {
		return first_content;
	}

	public void setFirst_content(String first_content) {
		this.first_content = first_content;
	}

	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}

	public String getFirst_image() {
		return first_image;
	}

	public void setFirst_image(String first_image) {
		this.first_image = first_image;
	}

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

	public String getPsize() {
		return psize;
	}

	public void setPsize(String psize) {
		this.psize = psize;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPstyle() {
		return pstyle;
	}

	public void setPstyle(String pstyle) {
		this.pstyle = pstyle;
	}

	public List<A_photo> getList() {
		return list;
	}

	public void setList(List<A_photo> list) {
		this.list = list;
	}

	
}
