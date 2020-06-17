package com.bd.recommend;

import java.util.List;
import java.util.Map;

public interface RecommendService {
	public void writeRecommend(Recommend dto, String pathname) throws Exception;
	public List<Recommend> listRecommend(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Recommend readBoard(int num);
	public void updateHitCount(int num) throws Exception;
	public Recommend preReadRecommend(Map<String, Object> map);
	public Recommend nextReadRecommend(Map<String, Object> map);
	public void updateRecommend(Recommend dto, String pathname) throws Exception;
	public void deleteRecommend(int num, String pathname, String userId) throws Exception;
	
	public void insertFile(Recommend dto) throws Exception;
}
