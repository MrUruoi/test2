package com.example.demo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.demo.domain.ReplyVO;
import com.example.demo.persistence.ReplyDAO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class Ex21ApplicationTests3 {

	@Autowired
	private ReplyDAO dao;
	
	@Test
	public void insertTest() throws Exception{
		ReplyVO reply = new ReplyVO();
		reply.setBno(1);
		reply.setReplytext("texttext");
		reply.setReplyer("ererere");
		dao.create(reply);
	} 

}
