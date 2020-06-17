package com.bd.inquire;

import java.util.List;
import java.util.Map;

public interface InquireService {
	public void insertInquire(Inquire dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Inquire> listInquire(Map<String, Object> map);
	
	public List<Inquire> relationInquire(int num);
	public Inquire readInquire(int num);
	
	public void updateInquireState(Map<String, Object> map) throws Exception;
	public void updateInquire(Inquire dto) throws Exception;
	public void deleteInquire(int num) throws Exception;
	
}
