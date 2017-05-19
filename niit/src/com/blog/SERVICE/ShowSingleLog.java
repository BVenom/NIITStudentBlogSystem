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

import com.blog.DAO.LogDao;
import com.blog.DAO.RemarkDao;
import com.blog.DAO.ReplyDao;
import com.blog.PO.LogPo;
import com.blog.PO.RemarkPo;
import com.blog.PO.ReplyPo;
@Controller
public class ShowSingleLog {
	LogDao logDao=new LogDao();
	RemarkDao remarkDao=new RemarkDao();
	ReplyDao replyDao=new ReplyDao();
	@RequestMapping(value="ShowSingleLog",method=RequestMethod.GET)
	public ModelAndView showSingleLog(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			HttpSession session = request.getSession(false);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			String truelogID[]=request.getParameter("logID").split("\\.");
			int logID=Integer.parseInt(truelogID[0]);
			LogPo logpo=logDao.GetSingleLog(logID);
			ArrayList<RemarkPo>remarklist =remarkDao.GetRemarkByID(logID);
			ArrayList<ReplyPo>replylist =replyDao.GetReplyByID(logID);
			ModelAndView mav=new ModelAndView("singlelog");
			mav.addObject("replylist",replylist);
			mav.addObject("remarklist",remarklist);
			mav.addObject("log",logpo);
			return mav;
			
	}

}