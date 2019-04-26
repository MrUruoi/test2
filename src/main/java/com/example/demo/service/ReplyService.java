package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.ReplyVO;
import com.example.demo.util.Criteria;

public interface ReplyService {
	
	public List<ReplyVO> listAll(Integer bno) throws Exception;
	
	public List<ReplyVO> list(Integer bno, Criteria cri) throws Exception;
	
	public int count(Integer bno) throws Exception;
	
	public void create(ReplyVO reply) throws Exception;
	
	public void update(ReplyVO reply) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
}
