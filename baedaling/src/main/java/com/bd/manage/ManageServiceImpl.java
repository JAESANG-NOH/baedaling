package com.bd.manage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bd.common.dao.CommonDAO;

@Service("manage.manageService")
public class ManageServiceImpl implements ManageService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	// 회원 목록 조회
	public List<Manage> listManage(Map<String, Object> map) {
		List<Manage> list = null;
		
		try {
			list=dao.selectList("manage.listManage", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	// 글 갯수 등
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("manage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertUserState(Manage dto) throws Exception {
		try {
			dao.updateData("manage.insertUserState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public Manage readUser(String userId) {
		Manage dto = null;
		
		try {
			dto = dao.selectOne("manage.readUser", userId);
			
			if(dto!=null) {
				if(dto.getEmail()!=null) {
					String [] s=dto.getEmail().split("@");
					dto.setEmail(s[0]);
					dto.setEmail(s[1]);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateUserEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("manage.updateUserEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
}
