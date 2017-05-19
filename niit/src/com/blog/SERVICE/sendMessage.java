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

import com.blog.PO.*;    
import com.blog.DAO.*;

public class sendMessage extends HttpServlet{
	
	MessageDao messageDao=new MessageDao();
	MessageReplyDao messagereplyDao=new MessageReplyDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");  
			HttpSession session = request.getSession(false);
			int replyID=-1;
			String username = (String)session.getAttribute("user");
			if(username==null) username="访客";
			String replyDetail = (String)request.getParameter("message");  
			String blogname=(String)request.getParameter("Name");
			String trueblogname[] = blogname.split("\\."); 
			blogname=trueblogname[0].toString();
			if((String)request.getParameter("replyID")!="")
			replyID=Integer.parseInt((String)request.getParameter("replyID"));
			if(replyID==-1)
			messageDao.addFMessage(username, replyDetail, blogname);
			else{
				messagereplyDao.addReply(replyID,username, blogname, replyDetail);
			}
			response.sendRedirect("/niit/getMessageList.do?q=q&Name="+blogname);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
			doGet(request,response);
			}
}
