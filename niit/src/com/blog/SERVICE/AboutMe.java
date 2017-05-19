package com.blog.SERVICE;  

import java.io.IOException; 
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.UserDao;

public class AboutMe extends HttpServlet {  
	 
	UserDao Editprofile=new UserDao(); 
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException { 
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");  
		HttpSession session = request.getSession(false);
		String username=(String)session.getAttribute("user");
		String name = (String)request.getParameter("name");
		String sex = (String)request.getParameter("sex");  
		//String birth  = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date(l))(String)request.getParameter("type");
		String birthday=(String)request.getParameter("birth");
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
		//String birth=sdf.format(request.getParameter("birth"));
		String email = (String)request.getParameter("email");
		String phone = (String)request.getParameter("phone");
		String address = (String)request.getParameter("address");
		Editprofile.editUserProfile(username, name, sex, birthday, email, phone, address);
	    response.sendRedirect("/niit/listArticle.do?q=q&Name="+username);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}