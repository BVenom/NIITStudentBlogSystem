package com.blog.PO;

import java.sql.Date;

public class ReplyPo {
	
	private String replyName;
	private String replyTime;
	private String replyDetail;
	private int remarkID;
	private int replyID;
	private int logID;
	public int getReplyID() {
		return replyID;
	}
	public void setReplyID(int replyID) {
		this.replyID = replyID;
	}
	public int getLogID() {
		return logID;
	}
	public void setLogID(int logID) {
		this.logID = logID;
	}
	public int getRemarkID() {
		return remarkID;
	}
	public void setRemarkID(int remarkID) {
		this.remarkID = remarkID;
	}
	public String getReplyName() {
		return replyName;
	}
	public void setReplyName(String replyName) {
		this.replyName = replyName;
	}
	
	public String getReplyDetail() {
		return replyDetail;
	}
	public void setRemarkDetail(String replyDatail) {
		this.replyDetail = replyDatail;
	}
	
	public String getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}


}