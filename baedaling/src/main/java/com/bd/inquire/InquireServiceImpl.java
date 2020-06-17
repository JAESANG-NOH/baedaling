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
	public void insertInquire(Inquire dto, String mode) throws Exception {
		try {
			dao.insertData("inquire.insertInquire", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	@Override
	public int dataCount(Map<String, Object> map) {
		return 0;
	}

	@Override
	public List<Inquire> listInquire(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Inquire> relationInquire(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Inquire readInquire(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateInquireState(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateInquire(Inquire dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInquire(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
