package com.blog.SERVICE;  
  
  
import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.RemarkDao;
import com.blog.DAO.ReplyDao;
import com.blog.DAO.UserDao;

public class DeleteRemark extends HttpServlet {  
	
	ReplyDao replyDao=new ReplyDao();
	RemarkDao remarkDao=new RemarkDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			int RemarkID=Integer.parseInt(request.getParameter("remarkID"));
			int LogID=Integer.parseInt(request.getParameter("logID"));
			replyDao.DeleteReplyByRemarkID(RemarkID);
			remarkDao.DeleteRemarkByRemarkID(RemarkID);
			response.sendRedirect("/niit/ShowSingleLog.do?logID="+LogID);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}