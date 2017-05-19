package com.blog.SERVICE;  
  
  
import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.UserDao;

public class Login extends HttpServlet {  
	
	UserDao compareUser=new UserDao(); 
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			String username = (String)request.getParameter("username");
			String password = (String)request.getParameter("password");  
			if(true==compareUser.compareUser(username, password))
			{
				session.setAttribute("user", username);
				response.sendRedirect("/niit/listArticle.do?q=q&Name="+username);
			}else{
				session.setAttribute("LoginState", "Incorrect username or password!");
				response.sendRedirect("/niit/login.jsp");
			}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}