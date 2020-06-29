package com.bd.foodorder;

import java.util.List;
import java.util.Map;

public interface FoodOrderService {
	public List<FoodOrder> readOrder(Map<String, Object> map);
	public int orderCount(Map<String, Object> map);
	
	//매출
	public FoodOrder todaySalesRead(int restaurantsNum);
	public FoodOrder monthlySalesRead(int restaurantsNum);
	public FoodOrder annualSalesRead(int restaurantsNum);
	
	//베스트메뉴
	public List<FoodOrder> bestMenuChart(int restaurantsNum);
}

