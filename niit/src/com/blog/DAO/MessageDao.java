package com.blog.DAO;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.blog.PO.MessagePo;


public class MessageDao {
	public JdbcDao jdbcDao = new JdbcDao();
	public UserDao userDao = new UserDao();
	
	public void addFMessage(String name, String message, String fName){
		//if(true==userDao.ifUserExist(name)){
			long l = System.currentTimeMillis();
			StringBuilder stringBuilder = new StringBuilder("INSERT INTO message(username, messageDetail, messageTime,fName) VALUES ('"+name+"','"+message+"','"+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date(l))+"','"+fName+"')");
			jdbcDao.jdbcTemplate.update( stringBuilder.toString() );
	}
	
	public void DeleteMessageByUsername(String username) {
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM message where username='"+username+"'");
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public ArrayList<MessagePo> getMList(String fName){
		ArrayList <MessagePo> arraylist = new ArrayList<MessagePo>();
		StringBuilder stringBuilder = new StringBuilder("select * from message where fName='"+fName+"'");
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		Iterator iterator = list.iterator();
		while(iterator.hasNext()) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			MessagePo message = new MessagePo();
			message.setMessageDetail((String)map.get("messageDetail"));
			message.setMessageTime((String)(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format((Date)map.get("messageTime")));
			message.setfName((String)map.get("fName"));
			message.setMessageID((int)map.get("messageID"));
			message.setUsername((String)map.get("username"));
			arraylist.add(message);
		}
		return arraylist;
	}


	public void DeleteMsgByMsgID(int msgID) {
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM message where messageID="+msgID);
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
}
