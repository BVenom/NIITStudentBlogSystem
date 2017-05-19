package com.blog.SERVICE;  
  
  
import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.ReplyDao;
import com.blog.DAO.UserDao;

public class DeleteReply extends HttpServlet {  
	
	ReplyDao replyDao=new ReplyDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			int ReplyID=Integer.parseInt(request.getParameter("replyID"));
			int LogID=Integer.parseInt(request.getParameter("logID"));
			replyDao.DeleteReplyByReplyID(ReplyID);
			response.sendRedirect("/niit/ShowSingleLog.do?logID="+LogID);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}