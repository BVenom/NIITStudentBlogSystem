package com.blog.DAO; 
//"','"++
import org.springframework.context.ApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.context.support.ClassPathXmlApplicationContext;  

@Repository
public class JdbcDao {
	ApplicationContext ctx=new ClassPathXmlApplicationContext("application-servlet.xml");
	public JdbcTemplate jdbcTemplate=(JdbcTemplate) ctx.getBean("jdbcTemplate");
	public static void main(String args[]) {
	}
}
