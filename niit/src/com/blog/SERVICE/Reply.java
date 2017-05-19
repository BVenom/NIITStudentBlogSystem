package com.blog.SERVICE;  
  
import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;  
import javax.naming.LinkRef;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blog.DAO.*;
import com.blog.PO.RemarkPo;

public class Reply extends HttpServlet {  
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			RemarkDao remarkDao=new RemarkDao();
			ReplyDao replyDao=new ReplyDao();
			int replyID=-1;
			String username = (String)session.getAttribute("user");
			if(username==null) username="访客";
			String replyDetail = (String)request.getParameter("detail");  
			int logID=Integer.parseInt((String)request.getParameter("logID"));
			if((String)request.getParameter("replyID")!="")
			replyID=Integer.parseInt((String)request.getParameter("replyID"));
			if(replyID==-1)
			remarkDao.addRemark(username, logID, replyDetail);
			else{
				replyDao.addReply(replyID,username, logID, replyDetail);
			}
			response.sendRedirect("/niit/ShowSingleLog.do?logID="+logID);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}
