package com.example.demo.persistence;

import java.util.List;
import java.util.Map;

import com.example.demo.domain.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> listAll(Integer bno) throws Exception;
	
	public List<ReplyVO> list(Map<String, Object> map) throws Exception;
	
	public int count(Integer bno) throws Exception;
	
	public void create(ReplyVO reply) throws Exception;
	
	public void update(ReplyVO reply) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
}
