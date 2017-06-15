package com.blog.DAO;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.blog.PO.LogPo;

public class LogDao {
	public JdbcDao jdbcDao=new JdbcDao();
	public boolean addLog(String username, String logTitle,String logDetail,String logType) {
		long l = System.currentTimeMillis();
		StringBuilder stringBuilder = new StringBuilder("INSERT INTO log(username,logTitle,logDetail,logClicknum,logType,LogFor,logCon,logTime)  VALUES ('"+username+"','"+logTitle+"','"+logDetail+"',"+"0"+",'"+logType+"',"+"0,"+"0,'"+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date(l))+"')");
		int flag = jdbcDao.jdbcTemplate.update( stringBuilder.toString() );
		if(flag>0) {
			return true;
			}else{ 
			return false; 
			}	
		}
	
	public int GetForByID(int logID) {
		int For=0;
		StringBuilder stringBuilder = new StringBuilder("SELECT * FROM LOG ");
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		StringBuilder stringBuilder1 = new StringBuilder("UPDATE LOG SET logFor=logFor+1 WHERE logID="+logID+";");
		jdbcDao.jdbcTemplate.update( stringBuilder1.toString() );
		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			For=(int)map.get("logFor");
		};
		return For;
	}
	
	public int GetConByID(int logID) {
		int Con=0;
		StringBuilder stringBuilder = new StringBuilder("SELECT * FROM LOG ");
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		StringBuilder stringBuilder1 = new StringBuilder("UPDATE LOG SET logCon=logCon+1 WHERE logID="+logID+";");
		jdbcDao.jdbcTemplate.update( stringBuilder1.toString() );
		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			Con=(int)map.get("logCon");
		};
		return Con;
	}
	
	public ArrayList<LogPo> GetLogbyUser(String username) {
		ArrayList<LogPo> arraylist=new ArrayList<LogPo>();
		StringBuilder stringBuilder = new StringBuilder("select * from log where username = '"+ username +"'");
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			LogPo logPo=new LogPo();
			logPo.setID( (int)map.get("logID"));
			logPo.setContent( (String)map.get("logDetail") );
			logPo.setDate( (String)(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format((Date)map.get("logTime")));
			logPo.setTitle( (String)map.get("logTitle") );
			logPo.setType( (String)map.get("logType") );
			logPo.setUsername( (String)map.get("username") );
			logPo.setClicknum( (int)map.get("logClicknum") );
			logPo.setFornum( (int)map.get("logFor") );
			logPo.setFornum( (int)map.get("logCon") );
			arraylist.add(logPo);
		};
		return arraylist;
	}
	
	public void DeleteLogByUsername(String username) {
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM log where username='"+username+"'");
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public ArrayList<LogPo> GetLogbyClicknum(int num) {
		ArrayList<LogPo> arraylist=new ArrayList<LogPo>();
		StringBuilder stringBuilder = new StringBuilder("SELECT * FROM LOG GROUP BY logID ORDER BY logClicknum DESC LIMIT "+num);
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			LogPo logPo=new LogPo();
			logPo.setID( (int)map.get("logID"));
			logPo.setContent( (String)map.get("logDetail") );
			logPo.setDate( (String)(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format((Date)map.get("logTime")));
			logPo.setTitle( (String)map.get("logTitle") );
			logPo.setType( (String)map.get("logType") );
			logPo.setUsername( (String)map.get("username") );
			logPo.setClicknum( (int)map.get("logClicknum") );
			logPo.setFornum( (int)map.get("logFor") );
			logPo.setFornum( (int)map.get("logCon") );
			arraylist.add(logPo);
		};
		return arraylist;
	}
	
	public ArrayList<LogPo> GetAllLog() {
		ArrayList<LogPo> arraylist=new ArrayList<LogPo>();
		StringBuilder stringBuilder = new StringBuilder("SELECT * FROM LOG ");
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			LogPo logPo=new LogPo();
			logPo.setID( (int)map.get("logID"));
			logPo.setContent( (String)map.get("logDetail") );
			logPo.setDate( (String)(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format((Date)map.get("logTime")));
			logPo.setTitle( (String)map.get("logTitle") );
			logPo.setType( (String)map.get("logType") );
			logPo.setUsername( (String)map.get("username") );
			logPo.setClicknum( (int)map.get("logClicknum") );
			logPo.setFornum( (int)map.get("logFor") );
			logPo.setFornum( (int)map.get("logCon") );
			arraylist.add(logPo);
		};
		return arraylist;
	}
	
	public ArrayList<LogPo> GetLogbyDate(int num) {
		ArrayList<LogPo> arraylist=new ArrayList<LogPo>();
		StringBuilder stringBuilder = new StringBuilder("SELECT * FROM LOG GROUP BY logID ORDER BY logTime DESC LIMIT "+num);
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			LogPo logPo=new LogPo();
			logPo.setID( (int)map.get("logID"));
			logPo.setContent( (String)map.get("logDetail") );
			logPo.setDate( (String)(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format((Date)map.get("logTime")));
			logPo.setTitle( (String)map.get("logTitle") );
			logPo.setType( (String)map.get("logType") );
			logPo.setUsername( (String)map.get("username") );
			logPo.setClicknum( (int)map.get("logClicknum") );
			logPo.setFornum( (int)map.get("logFor") );
			logPo.setFornum( (int)map.get("logCon") );
			arraylist.add(logPo);
		};
		return arraylist;
	}
	
	public LogPo GetSingleLog(int ID)
	{
		LogPo logPo=new LogPo();
		StringBuilder stringBuilder = new StringBuilder("select * from log where logID = "+ ID +";");
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			logPo.setID( (int)map.get("logID"));
			String logdetail=(String)map.get("logDetail");
			logdetail.replace('\"','\'');
			logPo.setContent( logdetail);
			logPo.setDate( (String)(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format((Date)map.get("logTime")));
			logPo.setTitle( (String)map.get("logTitle") );
			logPo.setType( (String)map.get("logType") );
			logPo.setUsername( (String)map.get("username") );
			logPo.setClicknum( (int)map.get("logClicknum") );
			logPo.setFornum( (int)map.get("logFor") );
			logPo.setConnum( (int)map.get("logCon") );
			this.LogClicknumANDBlogClickNumIncrease(logPo.getID(),logPo.getUsername());
		};

		return logPo;
	}
	
	public void DeleteLogByID(int ID)
	{
		RemarkDao remarkdao=new RemarkDao();
		ReplyDao replydao=new ReplyDao();
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM LOG where logID="+ID);
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
		remarkdao.DeleteRemarkByLogID(ID);
		replydao.DeleteReplyByLogID(ID);
	}
	
	public void UpdateSingleLogByID(String username, String logTitle,String logDetail,String logType,int ID)
	{
		long l = System.currentTimeMillis();
		LogPo logPo=new LogPo();
		StringBuilder stringBuilder = new StringBuilder("update log set username='"+username+"',logTitle='"+logTitle+"',logDetail='"+logDetail+"',logType='"+logType+"',logTime='"+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date(l))+"' where logID="+ID);
		jdbcDao.jdbcTemplate.update( stringBuilder.toString());
	}
	
	public void LogClicknumANDBlogClickNumIncrease(int ID,String username) {
		StringBuilder stringBuilder = new StringBuilder("UPDATE LOG SET logClicknum=logClicknum+1 WHERE logID="+ID+";");
		jdbcDao.jdbcTemplate.update( stringBuilder.toString() );
		StringBuilder stringBuilder2 = new StringBuilder("UPDATE USER SET blogclicknum=blogclicknum+1 WHERE username='"+username+"';");
		jdbcDao.jdbcTemplate.update( stringBuilder2.toString() );
	}
}