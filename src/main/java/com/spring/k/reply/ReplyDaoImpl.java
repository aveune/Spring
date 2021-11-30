package com.spring.k.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class ReplyDaoImpl implements ReplyDao{
	
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insert(ReplyVo vo) {
		// TODO Auto-generated method stub
		mybatis.insert("reply-mapping.insert",vo);
	}

	@Override
	public void replydelete(ReplyVo vo) {
		// TODO Auto-generated method stub
		mybatis.delete("reply-mapping.replyDelete",vo);
	}

	@Override
	public void update(ReplyVo vo) {
		// TODO Auto-generated method stub
		mybatis.update("reply-mapping.update",vo);
	}

	@Override
	public ReplyVo content(ReplyVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("reply-mapping.content",vo);
	}

	@Override
	public List<ReplyVo> getreplyList(ReplyVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("reply-mapping.getreplyList",vo);
	}

}
