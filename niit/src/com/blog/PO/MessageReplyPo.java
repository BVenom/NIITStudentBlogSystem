package com.blog.PO;

import java.sql.Date;

public class MessageReplyPo {
	
	private String userName;
	private String fName;
	private String messagereplyTime;
	private String messagereplyDetail;
	private int messageID;
	private int messagereplyID;
	public int getMessagereplyID() {
		return messagereplyID;
	}
	public void setMessagereplyID(int messagereplyID) {
		this.messagereplyID = messagereplyID;
	}
	
	public int getMessageID() {
		return messageID;
	}
	public void setMessageID(int messageID) {
		this.messageID = messageID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getMessagereplyDetail() {
		return messagereplyDetail;
	}
	public void setMessagereplyDetail(String messagereplyDatail) {
		this.messagereplyDetail = messagereplyDatail;
	}
	
	public String getFName() {
		return fName;
	}
	public void setFName(String fName) {
		this.fName = fName;
	}
	
	public String getMessagereplyTime() {
		return messagereplyTime;
	}
	public void setMessagereplyTime(String messagereplyTime) {
		this.messagereplyTime = messagereplyTime;
	}


}