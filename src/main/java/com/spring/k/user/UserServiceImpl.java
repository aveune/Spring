package com.spring.k.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

	
	@Autowired
	private UserDao dao;
	
	@Override
	public int tc(UserVo vo) {
		// TODO Auto-generated method stub
		return dao.tc(vo);
	}

	@Override
	public void insert(UserVo vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void userDelete(UserVo vo) {
		// TODO Auto-generated method stub
		dao.userDelete(vo);
	}

	@Override
	public void delete(UserVo vo) {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}

	@Override
	public void update(UserVo vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public List<UserVo> getUserList(UserVo vo) {
		// TODO Auto-generated method stub
		return dao.getUserList(vo);
	}

	@Override
	public UserVo content(UserVo vo) {
		// TODO Auto-generated method stub
		return dao.content(vo);
	}

	@Override
	public int custno() {
		// TODO Auto-generated method stub
		return dao.custno();
	}

	@Override
	public int idChk(String userId) {
		// TODO Auto-generated method stub
		return dao.idChk(userId);
	}

	@Override
	public UserVo login(UserVo vo) {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
	}

}
