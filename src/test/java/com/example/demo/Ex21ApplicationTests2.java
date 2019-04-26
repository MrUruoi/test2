package com.example.demo;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class Ex21ApplicationTests2 {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void sqlSessionTest() {
		System.out.println(sqlSession);
	} 

}
