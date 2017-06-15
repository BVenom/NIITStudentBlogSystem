package com.blog.SERVICE;  
  
  
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.blog.DAO.*;

public class SQLInquiry extends HttpServlet {  
	
	UserDao Inquiry=new UserDao(); 
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			String inquiry = (String)request.getParameter("inquiry");
			int flag=Inquiry.inquiry(inquiry);
			FileWriter fp=new FileWriter("D:\\Documents\\JAVA EE\\niit\\WebContent\\sqlrecord\\record.txt",true);
			PrintWriter pfp= new PrintWriter(fp);
		    pfp.println("Operation:"+inquiry);
		    long l = System.currentTimeMillis();
		    pfp.println("Operation Time:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(l)));
		    if(flag==1)
		    pfp.println("Operation Result:"+"success");
		    if(flag==0)
			    pfp.println("Operation Result:"+"Failure");
		    pfp.println("------------------------------------------------------------------------------------------------");
		    pfp.close();
			if(flag==1)
			response.sendRedirect("/niit/SQLrequest.jsp?ifsuccess=y");
			else if(flag==0)
					response.sendRedirect("/niit/SQLrequest.jsp?ifsuccess=n");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}