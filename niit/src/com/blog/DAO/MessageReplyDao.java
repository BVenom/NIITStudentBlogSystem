package com.blog.DAO;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Date;

import com.blog.PO.MessageReplyPo;
import com.blog.PO.RemarkPo;
import com.blog.PO.ReplyPo;

public class MessageReplyDao {
	public JdbcDao jdbcDao=new JdbcDao();
	
	public void addReply(int messageID,String userName,String fName,String replyDetail) {
		long l = System.currentTimeMillis();
		StringBuilder stringBuilder = new StringBuilder("INSERT INTO messagereply(messageID,userName,fName,replyDetail,replyTime) VALUES ("+messageID+",'"+userName+"','"+fName+"','"+replyDetail+"','"+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date(l))+"')");
		int flag = jdbcDao.jdbcTemplate.update( stringBuilder.toString() );
		
	}
	
	public void DeleteMsgReplyByMsgID(int msgID) {
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM messagereply where messageID="+msgID);
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public void DeleteMessageReplyByUsername(String username) {
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM messagereply where username='"+username+"'");
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public void DeleteMsgReplyByMsgReplyID(int msgReplyID) {
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM messagereply where replyID="+msgReplyID);
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public ArrayList<MessageReplyPo> GetMessageReplyByFname(String Fname) {
		ArrayList<MessageReplyPo> messagereplylist =new ArrayList<MessageReplyPo>();
 		StringBuilder sqlString = new StringBuilder( "select * from messagereply where fName='"+Fname+"'");
 		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( sqlString.toString() );
 		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			MessageReplyPo messagereplyPo=new MessageReplyPo();
			messagereplyPo.setMessagereplyID((int)map.get("replyID"));
			messagereplyPo.setMessageID((int)map.get("messageID"));
			messagereplyPo.setUserName((String)map.get("userName"));
			messagereplyPo.setFName((String)map.get("fName"));
			messagereplyPo.setMessagereplyTime(((String)(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format((Date)map.get("replyTime"))));
			messagereplyPo.setMessagereplyDetail((String)map.get("replyDetail") );
			messagereplylist.add(messagereplyPo);
		};

         return messagereplylist;
	}
}