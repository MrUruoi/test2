package com.example.demo;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class Ex21ApplicationTests {

	@Autowired
	private DataSource ds;
	
	@Test
	public void dataSourceTest() throws Exception{
		System.out.println(ds);
		Connection con = ds.getConnection();
		System.out.println(con);
	}

}
