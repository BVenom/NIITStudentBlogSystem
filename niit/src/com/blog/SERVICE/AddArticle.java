package com.blog.SERVICE;  

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.LogDao;

public class AddArticle extends HttpServlet {  
	
	LogDao addLog=new LogDao(); 
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException { 
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");  
		HttpSession session = request.getSession(false);
		String username=(String)session.getAttribute("user");
		String title = (String)request.getParameter("title");
		String content = (String)request.getParameter("content");  
		String type = (String)request.getParameter("type");
		if(session.getAttribute("editlogID")==null){
		if(true==addLog.addLog(username,title,content,type)){
			response.sendRedirect("/niit/listArticle.do?q=q&Name="+username);
		}
			else{
				response.sendRedirect("/niit/listArticle.do?q=q&Name="+username);
			}
		}
		else{
			addLog.UpdateSingleLogByID(username,title,content,type,Integer.parseUnsignedInt((String)session.getAttribute("editlogID")));
			session.setAttribute("editlogID", null);
			response.sendRedirect("/niit/listArticle.do?q=q&Name="+username);
			}
		
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}
