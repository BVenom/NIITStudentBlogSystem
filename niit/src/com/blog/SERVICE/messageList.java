package com.blog.SERVICE;

import java.util.ArrayList;
import java.util.Map;
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

import com.blog.PO.MessageReplyPo;
import com.blog.PO.UserPo;
import com.blog.PO.MessagePo;
import com.blog.DAO.MessageDao;
import com.blog.DAO.MessageReplyDao;
import com.blog.DAO.UserDao;
import com.blog.DAO.JdbcDao;

@Controller
public class messageList extends HttpServlet{
	
	public MessageDao getmsglist = new MessageDao();
	public MessageReplyDao getmsgreplylist = new MessageReplyDao();

	
	@RequestMapping(value="getMessageList", method = RequestMethod.GET)
	public ModelAndView getMessageList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		HttpSession session = request.getSession(false);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");  
		String truefname[]=request.getParameter("Name").split("\\.");
		String fname=truefname[0];
		ArrayList<MessagePo> messagelist = getmsglist.getMList(fname);
		ArrayList<MessageReplyPo> msgreplylist = getmsgreplylist.GetMessageReplyByFname(fname);
		ModelAndView maView = new ModelAndView("/messageboard.jsp?q=q&Name="+fname);
		maView.addObject("msgreplylist", msgreplylist);
		maView.addObject("msglist",messagelist);
		return maView;
	}
}
