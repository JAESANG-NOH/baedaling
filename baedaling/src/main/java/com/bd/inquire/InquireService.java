package com.bd.inquire;

import java.util.List;
import java.util.Map;

public interface InquireService {
	public void insertInquire(Inquire dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Inquire> listInquire(Map<String, Object> map); // 문의 목록
	
	
	public Inquire readInquire(int num); // 글보기
	
	
	public void updateInquireAdmin(Inquire dto) throws Exception; // admin이 답변달기
	public void updateInquire(Inquire dto) throws Exception; // 유저가 글수정

	public void deleteInquire(int num) throws Exception; // 유저, 어드민 글삭제
	
}
