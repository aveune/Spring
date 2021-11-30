package com.spring.k.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.k.user.UserVo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao dao;

	@Override
	public int tc(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.tc(vo);
	}

	@Override
	public int bno() {
		// TODO Auto-generated method stub
		return dao.bno();
	}

	@Override
	public void insert(BoardVo vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void userdelete(BoardVo vo) {
		// TODO Auto-generated method stub
		dao.userdelete(vo);
	}

	@Override
	public void update(BoardVo vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public List<UserVo> getBoardList(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.getBoardList(vo);
	}

	@Override
	public BoardVo content(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.content(vo);
	}

	@Override
	public int cnt(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.cnt(vo);
	}

	@Override
	public void boardelete(BoardVo vo) {
		// TODO Auto-generated method stub
		dao.boardelete(vo);
	}
	
	
	
}
