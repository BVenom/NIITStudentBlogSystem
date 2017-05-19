package com.blog.PO;

import java.util.Date;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class MessagePo {
	
	private int messageID;
	private String username;
	private String messageDetail;
    private String messageTime;
    private String fName;
    public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}    
    public int getMessageID() {
		return messageID;
	}

	public void setMessageID(int messageID) {
		this.messageID = messageID;
	}

	public void setMessageTime(String messageTime) {
		this.messageTime = messageTime;
	}

	public String getMessageTime() {
		return messageTime ;
	}

	public void setMessageDetail(String messageDetail) {
		this.messageDetail = messageDetail;
	}

	public String getMessageDetail() {
		return messageDetail;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String name) {
		this.username = name;
	}
		


}
