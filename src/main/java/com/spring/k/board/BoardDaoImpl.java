package com.spring.k.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.k.user.UserVo;

@Component
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int tc(BoardVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("board-mapping.tc",vo);
	}

	@Override
	public int bno() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("board-mapping.bno");
	}

	@Override
	public void insert(BoardVo vo) {
		// TODO Auto-generated method stub
		mybatis.insert("board-mapping.insert",vo);
	}

	@Override
	public void userdelete(BoardVo vo) {
		// TODO Auto-generated method stub
		mybatis.delete("board-mapping.userDelete",vo);
	}

	@Override
	public void update(BoardVo vo) {
		// TODO Auto-generated method stub
		mybatis.update("board-mapping.update",vo);
	}

	@Override
	public List<UserVo> getBoardList(BoardVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("board-mapping.getboardList",vo);
	}

	@Override
	public BoardVo content(BoardVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("board-mapping.content",vo);
	}

	@Override
	public int cnt(BoardVo vo) {
		// TODO Auto-generated method stub
		return mybatis.update("board-mapping.cnt",vo);
	}

	@Override
	public void boardelete(BoardVo vo) {
		// TODO Auto-generated method stub
		mybatis.delete("board-mapping.boardDelete",vo);
	}
	
	
	
}
