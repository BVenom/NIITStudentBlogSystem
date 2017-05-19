package com.blog.SERVICE;  
  
  
import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.*;

public class DeleteMsg extends HttpServlet {  
	
	MessageDao msgDao=new MessageDao();
	MessageReplyDao msgReplyDao=new MessageReplyDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			int msgID=Integer.parseInt(request.getParameter("msgID"));
			String fName=request.getParameter("fName");
			msgDao.DeleteMsgByMsgID(msgID);
			msgReplyDao.DeleteMsgReplyByMsgID(msgID);
			response.sendRedirect("/niit/getMessageList.do?q=q&Name="+fName);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}