package com.spring.k.user;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface UserService {

	
	public int tc(UserVo vo);
	public int custno();
	public void insert(UserVo vo);
	public void userDelete(UserVo vo);
	public void delete(UserVo vo);
	public void update(UserVo vo);
	
	public  List<UserVo> getUserList(UserVo vo);
	public  UserVo content(UserVo vo);
	public int idChk (String userId);
	public UserVo login(UserVo vo);
	public void logout(HttpSession session);
}
