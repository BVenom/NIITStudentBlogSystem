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

import com.blog.DAO.LogDao;
import com.blog.PO.LogPo;

@Controller
public class Quit{
	@RequestMapping(value="quit",method=RequestMethod.GET)
	public void quit(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			HttpSession session = request.getSession(false);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			session.setAttribute("user", null);
			response.sendRedirect("/niit/showIndex.do?");
			
	}

}