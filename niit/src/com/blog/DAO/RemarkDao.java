package com.blog.DAO;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Date;

import com.blog.PO.RemarkPo;

public class RemarkDao {
	public JdbcDao jdbcDao=new JdbcDao();
	
	public void addRemark(String remarkName,int logId,String remarkDetail) {
		long l = System.currentTimeMillis();
		StringBuilder stringBuilder = new StringBuilder("INSERT INTO remark(remarkName,logID,remarkDetail,remarkTime) VALUES ('"+remarkName+"','"+logId+"','"+remarkDetail+"','"+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date(l))+"')");
		int flag = jdbcDao.jdbcTemplate.update( stringBuilder.toString() );
		
	}
	
	public void DeleteRemarkByRemarkID(int remarkID)
	{
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM remark where remarkID="+remarkID);
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public void DeleteRemarkByUsername(String username) {
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM remark where remarkName='"+username+"'");
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
	}
	
	public void DeleteRemarkByLogID(int logId) {
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM remark where logID="+logId);
		jdbcDao.jdbcTemplate.execute( stringBuilder.toString() );
		
	}
	
	public ArrayList GetRemarkByID(int logID){
		        ArrayList<RemarkPo> remarklist =new ArrayList<RemarkPo>();
		 		StringBuilder sqlString = new StringBuilder( "select * from remark where logID="+logID);
		 		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( sqlString.toString() );
		 		Iterator iterator = list.iterator();
				while( iterator.hasNext() ) {
					Map<String, Object> map = (Map<String, Object>) iterator.next();
					RemarkPo remarkPo=new RemarkPo();
					remarkPo.setRemarkID((int)map.get("remarkID"));
					remarkPo.setLogID((int)map.get("logID"));
					remarkPo.setRemarkName((String)map.get("remarkName"));
					remarkPo.setRemarkTime(((String)(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format((Date)map.get("remarkTime"))));
					remarkPo.setRemarkDetail((String)map.get("remarkDetail") );
					remarklist.add(remarkPo);
				};

		         return remarklist;
		     }
		     
		 } 
