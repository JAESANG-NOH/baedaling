package com.bd.foodorder;

import java.util.List;
import java.util.Map;

public interface FoodOrderService {
	public List<FoodOrder> readOrder(Map<String, Object> map);
	public int orderCount(Map<String, Object> map);
}

