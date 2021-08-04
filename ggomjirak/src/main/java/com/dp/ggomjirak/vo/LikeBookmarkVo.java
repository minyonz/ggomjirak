package com.dp.ggomjirak.vo;

import java.sql.Timestamp;

public class LikeBookmarkVo {
	private String user_id;
	private int hobby_no;
	private Timestamp bm_savetime;
	
	public LikeBookmarkVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LikeBookmarkVo(String user_id, int hobby_no, Timestamp bm_savetime) {
		super();
		this.user_id = user_id;
		this.hobby_no = hobby_no;
		this.bm_savetime = bm_savetime;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getHobby_no() {
		return hobby_no;
	}

	public void setHobby_no(int hobby_no) {
		this.hobby_no = hobby_no;
	}

	public Timestamp getBm_savetime() {
		return bm_savetime;
	}

	public void setBm_savetime(Timestamp bm_savetime) {
		this.bm_savetime = bm_savetime;
	}

	@Override
	public String toString() {
		return "LikeBookMarkVo [user_id=" + user_id + ", hobby_no=" + hobby_no + ", bm_savetime=" + bm_savetime + "]";
	}
	
}
