package com.blog.SERVICE;  
  
  
import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.*;


public class DeleteUser extends HttpServlet {  
	
	UserDao userDao=new UserDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			String username="";
			if(request.getParameter("Name")!=null)
			username=request.getParameter("Name").split("\\.")[0];
			userDao.DeleteUserByUsername(username);
			response.sendRedirect("/niit/listArticle.do?q=q&Name=admin");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}