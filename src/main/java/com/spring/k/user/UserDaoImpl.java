package com.spring.k.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Override
	public int tc(UserVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("user-mapping.tc",vo);
	}

	@Override
	public void insert(UserVo vo) {
		// TODO Auto-generated method stub
		mybatis.insert("user-mapping.insert",vo);
	}

	@Override
	public void userDelete(UserVo vo) {
		// TODO Auto-generated method stub
		mybatis.delete("user-mapping.Alldelete",vo);
	}

	@Override
	public void delete(UserVo vo) {
		// TODO Auto-generated method stub
		mybatis.delete("user-mapping.delete",vo);
	}

	@Override
	public void update(UserVo vo) {
		// TODO Auto-generated method stub
		mybatis.update("user-mapping.update",vo);
	}

	@Override
	public List<UserVo> getUserList(UserVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("user-mapping.getuserList",vo);
	}

	@Override
	public UserVo content(UserVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("user-mapping.content",vo);
	}

	@Override
	public int custno() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("user-mapping.custno");
	}

	@Override
	public int idChk(String userId) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("user-mapping.idChk",userId);
	}

	@Override
	public UserVo login(UserVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("user-mapping.login",vo);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

}
