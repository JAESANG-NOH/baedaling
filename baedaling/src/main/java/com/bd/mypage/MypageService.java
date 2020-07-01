package com.bd.mypage;

import java.util.Map;

public interface MypageService {
	
	public Mypage readMypage (int userIdx);
	
	public boolean checkPwd(int userIdx, String userPwd);
	
	public void updateUser(Mypage dto) throws Exception;
	public void deleteUser(Map<String, Object> map) throws Exception;
}
