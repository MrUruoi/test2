package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.ReplyVO;
import com.example.demo.persistence.ReplyDAO;
import com.example.demo.util.Criteria;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> listAll(Integer bno) throws Exception {
		return dao.listAll(bno);
	}
	
	@Override
	public List<ReplyVO> list(Integer bno, Criteria cri) throws Exception {
		//for mybatis
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("cri", cri);
		return dao.list(map);
	}
	
	public int count(Integer bno) throws Exception {
		return dao.count(bno);
	}

	@Override
	public void create(ReplyVO reply) throws Exception {
		dao.create(reply);
	}
	
	@Override
	public void update(ReplyVO reply) throws Exception {
		dao.update(reply);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		dao.delete(rno);	
	}
	
}
