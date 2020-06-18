package com.bd.inquire;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bd.common.dao.CommonDAO;

@Service("inquire.inquireService")
public class InquireServiceImpl implements InquireService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertInquire(Inquire dto) throws Exception {
		try {
			dao.insertData("inquire.insertInquire", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Inquire> listInquire(Map<String, Object> map) {
		List<Inquire> list = null;
		
		try {
			list=dao.selectList("inquire.listInquire", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("inquire.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Inquire readInquire(int num) {
		Inquire dto = null;
		
		try {
			// 게시물 가져오기 
			dto=dao.selectOne("inquire.readInquire", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	@Override
	public void updateInquire(Inquire dto) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void updateInquireAdmin(Inquire dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInquire(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
