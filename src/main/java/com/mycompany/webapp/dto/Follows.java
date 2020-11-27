package com.mycompany.webapp.dto;

public class Follows {
	private int fnumber;
	
	
	private String follower;
	
	private String following;
	private String memail;
	private String mimage;
	private String mnickname;
	//
	

	
	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}

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

	//Getter  ,  Setter
	public int getFnumber() {
		return fnumber;
	}

	public void setFnumber(int fnumber) {
		this.fnumber = fnumber;
	}

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}

	public String getFollowing() {
		return following;
	}

	public void setFollowing(String following) {
		this.following = following;
	}
}
