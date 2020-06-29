package com.bd.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bd.common.dao.CommonDAO;

@Service("mypage.mypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Mypage readMypage(int userIdx) {
		Mypage dto = null;
		try {
			dto = dao.selectOne("userinfo.readMypage", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
