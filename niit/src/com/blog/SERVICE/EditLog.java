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
public class EditLog extends HttpServlet {  
	
	@RequestMapping(value="editLog",method=RequestMethod.GET)
	public ModelAndView Editlog(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException { 
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			//int logID=39;
			String username=(String)session.getAttribute("user");
			if((String)request.getParameter("logID")!="")
			//logID = Integer.parseInt((int)request.getParameter("logId"));  
			session.setAttribute("editlogID", (String)request.getParameter("logID"));
			LogDao logDao=new LogDao();
			ModelAndView mav;
			if(request.getParameter("ifDelete").equals("true")==true)
			{
				logDao.DeleteLogByID(Integer.parseInt(request.getParameter("logID")));
				response.sendRedirect("/niit/listArticle.do?q=q&Name="+username);
			}
			 mav=new ModelAndView("addArticle");
			LogPo logpo=logDao.GetSingleLog(Integer.parseInt(request.getParameter("logID")));
			mav.addObject("log",logpo);
			return mav;
	}
}
