package com.blog.SERVICE;  
  
  
import java.io.IOException;  
import java.lang.reflect.InvocationTargetException;  
  
  


import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.naming.LinkRef;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jsqlparser.expression.operators.arithmetic.Addition;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
  

import org.apache.commons.beanutils.BeanUtils;  
  
  
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blog.PO.UserPo;    
import com.blog.DAO.UserDao;
import com.blog.DAO.JdbcDao;


public class Register extends HttpServlet {  
  
UserDao addUser=new UserDao(); 
	
public void doGet(HttpServletRequest request, HttpServletResponse response)  
throws ServletException, IOException {  
HttpSession session = request.getSession(false);
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");  
String username = (String)request.getParameter("username");
String email = (String)request.getParameter("email"); 
String password = (String)request.getParameter("password");   
String repassword = (String)request.getParameter("repassword");
if(true==addUser.addUser(username,password,email))
response.sendRedirect("/niit/login.jsp");
else{
	session.setAttribute("userExist",true );
	response.sendRedirect("/niit/register.jsp");
}
}  
  
  
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException { 
doGet(request,response);
}
}