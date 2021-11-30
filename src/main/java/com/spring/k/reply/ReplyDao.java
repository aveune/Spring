package com.spring.k.reply;

import java.util.List;


public interface ReplyDao {
	public void insert(ReplyVo vo);
	public void replydelete(ReplyVo vo);
	public void update(ReplyVo vo);
	public ReplyVo content(ReplyVo vo);
	public List<ReplyVo> getreplyList(ReplyVo vo);
}
