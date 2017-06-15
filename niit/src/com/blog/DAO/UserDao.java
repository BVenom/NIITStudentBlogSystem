package com.blog.DAO;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.sql.SQLException;
import org.springframework.stereotype.Repository;

import com.blog.PO.LogPo;
import com.blog.PO.UserPo;

public class UserDao {

		public JdbcDao jdbcDao=new JdbcDao();
		/*public FollowDao followDao=new FollowDao();
		public LogDao logDao=new LogDao();
		public MessageDao messageDao=new MessageDao();
		public MessageReplyDao messageReplyDao=new MessageReplyDao();
		public ReplyDao ReplyDao=new ReplyDao();
		public RemarkDao remarkDao=new RemarkDao();
		*/
		public int inquiry(String inquiry) {
			try{
				jdbcDao.jdbcTemplate.execute(inquiry);
			}catch(Exception e){return 0;}
			return 1;
		}
		
		public boolean addUser(String username, String password,String email) {
		if(true==ifUserExist(username)){
			return false;
		}
		StringBuilder stringBuilder = new StringBuilder("INSERT INTO user(username,password,email,blogclicknum) VALUES ('"+username+"','"+password+"','"+email+"'"+",0"+")");
		int flag = jdbcDao.jdbcTemplate.update( stringBuilder.toString() );
		if(flag>0) {
			return true;
			}else{ 
			return false; 
			}	
		}
		
		public void DeleteUserByUsername(String username) {
			FollowDao followDao=new FollowDao();
			LogDao logDao=new LogDao();
			MessageDao messageDao=new MessageDao();
			MessageReplyDao messageReplyDao=new MessageReplyDao();
			ReplyDao replyDao=new ReplyDao();
			RemarkDao remarkDao=new RemarkDao();
			
			
			StringBuilder stringBuilder = new StringBuilder("DELETE FROM user where username='"+username+"'");
			followDao.DeleteFollowByUsername(username);
			logDao.DeleteLogByUsername(username);
			messageDao.DeleteMessageByUsername(username);
			messageReplyDao.DeleteMessageReplyByUsername(username);
			replyDao.DeleteReplyByUsername(username);
			remarkDao.DeleteRemarkByUsername(username);
			
			jdbcDao.jdbcTemplate.execute(stringBuilder.toString());
		}
		
		public boolean ifUserExist(String username) {
			//if(username.equals("123")) return false; 
			String str = "";
			StringBuilder sqlString = new StringBuilder( "select * from user where username='"+username+"'");
			List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( sqlString.toString() );
			Iterator iterator = list.iterator();
			while(iterator.hasNext()) {
				str = (String)((Map<String,Object>)iterator.next()).get("password");
			};
			Boolean flag = false;
			if( str!="" ){
				
				flag = true;
			}
			return flag;
		}
		
		public ArrayList<String> GetAllUserName() {
			ArrayList<String> arraylist=new ArrayList<String>();
			StringBuilder stringBuilder = new StringBuilder("SELECT * FROM USER ");
			List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
			Iterator iterator = list.iterator();
			while( iterator.hasNext() ) {
				Map<String, Object> map = (Map<String, Object>) iterator.next();
				String username=(String)map.get("username");
				arraylist.add(username);
			};
			return arraylist;
		}
		
		public UserPo GetProfile(String username) {
			//if(username.equals("123")) return false; 
			UserPo userpo=new UserPo();
			StringBuilder sqlString = new StringBuilder( "select * from user where username='"+username+"'");
			List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( sqlString.toString() );
			Iterator iterator = list.iterator();
			while(iterator.hasNext()) {
				Map<String, Object> map = (Map<String, Object>) iterator.next();
				userpo.setName((String)map.get("name"));
				userpo.setEmail((String)map.get("email"));
				userpo.setPhonenumber((String)map.get("phonenumber"));
				userpo.setSex((String)map.get("sex"));
				userpo.setAddress((String)map.get("address"));
				if((Date)(map.get("birthday"))!=null)
				userpo.setBirthday((String)(new SimpleDateFormat("yyyy-MM-dd")).format((Date)(map.get("birthday"))));
				else userpo.setBirthday("");
			};
			return userpo;
		}
		
		public void editUserProfile(String username,String name,String sex,String birth,String email,String phone,String address)
		{
			StringBuilder stringBuilder = new StringBuilder("update user set name='"+name+"',sex='"+sex+"',address='"+address+"',phonenumber='"+phone+"',birthday=str_to_date('"+birth+"','%Y-%m-%d'),email='"+email+"' where username='"+username+"'");
			jdbcDao.jdbcTemplate.update( stringBuilder.toString());
		}
		
		public ArrayList<String> GetHotBlog(int num) {
			ArrayList<String> arraylist=new ArrayList<String>();
			StringBuilder stringBuilder = new StringBuilder("SELECT * FROM user WHERE username<>'admin' GROUP BY username ORDER BY blogclicknum DESC LIMIT "+num);
			List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( stringBuilder.toString() );
			Iterator iterator = list.iterator();
			while( iterator.hasNext() ) {
				Map<String, Object> map = (Map<String, Object>) iterator.next();
				String username=(String)map.get("username");
				arraylist.add(username);
			};
			return arraylist;
		}

		
		public boolean compareUser(String username, String password) {
			String str = "";
			StringBuilder sqlString = new StringBuilder( "select * from user where username='"+username+"'");
			List<Map<String,Object>> list = jdbcDao.jdbcTemplate.queryForList( sqlString.toString() );
			Iterator iterator = list.iterator();
			while(iterator.hasNext()) {
				str = (String)((Map<String,Object>)iterator.next()).get("password");
			};
			Boolean flag = false;
			String passwordString = str;
			if( password!=null && password.equals(passwordString) ){
				
				flag = true;
			};
			return flag;
		}

}
 