package com.spring.k.board;

import java.util.List;

import com.spring.k.user.UserVo;

public interface BoardService {

	
	public int tc(BoardVo vo);
	public int bno();
	public int cnt(BoardVo vo);
	public void insert(BoardVo vo);
	public void userdelete(BoardVo vo);
	public void boardelete(BoardVo vo);
	public void update(BoardVo vo);
	public BoardVo content(BoardVo vo);
	public List<UserVo> getBoardList(BoardVo vo);
}
