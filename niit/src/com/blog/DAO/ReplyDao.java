package com.blog.DAO;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Date;

import com.blog.PO.RemarkPo;
import com.blog.PO.ReplyPo;

public class ReplyDao {
	public JdbcDao jdbcDao=new JdbcDao();
	public void addReply(int remarkID,String remarkName,int logId,String remarkDetail) {
		long l = System.currentTimeMillis();
		StringBuilder stringBuilder = new StringBuilder("INSERT INTO reply(remarkID,replyName,logID,replyDetail,replyTime) VALUES ("+remarkID+",'"+remarkName+"','"+logId+"','"+remarkDetail+"','"+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date(l))+"')");
		int flag = jdbcDao.jdbcTemplate.update( stringBuilder.toString() );
		
	}
	
	public void DeleteReplyByReplyID(int replyID)
	{
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM reply where replyID="+replyID);
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public void DeleteReplyByUsername(String username) {
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM reply where replyName='"+username+"'");
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public void DeleteReplyByRemarkID(int remarkID)
	{
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM reply where remarkID="+remarkID);
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public void DeleteReplyByLogID(int logID)
	{
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM reply where logID="+logID); 
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public ArrayList<ReplyPo> GetReplyByID(int logID) {
		ArrayList<ReplyPo> replylist =new ArrayList<ReplyPo>();
 		StringBuilder sqlString = new StringBuilder( "select * from reply where logID="+logID);
 		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( sqlString.toString() );
 		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			ReplyPo replyPo=new ReplyPo();
			replyPo.setRemarkID((int)map.get("remarkID"));
			replyPo.setReplyID((int)map.get("replyID"));
			replyPo.setReplyName((String)map.get("replyName"));
			replyPo.setReplyTime(((String)(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format((Date)map.get("replyTime"))));
			replyPo.setRemarkDetail((String)map.get("replyDetail") );
			replylist.add(replyPo);
		};

         return replylist;
	}
}