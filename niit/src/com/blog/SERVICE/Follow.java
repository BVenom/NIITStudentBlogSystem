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
public class Follow extends HttpServlet {  
	FollowDao followDao=new FollowDao();
	
	@RequestMapping(value="follow",method=RequestMethod.GET)
	public void showFollower(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException { 
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			String username=(String)session.getAttribute("user");
			String truefname[]=request.getParameter("Name").split("\\.");
			String ownername=truefname[0];
			if(followDao.IfFollow(username, ownername)==false){
				followDao.Follow(username, ownername);
			}
			response.sendRedirect("/niit/listArticle.do?q=q&Name="+ownername);
	}
	 

}