package com.spring.k.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	
	@Autowired
	ReplyDao dao;

	@Override
	public void insert(ReplyVo vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void replydelete(ReplyVo vo) {
		// TODO Auto-generated method stub
		dao.replydelete(vo);
	}

	@Override
	public void update(ReplyVo vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public ReplyVo content(ReplyVo vo) {
		// TODO Auto-generated method stub
		return dao.content(vo);
	}

	@Override
	public List<ReplyVo> getreplyList(ReplyVo vo) {
		// TODO Auto-generated method stub
		return dao.getreplyList(vo);
	}
	
}
