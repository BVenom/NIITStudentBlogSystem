package com.blog.SERVICE;  
  
  
import java.io.IOException; 
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.LogDao;
import com.blog.DAO.UserDao;

public class Fornum extends HttpServlet {  
	
	LogDao logDao=new LogDao(); 
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			int logID=Integer.parseInt((String)request.getParameter("logID"));
			int For=logDao.GetForByID(logID);
			PrintWriter out = response.getWriter(); 
			out.write(For); 
			out.flush(); 
			out.close(); 
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}