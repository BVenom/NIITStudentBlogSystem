package com.blog.SERVICE;  

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blog.DAO.LogDao;
import com.blog.DAO.UserDao;
import com.blog.PO.LogPo;
 

@Controller
public class ListArticle {
	
	LogDao logDao=new LogDao();
	UserDao userDao=new UserDao();
	@RequestMapping(value="listArticle",method=RequestMethod.GET)
	public ModelAndView listArticle(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		ArrayList<LogPo> list=new ArrayList<LogPo>();
		String ownername=request.getParameter("Name");
		String trueownername[]=new String[2];
		if(ownername!=null){
			trueownername=ownername.split("\\.");
			ownername=trueownername[0];
		}
		String username="";
		if(session.getAttribute("user")!=null)
		username=(String)session.getAttribute("user");
		if(ownername==null||username.equals("admin")==true)
		{
			list = logDao.GetAllLog();
			
		}
		else{
			list = logDao.GetLogbyUser(ownername);
		}
		ArrayList<String> userlist = userDao.GetHotBlog(7);
		HashSet set=new HashSet(); 
        Iterator it1 = list.iterator();
        while(it1.hasNext()){
        	LogPo logpo=(LogPo)it1.next();
        	set.add((String)logpo.getType());
        }
		ModelAndView maView = new ModelAndView("home");
		maView.addObject("userlist", userlist); 
		maView.addObject("list", list); 
		maView.addObject("set", set); 
		return maView;
	}
}