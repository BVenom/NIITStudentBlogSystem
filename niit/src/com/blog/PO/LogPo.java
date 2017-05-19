package com.blog.PO;  

import java.util.Date;
  
public class LogPo {  
    private String username;  
    private String title;  
    private String content;  
    private String type;  
    private int clicknum;
    private int fornum;
    private int connum; 
    private int ID;
    private String datetime;
    //private String email;  
    public String getUsername() {  
        return username;  
    }  
    public void setUsername(String username) {  
        this.username = username;  
    }  
    public String getTitle() {  
        return title;  
    }  
    public void setTitle(String title) {  
        this.title = title;  
    } 
    public String getType() {  
        return type;  
    }  
    public void setType(String type) {  
        this.type = type;  
    }
    public String getContent() {
		return this.content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return datetime;
	}
	public void setDate(String date) {
		this.datetime = date;
	}
	
	public int getClicknum()
	{
		return this.clicknum;
	}
	public void setClicknum(int clicknum)
	{
		this.clicknum=clicknum;
	}
	public int getFornum()
	{
		return this.fornum;
	}
	public void setFornum(int For)
	{
		this.fornum=For;
	}
	public int getConnum()
	{
		return this.connum;
	}
	public void setConnum(int Con)
	{
		this.connum=Con;
	}
	public int getID()
	{
		return this.ID;
	}
	public void setID(int ID)
	{
		this.ID=ID;
	}
    //public String getEmail() {  
    //    return email;  
    //}  
    //public void setEmail(String email) {  
    //    this.email = email;  
    //}  
}  
