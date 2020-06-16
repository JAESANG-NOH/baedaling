package com.bd.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bd.common.dao.CommonDAO;

@Service("user.userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public User loginUser(String userId) {
		User dto=null;
		
		try {
			dto=dao.selectOne("user.loginUser", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertUser(User dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMembership(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateLastLogin(String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(User dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User readUser(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User readUser(long userIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUser(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<User> listUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void generatePwd(User dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
