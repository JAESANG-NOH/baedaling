package com.bd.mypage;

import java.util.HashMap;
import java.util.Map;

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
			dto = dao.selectOne("mypage.readMypage", userIdx);
			
			String y, m, d;
			String birth[] = dto.getBirth().split("-");
			
			y = birth[0];
			m = birth[1];
			d = birth[2];
			
			dto.setYear(y);
			dto.setMonth(m);
			dto.setDate(d);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateUser(Mypage dto) throws Exception {
		try {
			if(dto.getYear()!=null&&dto.getMonth()!=null&&dto.getDate()!=null) {
				dto.setBirth(dto.getYear()+""+dto.getMonth()+""+dto.getDate());
			}
			dao.updateData("mypage.updateuser1", dto);
			dao.updateData("mypage.updateuser2", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteUser(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean checkPwd(int userIdx, String userPwd) {
		boolean result = false; 
		try {
			 Map<Object, Object> map = new HashMap<>();
			 map.put("userIdx", userIdx);
			 map.put("userPwd", userPwd);
			 
			int count = dao.selectOne("mypage.checkPwd", map);
			
			 if(count==1) result = true;
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
