package com.bd.restaurantList;

import java.util.List;
import java.util.Map;

import com.bd.manage.Manage;

public interface RestaurantListService {
	public int dataCount(Map<String, Object> map);
	public List<RestaurantList> listRestaurant(Map<String, Object> map);
	
	
	public RestaurantList readUser(String userId); // 가게정보 상세표
	public void updateUserEnabled(Map<String, Object> map) throws Exception; // alter창 회원상태변경
	public void insertUserState(RestaurantList dto) throws Exception; // 변경된 회원상태 저장 

}
