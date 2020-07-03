package com.bd.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public Mypage readMypage (int userIdx);
	
	public void updateUser(Mypage dto) throws Exception;
	public void deleteUser(Map<String, Object> map) throws Exception;
	
	public List<Mypage> orderlist(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
}
