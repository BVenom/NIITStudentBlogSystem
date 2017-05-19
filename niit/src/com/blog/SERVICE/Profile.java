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

import com.blog.DAO.UserDao;
import com.blog.PO.UserPo;

@Controller
public class Profile extends HttpServlet {  
	
	@RequestMapping(value="profile",method=RequestMethod.GET)
	public ModelAndView Editlog(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException { 
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			String username=(String)session.getAttribute("user");
			UserDao userDao=new UserDao();
			ModelAndView mav=new ModelAndView("aboutme");
			UserPo userpo=userDao.GetProfile(username);
			mav.addObject("userpo",userpo);
			return mav;
	}
}
