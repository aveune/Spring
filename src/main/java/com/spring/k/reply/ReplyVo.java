package com.spring.k.reply;

public class ReplyVo {
	
	private int bno;
	private int rno;
	private String id;
	private String rcontent;
	private String replydate;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getReplydate() {
		return replydate;
	}
	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}
	@Override
	public String toString() {
		return "ReplyVo [bno=" + bno + ", rno=" + rno + ", id=" + id + ", rcontent=" + rcontent + ", replydate="
				+ replydate + "]";
	}
	
	
	
}
