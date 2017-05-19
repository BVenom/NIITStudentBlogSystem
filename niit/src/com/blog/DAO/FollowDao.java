package com.blog.DAO;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.blog.PO.LogPo;

public class FollowDao {
	public JdbcDao jdbcDao=new JdbcDao();
	public ArrayList<String> GetFollower(String username) {
		ArrayList<String> arraylist=new ArrayList<String>();
		StringBuilder stringBuilder = new StringBuilder("SELECT * FROM relationship where follow='"+username+"'");
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			String followername=(String)map.get("follower");
			arraylist.add(followername);
		};
		return arraylist;
	}
	
	public void DeleteFollowByUsername(String username) {
		StringBuilder stringBuilder = new StringBuilder("DELETE FROM relationship where follow='"+username+"'");
		StringBuilder stringBuilder1 = new StringBuilder("DELETE FROM relationship where follower='"+username+"'");
		jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
		jdbcDao.jdbcTemplate.execute(stringBuilder1.toString());
	}
	
	public ArrayList<String> GetFollow(String username) {
		ArrayList<String> arraylist=new ArrayList<String>();
		StringBuilder stringBuilder = new StringBuilder("SELECT * FROM relationship where follower='"+username+"'");
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			String followname=(String)map.get("follow");
			arraylist.add(followname);
		};
		return arraylist;
	}
	public Boolean IfFollow(String username,String ownername) {
		StringBuilder stringBuilder = new StringBuilder("SELECT * FROM relationship where follower='"+username+"'");
		List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
		Iterator iterator = list.iterator();
		while( iterator.hasNext() ) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			String followname=(String)map.get("follow");
			if(followname.equals(ownername)) return true;
		};
		return false;
	}
	
	public void Follow(String username,String ownername) {
		StringBuilder stringBuilder = new StringBuilder("INSERT INTO relationship(follow,follower) VALUES('"+ownername+"','"+username+"')");
		jdbcDao.jdbcTemplate.update( stringBuilder.toString() );
	}
}