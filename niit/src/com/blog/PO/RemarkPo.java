package com.blog.PO;

import java.sql.Date;

public class RemarkPo {
	
	private String remarkName;
	private String remarkTime;
	private String remarkDetail;
	private int remarkID;
	private int logID;
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
	public String getRemarkName() {
		return remarkName;
	}
	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}
	
	public String getRemarkDetail() {
		return remarkDetail;
	}
	public void setRemarkDetail(String remarkDatail) {
		this.remarkDetail = remarkDatail;
	}
	
	public String getRemarkTime() {
		return remarkTime;
	}
	public void setRemarkTime(String remarkTime) {
		this.remarkTime = remarkTime;
	}
}
