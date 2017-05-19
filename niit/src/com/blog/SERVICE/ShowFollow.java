package com.blog.SERVICE;  
  
import java.io.IOException;
import java.util.ArrayList;

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

import com.blog.DAO.FollowDao;
import com.blog.DAO.UserDao;
import com.blog.PO.UserPo;

@Controller
public class ShowFollow extends HttpServlet {  
	
	@RequestMapping(value="showFollow",method=RequestMethod.GET)
	public ModelAndView showFollower(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException { 
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			String username=(String)session.getAttribute("user");
			ArrayList<String>followlist=new ArrayList<String>();
			FollowDao followerDao=new FollowDao();
			ModelAndView mav=new ModelAndView("follow");
			followlist=followerDao.GetFollow(username);
			mav.addObject("followlist",followlist);
			return mav;
	}
	 

}