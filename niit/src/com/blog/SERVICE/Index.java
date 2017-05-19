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
public class Index {
	@RequestMapping(value="showIndex",method=RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		LogDao logDao=new LogDao();
		UserDao userDao=new UserDao();
		ArrayList<LogPo> clicklist = logDao.GetLogbyClicknum(4);
		ArrayList<LogPo> datelist = logDao.GetLogbyDate(4);
		ArrayList<LogPo> footdatelist = logDao.GetLogbyDate(3);
		ArrayList<String> userlist = userDao.GetHotBlog(7);
		ModelAndView maView = new ModelAndView("index");
		maView.addObject("userlist", userlist); 
		maView.addObject("clicklist", clicklist); 
		maView.addObject("datelist", datelist); 
		maView.addObject("footdatelist", footdatelist); 
		return maView; 
	}
}