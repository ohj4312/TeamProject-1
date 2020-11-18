package com.mycompany.webapp.dto;

public class Follows {
	private int fnumber;
	
	
	private String follower;
	
	private String following;

	
	
	//»ý¼ºÀÚ
	public Follows(int fnumber, String follower, String following) {
		super();
		this.fnumber = fnumber;
		this.follower = follower;
		this.following = following;
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
